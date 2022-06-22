import 'dart:math';

class BodyMassIndex {
  String gender = "";
  double height = 180;
  int weight = 50;
  int age = 20;
  double bmi_result = 0.0;

  String calculateBMI() {
    bmi_result = weight / pow(height / 100, 2);
    return bmi_result.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi_result >= 25) {
      return 'Overweight';
    } else if (bmi_result > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (bmi_result >= 25) {
      return 'Anda memiliki berat badan yang lebih tinggi dari rata-rata. Cobalah untuk lebih banyak berolahraga. Semangat!!!';
    } else if (bmi_result >= 18.5) {
      return 'Anda memiliki berat badan normal. Kerja yang bagus!!!';
    } else {
      return 'Anda memiliki berat badan yang lebih rendah dari rata-rata. Anda bisa makan sedikit lebih banyak. Dan Jangan lupa Berolah-raga!';
    }
  }
}
