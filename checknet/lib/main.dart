// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: NetworkCheckScreen(),
//     );
//   }
// }

// class NetworkCheckScreen extends StatefulWidget {
//   @override
//   _NetworkCheckScreenState createState() => _NetworkCheckScreenState();
// }

// class _NetworkCheckScreenState extends State<NetworkCheckScreen> {
//   String _connectionStatus = 'Unknown';

//   @override
//   void initState() {
//     super.initState();
//     checkNetwork();
//   }

//   // Check the current network status
//   void checkNetwork() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     setState(() {
//       if (connectivityResult == ConnectivityResult.mobile) {
//         _connectionStatus = 'Connected to Mobile Network';
//       } else if (connectivityResult == ConnectivityResult.wifi) {
//         _connectionStatus = 'Connected to Wi-Fi';
//       } else {
//         _connectionStatus = 'No Network Connection';
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Network Check')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Network Status: $_connectionStatus'),
//             ElevatedButton(
//               onPressed: checkNetwork,
//               child: Text('Check Network'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NetworkCheckScreen(),
    );
  }
}

class NetworkCheckScreen extends StatefulWidget {
  @override
  _NetworkCheckScreenState createState() => _NetworkCheckScreenState();
}

class _NetworkCheckScreenState extends State<NetworkCheckScreen> {
  String _connectionStatus = 'Unknown';

  @override
  void initState() {
    super.initState();
    checkNetwork();  // Check network status on app start
   // listenNetworkChanges();  // Listen to network changes
  }

  // Check the current network status
  void checkNetwork() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      if (connectivityResult == ConnectivityResult.mobile) {
        _connectionStatus = 'Connected to Mobile Network';
      } else if (connectivityResult == ConnectivityResult.wifi) {
        _connectionStatus = 'Connected to Wi-Fi';
      } else {
        _connectionStatus = 'No Network Connection';
      }
    });
  }

  // Listen to network status changes
  // void listenNetworkChanges() {
  //   Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
  //     setState(() {
  //       if (result == ConnectivityResult.mobile) {
  //         _connectionStatus = 'Connected to Mobile Network';
  //       } else if (result == ConnectivityResult.wifi) {
  //         _connectionStatus = 'Connected to Wi-Fi';
  //       } else {
  //         _connectionStatus = 'No Network Connection';
  //       }
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Network Check')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Network Status: $_connectionStatus'),
            ElevatedButton(
              onPressed: checkNetwork,
              child: Text('Check Network'),
            ),
          ],
        ),
      ),
    );
  }
}
