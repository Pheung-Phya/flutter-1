// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               color: Colors.blue,
//               child: TabBar(
//                 controller: _tabController,
//                 tabs: [
//                   Tab(icon: Icon(Icons.directions_car), text: 'Car'),
//                   Tab(icon: Icon(Icons.directions_transit), text: 'Transit'),
//                   Tab(icon: Icon(Icons.directions_bike), text: 'Bike'),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   Center(child: Text('Car Page')),
//                   Center(child: Text('Transit Page')),
//                   Center(child: Text('Bike Page')),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Scrollable TabBarView'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car), text: 'Car'),
                Tab(icon: Icon(Icons.directions_transit), text: 'Transit'),
                Tab(icon: Icon(Icons.directions_bike), text: 'Bike'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Each tab contains a scrollable widget (SingleChildScrollView in this case)
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      10,
                      (index) => ListTile(
                            title: Text('Car item $index'),
                          )),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      20,
                      (index) => ListTile(
                            title: Text('Transit item $index'),
                          )),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      30,
                      (index) => ListTile(
                            title: Text('Bike item $index'),
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
