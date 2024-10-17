
  // use for bloc mvc
// import 'package:flutter/material.dart';
// import 'package:mvvm_all/bloc_mvc/view/count_view.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: CounterView(),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:mvvm_all/bloc_mvc/controller/count_bloc.dart';
import 'package:mvvm_all/combin_all/controller/theme_controller.dart';
import 'package:mvvm_all/combin_all/view/counter_view.dart';

import 'package:provider/provider.dart';
import 'package:get/get.dart';


void main() {
  Get.put(ThemeController());
  runApp(
    MultiProvider(
      providers: [
        Provider<CounterBloc>(create: (_) => CounterBloc()),  // Inject BLoC
      ],
      child: GetMaterialApp(
        title: 'Combined State Management',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,  // Default theme mode
        home: CounterView(),
      ),
    ),
  );
}






