

import 'a_o_c_2022/advents2022.dart';

void main(List<String> args) {
  final Map adventsSolution = {'Day 1 - Calories Counting': caloriesCounting()};

  adventsSolution.forEach((key, value) {
    print('$key -> Solution $value');
  });
}
