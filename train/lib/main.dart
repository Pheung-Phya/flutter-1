// import 'package:flutter/material.dart';

// class MyResponsiveApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Responsive App')),
//         body: Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Container(
//                 color: Colors.blue,
//                 child: Center(child: Text('Top Section')),
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Container(
//                 color: Colors.green,
//                 child: Center(child: Text('Bottom Section')),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() => runApp(MyResponsiveApp());

// import 'package:flutter/material.dart';

// class MyResponsiveApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Responsive App')),
//         body: Center(
//           child: Container(
//             width: screenWidth * 0.8, // 80% of screen width
//             height: screenHeight * 0.5, // 50% of screen height
//             color: Colors.blue,
//             child: Center(
//                 child:
//                     Text('Resize Me!', style: TextStyle(color: Colors.white))),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() => runApp(MyResponsiveApp());

import 'package:flutter/material.dart';

class MyResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Responsive App')),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Container(
                width: constraints.maxWidth * 0.8,
                height: constraints.maxHeight * 0.5,
                color: Colors.blue,
                child: Center(
                    child: Text('Resize Me!',
                        style: TextStyle(color: Colors.white))),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() => runApp(MyResponsiveApp());
