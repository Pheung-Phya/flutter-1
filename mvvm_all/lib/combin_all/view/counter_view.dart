import 'package:flutter/material.dart';
import 'package:mvvm_all/bloc_mvc/controller/count_bloc.dart';
import 'package:mvvm_all/combin_all/controller/theme_controller.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = Provider.of<CounterBloc>(context, listen: false);
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Combined BLoC, GetX, Provider'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => themeController.toggleTheme(), // Correctly call toggleTheme
          ),
        ],
      ),
      body: StreamBuilder<int>(
        stream: counterBloc.counterStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter: ${snapshot.data}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: counterBloc.increment,
                    child: const Text('Increment'),
                  ),
                  ElevatedButton(
                    onPressed: counterBloc.reset,
                    child: const Text('Reset'),
                  ),
                  const SizedBox(height: 20),
                  Obx(() => Text(
                        'Theme: ${themeController.isDarkTheme.value ? "Dark" : "Light"}',
                      )),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
