import 'package:get/get.dart';

class CounterController extends GetxController{
  var number = 0.obs;

  void add() => number++;
}
