import 'package:flutter/material.dart';
import 'package:twitter/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';

enum Errors {none, matchError, weakError, existsError, error, wrongError, noUserError}

class Auth extends ChangeNotifier {
  final firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;
  final usersRef = FirebaseFirestore.instance.collection('users').withConverter<User>(
            fromFirestore: (snapshot, _) {
              return User.fromJson(
                snapshot.data() ?? {},
              );
            },
            toFirestore: (user, _) => user.toJson(),
          );

  attemptSignUp(email, name, password, passwordConfirmation) async {
    if (password != passwordConfirmation) {
      return Errors.matchError;
    }
    try {
      final credentials = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User newUser = User(key: credentials.user?.uid, email: email, displayName: name);
      await usersRef.add(newUser);
      return Errors.none;
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        return Errors.weakError;
      } else if (e.code == 'email-already-in-use') {
        return Errors.existsError;
      }
    } catch (e) {
      return Errors.error;
    }
  }
}
