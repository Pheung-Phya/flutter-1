import 'package:flutter/material.dart';
import 'package:project_1/model/model.dart';

class BasicAppBody extends StatelessWidget {
  const BasicAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) => Product(shop: list[index])),
    );
  }
}

class Product extends StatefulWidget {
  Product({super.key, required this.shop});
  Shop shop;
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 170,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage(widget.shop.image), fit: BoxFit.fill)))
        ],
      ),
    );
  }
}
