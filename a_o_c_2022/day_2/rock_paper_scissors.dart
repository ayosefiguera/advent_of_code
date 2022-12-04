import 'dart:io';
import 'package:path/path.dart' as p;

const Map<String, int> handOpcion = {'rock': 1, 'paper': 2, 'scissors': 3};

const Map<String, String> inputOption = {
  'A': 'rock',
  'B': 'paper',
  'C': 'scissors',
  'Y': 'paper',
  'X': 'rock',
  'Z': 'scissors',
};

const Map<String, int> futureRound = {
  'X': -1, //lost
  'Y': 0, // draw
  'Z': 1, // win
};

int tornament() {
  int score = 0;
  final filePath =
      p.join(Directory.current.path, 'a_o_c_2022', 'day_2', 'input.txt');
  final fileInput = File(filePath);

  fileInput.readAsLinesSync().forEach((line) {
    final opponentOpt = inputOption[line[0]];
    final myOpt = inputOption[line[2]];
    final nextOpt = futureRound[line[2]];

    //score += scoreRoundPart1(opponentOpt, myOpt);
    score += scoreRoundPart2(opponentOpt, nextOpt);
  });
  return score;
}

int scoreRoundPart2(String opponentOpt, nextOpt) {
  Map rock = {true: 'paper', false: 'scissors'};
  Map scissors = {true: 'rock', false: 'paper'};
  Map paper = {true: 'scissors', false: 'rock'};
  Map table = {'rock': rock, 'paper': paper, 'scissors': scissors};

  if (nextOpt == 1) {
    String myOpt = table[opponentOpt][true];
    print('$opponentOpt vs $myOpt You WIN' );
    return 6 + handOpcion[myOpt];
  } else if (nextOpt == -1) {
    String myOpt = table[opponentOpt][false];
    print('$opponentOpt vs $myOpt You LOST' );

    return handOpcion[myOpt];
  } else {
    print('$opponentOpt vs $opponentOpt You Draw' );
    return (3 + handOpcion[opponentOpt]); // same option
  }
}

int scoreRoundPart1(String opponentOpt, String myOpt) {
  Map rock = {'paper': true, 'scissors': false};
  Map scissors = {'rock': true, 'paper': false};
  Map paper = {'scissors': true, 'rock': false};
  Map table = {'rock': rock, 'paper': paper, 'scissors': scissors};

  if (opponentOpt == myOpt) {
    return (3 + handOpcion[myOpt]);
  }

  if (table[opponentOpt][myOpt]) {
    return 6 + handOpcion[myOpt];
  } else {
    return handOpcion[myOpt];
  }
}
