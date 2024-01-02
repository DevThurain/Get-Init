import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_init/counter/counter_controller.dart';

class CounterPage extends StatelessWidget {
  static const routeName = '/counter_page';
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Page')),
      body: Expanded(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Text(
                counterController.number.value.toString(),
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: PressableDough(
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            counterController.add();
          },
        ),
      ),
    );
  }
}
