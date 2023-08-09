import 'dart:io';

import 'package:flutter/material.dart';
import 'package:product/app/data/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.item});
  final Product item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // dense: true,

      minVerticalPadding: 18,
      isThreeLine: true,
      visualDensity: const VisualDensity(vertical: 4, horizontal: 4),
      leading: SizedBox(
          height: 115,
          child: Image.file(
            File(item.img!),
            height: 115,
            width: 100,
            fit: BoxFit.fill,
          )),
      title: Text(
        item.name!,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                item.price.toString(),
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const Text("دولار"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: const Color(0xa1A1A1A1),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(item.providerName!)),
        ],
      ),
    );
  }
}
