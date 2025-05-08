import 'package:get/get.dart';

class ControllerHomePage extends GetxController {
  String saldo = 'R\$ 0,00';
  bool eyesValeu = true;

  void showValue() {
    eyesValeu = !eyesValeu;
    update();
  }
}
