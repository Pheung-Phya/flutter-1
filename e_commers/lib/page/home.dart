import 'package:e_commers/widget/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories = [
    'images/headphone2.png',
    'images/laptop.png',
    'images/watch.png',
    'images/TV.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 204, 204),
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text(
                    'Hey, Phya',
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Text(
                    'Good Morning',
                    style: AppWidget.lightTextFieldStyle(),
                  )
                ]),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/boy.jpg',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search Products',
                      hintStyle: AppWidget.lightTextFieldStyle(),
                      border: InputBorder.none,
                      //suffixIcon: Icon(Icons.search),
                      prefixIcon: Icon(Icons.search)),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: AppWidget.semiboldTextFieldStyle(),
                ),
                Text(
                  'See All',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(right: 10),
                  height: 130,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 224, 33, 33),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'All',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 130,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoriesTile(image: categories[index]);
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: AppWidget.semiboldTextFieldStyle(),
                ),
                Text(
                  'See All',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 230,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/headphone2.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'Head Phone',
                          style: AppWidget.boldTextFieldStyle(),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$100',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[900]),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.amber[900],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/laptop.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'LapTop',
                          style: AppWidget.boldTextFieldStyle(),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$790',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[900]),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.amber[900],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/watch2.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'App Watch',
                          style: AppWidget.boldTextFieldStyle(),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$150',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[900]),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.amber[900],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoriesTile extends StatelessWidget {
  String image;
  CategoriesTile({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 20),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}
