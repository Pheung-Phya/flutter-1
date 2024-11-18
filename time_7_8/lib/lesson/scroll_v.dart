import 'package:flutter/material.dart';

class ScrollV extends StatelessWidget {
  const ScrollV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                width: 500,
                height: 300,
                color: Colors.amber,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/monkey1.png',
                        fit: BoxFit.contain,
                      ),
                      Image.asset(
                        'assets/images/monkey1.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/monkey1.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                )),
            Container(
              width: 500,
              height: 300,
              color: Colors.amber,
              child: Image.asset(
                'assets/images/monkey1.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 500,
              height: 300,
              color: Colors.amber,
              child: Image.asset(
                'assets/images/monkey1.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 500,
              height: 300,
              color: Colors.amber,
              child: Image.asset(
                'assets/images/monkey1.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 500,
              height: 300,
              color: Colors.amber,
              child: Image.asset(
                'assets/images/monkey1.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 500,
              height: 300,
              color: Colors.amber,
              child: Image.asset(
                'assets/images/monkey1.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
