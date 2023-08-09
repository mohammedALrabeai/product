import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product/app/modules/products/widgets/product_item_widget.dart';

import '../controllers/products_controller.dart';
import '../widgets/cat_widget.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'المنتجات',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        centerTitle: true,
        // toolbarHeight: 70,
        actions: [
          Card(
            child: SizedBox(
              width: 50,
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Text("التصنيفات",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.categoryList.map((e) => CategoryWidget(category:e)).toList()

                // [
                //   CategoryWidget(
                //       img: "assets/image/img_1.png", title: "عرض الكل"),
                //   CategoryWidget(
                //       img: "assets/image/img_8.png", title: "تصنيف 1"),
                //   CategoryWidget(
                //       img: "assets/image/img_2.png", title: "تصنيف 2"),
                //   CategoryWidget(
                //       img: "assets/image/img_3.png", title: "تصنيف 3"),
                // ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.category,
                        color: Colors.red,
                      ),
                      Text(
                        "تغيير عرض المنتجات الى افقي",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                itemExtent: 105.0,
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  var item = controller.productList.elementAt(index);
                  return ProductItemWidget(item: item);
                })
          ],
        ),
      ),
    );
  }
}
