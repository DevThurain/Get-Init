import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_init/network_call/network/network_provider.dart';
import 'package:get_init/network_call/network_call_controller.dart';

class NetworkCallPage extends StatelessWidget {
  static const routeName = '/network_call_page';
  const NetworkCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NetworkCallController controller = Get.put(NetworkCallController());

    return Scaffold(
      appBar: AppBar(title: const Text('Network Call Page')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: controller.obx(
                  (state) => Text(
                        state?.value ?? "--",
                        textAlign: TextAlign.center,
                      ),
                  onLoading: const CircularProgressIndicator(),
                  onError: (message) => Text(message ?? "Unknown Error")),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'invalid_fab',
            child: const Icon(
              Icons.error,
              color: Colors.redAccent,
            ),
            onPressed: () {
              controller.getInvalidJoke();
            },
          ),
          const SizedBox(width: 16.0),
          FloatingActionButton(
            heroTag: 'valid_fab',
            child: const Icon(Icons.refresh),
            onPressed: () {
              controller.getRandomJoke();
            },
          ),
        ],
      ),
    );
  }
}
