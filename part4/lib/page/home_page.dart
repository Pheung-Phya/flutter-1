import 'package:flutter/material.dart';
import 'package:part4/widgets/filter_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        children: [
          buildHeader(),
          const SizedBox(
            height: 16,
          ),
          buildSearch(),
          const SizedBox(
            height: 10,
          ),
          buildFilter(),
        ],
      )),
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/phya.jpg'),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Hello X',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          'Food Delivery',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  buildSearch() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          decoration: InputDecoration(
              hintText: 'Search Food',
              suffixIcon: const Icon(Icons.search),
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )),
        )),
        const Card(
          margin: EdgeInsets.only(left: 12),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.filter_list,
              color: Color.fromARGB(255, 43, 10, 211),
              size: 28,
            ),
          ),
        )
      ],
    );
  }

  Widget buildFilter() {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(top: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          FilterButton(title: 'Popular', isSelected: true),
          FilterButton(title: 'Popular', isSelected: false),
          FilterButton(title: 'Popular', isSelected: false),
          FilterButton(title: 'Popular', isSelected: false),
          FilterButton(title: 'Popular', isSelected: false),
          FilterButton(title: 'Popular', isSelected: false)
        ],
      ),
    );
  }
}
