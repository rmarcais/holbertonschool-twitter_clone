List postList = [
  {
    'name': 'Mario',
    'username': '@SuperMario',
    'content': "I'm-a gonna get you! - Mario Kart 7 and Mario Kart Wii I'm-a gonna get you! - Mario Kart 7 and Mario Kart Wii I'm-a gonna get you! - Mario Kart 7 and Mario Kart Wii I'm-a gonna get you! - Mario Kart 7 and Mario Kart Wii",
    'imgUrl':
        'https://upload.wikimedia.org/wikipedia/en/thumb/a/a9/MarioNSMBUDeluxe.png/220px-MarioNSMBUDeluxe.png',
    'isVerified': true,
    'likes': 2,
    'retweets': 4,
    'comments': 1
  },
  {
    'name': 'Luigi',
    'username': '@GreenMachine',
    'content': "I'm the better brother! I'm the better brother!I'm the better brother!",
    'imgUrl':
        'data:image/jpeg;base64,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',
    'isVerified': false,
    'likes': 2,
    'retweets': 1,
    'comments': 0
  },

  {
    'name': 'Peach',
    'username': '@PrincessPeach',
    'content': "I'm the princess of the Mushroom Kingdom!",
    'imgUrl':
        'https://upload.wikimedia.org/wikipedia/en/thumb/1/16/Princess_Peach_Stock_Art.png/220px-Princess_Peach_Stock_Art.png',
    'isVerified': true,
    'likes': 72,
    'retweets': 47,
    'comments': 8
  },
  {
    'name': 'Bowser',
    'username': '@KingKoopa',
    'content': "I'll kidnap Peach over and over! I'll kidnap Peach over and over! I'll kidnap Peach over and over! I'll kidnap Peach over and over! I'll kidnap Peach over and over!",
    'imgUrl':
        'https://upload.wikimedia.org/wikipedia/en/9/92/Bowser_Stock_Art_2021.png',
    'isVerified': false,
    'likes': 102,
    'retweets': 54,
    'comments': 36
  },
];
