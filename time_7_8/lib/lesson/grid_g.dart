import 'package:flutter/material.dart';

class GridG extends StatelessWidget {
  const GridG({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, childAspectRatio: 0.7),
        children: [
          for (int i = 0; i < 10; i++) showCard(),
        ],
      ),
    );
  }

  Widget showCard() {
    return Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/monkey1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Row(
              children: [
                Text(
                  'Price : ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '5000\$',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(children: [
              ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                  child: const Text(
                    'Bye',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  )),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 226, 126, 160))),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ))
            ])
          ],
        ));
  }
}
