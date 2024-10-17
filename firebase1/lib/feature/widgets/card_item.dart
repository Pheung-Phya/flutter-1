import 'package:firebase1/feature/shop/controller/shop_controller.dart';
import 'package:firebase1/feature/shop/models/form.dart';
import 'package:firebase1/feature/shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItem extends StatelessWidget {
  CardItem({super.key, required this.product, required this.docId});

  final ProductModel product;
  final String docId;

  final controller = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Get.bottomSheet(
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.white,
            child: Column(
              children: [
                TextButton(
                  onPressed: () => Get.to(
                    FormProduct(
                      product: product,
                      docId: docId,
                    ),
                  ),
                  child: Text('Update',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                TextButton(
                  onPressed: () async => controller.deleteProduct(docId),
                  child: Text(
                    'Delete',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(product.image),
            ),
            Text(
              product.title,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: Colors.grey[700],
                  ),
            ),
            Text(
              '\$ ${product.price}',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: Colors.black,
                    fontWeightDelta: DateTime.may,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}