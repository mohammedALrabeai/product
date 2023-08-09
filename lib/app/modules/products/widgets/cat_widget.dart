import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/category_model.dart';
import '../controllers/products_controller.dart';

class CategoryWidget extends GetView<ProductsController> {
  const CategoryWidget({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> InkWell(
        onTap: (){
          controller.selectedCategory.value=category;
          controller.selectedCategory.refresh();
        },
        child: Container(
          height: 114,
          width: 96,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              border: controller.selectedCategory.value.id==category.id?Border.all(color: Colors.green):null,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(

                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(category.img!,)),
              Text(
                category.title!,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
