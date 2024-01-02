import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_init/counter/counter_page.dart';
import 'package:get_init/detail/detail_page.dart';
import 'package:get_init/network_call/network_call_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate.fixed([
            ListTile(
              title: const Text('Counter'),
              subtitle: const Text('Handle counter state with GetX.'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Get.toNamed(CounterPage.routeName);
              },
            ),
            ListTile(
              title: const Text('Network Call'),
              subtitle: const Text('Handle network call state with GetX.'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Get.toNamed(NetworkCallPage.routeName);
              },
            ),
          ]))
        ],
      ),
      floatingActionButton: PressableDough(
        child: FloatingActionButton(
          child: const Icon(Icons.chevron_right),
          onPressed: () {
            Get.toNamed(DetailPage.routeName);
          },
        ),
      ),
    );
  }
}
