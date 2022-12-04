import 'dart:io';
import 'package:path/path.dart' as p;

// part 1
int caloriesCounting() {
  int currentCalorie = 0;
  List<int> topCalories = [];
  final filePath = p.join(
      Directory.current.path, 'a_o_c_2022', 'day_1', 'input.txt');

  File file = File(filePath);

  file.readAsLinesSync().forEach((element) {
    if (element == '') {
      topCalories.add(currentCalorie);
      currentCalorie = 0;
    } else {
      currentCalorie += int.parse(element);
    }
  });

  topCalories.sort((a, b) => compareNumber(a, b));
  // part1 solution topCalories[0]
  // part2 Solution sum(topCalories[0] + topCalories[2] + topCalories[3] )
  final int solution = topthree(topCalories);

  return solution;
}

int compareNumber(int a, int b) {
  if (a > b) {
    return -1;
  } else if (a < b) {
    return 1;
  } else {
    return 0;
  }
}

topthree(List<int> list) {
  int top_three = 0;
  for (int i = 0; i < 3; i++) {
    top_three += list[i];
  }
  return top_three;
}
