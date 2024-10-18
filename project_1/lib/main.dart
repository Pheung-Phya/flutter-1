// import 'package:flutter/material.dart';
// import 'package:project_1/view/home_page.dart';

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
//       home: HomePage(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ScrollHideText(),
//     );
//   }
// }

// class ScrollHideText extends StatefulWidget {
//   @override
//   _ScrollHideTextState createState() => _ScrollHideTextState();
// }

// class _ScrollHideTextState extends State<ScrollHideText> {
//   ScrollController _scrollController = ScrollController();
//   bool _isTextVisible = true;

//   @override
//   void initState() {
//     super.initState();

//     _scrollController.addListener(() {
//       if (_scrollController.position.userScrollDirection ==
//           ScrollDirection.reverse) {
//         if (_isTextVisible) {
//           setState(() {
//             _isTextVisible = false; // Hide text on scroll down
//           });
//         }
//       } else if (_scrollController.position.userScrollDirection ==
//           ScrollDirection.forward) {
//         if (!_isTextVisible) {
//           setState(() {
//             _isTextVisible = true; // Show text on scroll up
//           });
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Scroll Hide Text')),
//       body: Column(
//         children: [
//           AnimatedOpacity(
//             opacity: _isTextVisible ? 1.0 : 0.0,
//             duration: Duration(milliseconds: 300),
//             child: Container(
//               padding: EdgeInsets.all(16.0),
//               child: Text(
//                 'This text hides when you scroll down and shows when you scroll up.',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               controller: _scrollController,
//               itemCount: 30,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('Item $index'),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FacebookLikeScroll(),
//     );
//   }
// }

// class FacebookLikeScroll extends StatefulWidget {
//   @override
//   _FacebookLikeScrollState createState() => _FacebookLikeScrollState();
// }

// class _FacebookLikeScrollState extends State<FacebookLikeScroll> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           // Collapsible AppBar like Facebook's header
//           SliverAppBar(
//             floating: true,
//             pinned: true,
//             snap: false,
//             backgroundColor: Colors.blueAccent,
//             expandedHeight: 200.0,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('Facebook-Like Header'),
//               background: Image.asset('assets/images/phya.jpg'),
//             ),
//           ),

//           // Main content (like a scrollable feed)
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.blueAccent,
//                     child: Icon(Icons.person),
//                   ),
//                   title: Text('User $index'),
//                   subtitle: Text('This is a sample post #$index.'),
//                 );
//               },
//               childCount: 30, // Number of items in the list
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FacebookLikeScroll(),
//     );
//   }
// }

// class FacebookLikeScroll extends StatefulWidget {
//   @override
//   _FacebookLikeScrollState createState() => _FacebookLikeScrollState();
// }

// class _FacebookLikeScrollState extends State<FacebookLikeScroll> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [Icon(Icons.chat)],
//       ),
//       body: CustomScrollView(
//         slivers: [
//           // Collapsible SliverAppBar with Search Bar that hides on scroll
//           SliverAppBar(
//             backgroundColor: Colors.blueAccent,
//             floating: true, // The AppBar appears immediately when scrolling up
//             pinned: true, // The title stays pinned at the top
//             snap: true, // Smoothly snap the AppBar when scrolling up
//             expandedHeight: 150.0,
//             title: Text('face'),
//             flexibleSpace: FlexibleSpaceBar(
//               //  title: Text('Facebook-Like Scroll'),
//               centerTitle: true,
//               background: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.search),
//                         hintText: 'Search...',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // Main content (like a scrollable feed)
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.blueAccent,
//                     child: Icon(Icons.person),
//                   ),
//                   title: Text('User $index'),
//                   subtitle: Text('This is a sample post #$index.'),
//                 );
//               },
//               childCount: 30, // Number of items in the list
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FacebookLikeScroll(),
//     );
//   }
// }

// class FacebookLikeScroll extends StatefulWidget {
//   @override
//   _FacebookLikeScrollState createState() => _FacebookLikeScrollState();
// }

// class _FacebookLikeScrollState extends State<FacebookLikeScroll> {
//   ScrollController _scrollController = ScrollController();
//   bool _isIconVisible = true;

//   @override
//   void initState() {
//     super.initState();

//     // Listen to the scroll controller to hide the icon on scroll up
//     _scrollController.addListener(() {
//       if (_scrollController.position.userScrollDirection ==
//           ScrollDirection.reverse) {
//         if (_isIconVisible) {
//           setState(() {
//             _isIconVisible = false;
//           });
//         }
//       } else if (_scrollController.position.userScrollDirection ==
//           ScrollDirection.forward) {
//         if (!_isIconVisible) {
//           setState(() {
//             _isIconVisible = true;
//           });
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: [
//           // Collapsible SliverAppBar with Search Bar
//           SliverAppBar(
//             backgroundColor: Colors.blueAccent,
//             floating: true, // The AppBar appears immediately when scrolling up
//             pinned: true, // The title stays pinned at the top
//             snap: true, // Smoothly snap the AppBar when scrolling up
//             expandedHeight: 150.0,
//             title: Text('face'),
//             flexibleSpace: FlexibleSpaceBar(
//               centerTitle: true,
//               background: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.search),
//                         hintText: 'Search...',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             actions: [
//               AnimatedOpacity(
//                 opacity: _isIconVisible ? 1.0 : 0.0,
//                 duration: Duration(milliseconds: 300),
//                 child: Icon(Icons.chat),
//               ),
//             ],
//           ),

//           // Main content (like a scrollable feed)
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.blueAccent,
//                     child: Icon(Icons.person),
//                   ),
//                   title: Text('User $index'),
//                   subtitle: Text('This is a sample post #$index.'),
//                 );
//               },
//               childCount: 30, // Number of items in the list
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FacebookLikeScroll(),
    );
  }
}

class FacebookLikeScroll extends StatefulWidget {
  @override
  _FacebookLikeScrollState createState() => _FacebookLikeScrollState();
}

class _FacebookLikeScrollState extends State<FacebookLikeScroll> {
  ScrollController _scrollController = ScrollController();
  bool _areIconsVisible = true;

  @override
  void initState() {
    super.initState();

    // Scroll listener to hide icons on scroll up
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_areIconsVisible) {
          setState(() {
            _areIconsVisible = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_areIconsVisible) {
          setState(() {
            _areIconsVisible = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add a BottomAppBar with action icons
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Handle home button press
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Handle search button press
              },
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {
                // Handle add post button press
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notifications button press
              },
            ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Handle menu button press
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          // Handle action when floating button is pressed (e.g., create new post)
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Collapsible SliverAppBar with Menu and Icons
          SliverAppBar(
            backgroundColor: Colors.blueAccent,
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: 150.0,
            title: Text('Facebook Clone'),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              // Animated icons for chat, notifications, and menu
              AnimatedOpacity(
                opacity: _areIconsVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.chat),
                      onPressed: () {
                        // Chat button functionality
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        // Notifications button functionality
                      },
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert),
                      onSelected: (value) {
                        // Handle menu selection
                        print(value);
                      },
                      itemBuilder: (BuildContext context) {
                        return {'Settings', 'Logout'}.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Main content (like a scrollable feed)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.person),
                  ),
                  title: Text('User $index'),
                  subtitle: Text('This is a sample post #$index.'),
                );
              },
              childCount: 30, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}
