import 'package:class_1/widget/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List<String> image = [
    'images/icon.png',
    'images/TV.png',
    'images/watch.png',
    'images/watch2.png'
  ];

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network call
    setState(() {
      image.add('images/watch.png'); // Simulate new data
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 234, 234),
      body: RefreshIndicator(
        onRefresh: () async {
          _refresh();   
        },
        child: SingleChildScrollView(
          // Wrap the Column with SingleChildScrollView
          physics: const AlwaysScrollableScrollPhysics(), // Enable scrolling
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey Flutter',
                          style: AppWidget.boldTextStyle(),
                        ),
                        Text(
                          'Good Morning',
                          style: AppWidget.lightTextStyle(),
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 208, 175, 83),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'images/icon.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Product',
                      hintStyle: AppWidget.lightTextStyle(),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Categories',
                      style: AppWidget.boldTextStyle(),
                    ),
                    const Spacer(),
                    Text(
                      'see all',
                      style: AppWidget.seaAll(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 22, 22),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 80,
                      height: 130,
                      child: const Text(
                        'All',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 130,
                        decoration: const BoxDecoration(),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: image.length,
                          itemBuilder: (context, index) {
                            return Product(image: image[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.amber,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            elevation: 0,
            currentIndex: index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  final String image;
  const Product({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 90,
      width: 90,
      child: Column(
        children: [
          Image.asset(
            image,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 5),
          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
