import 'dart:math';

class AppUtil {
  static generateRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(85000) + 12345;
    return randomNumber;
  }

  static bool isNumeric(String str) {
    return double.tryParse(str) != null;
  }
}
