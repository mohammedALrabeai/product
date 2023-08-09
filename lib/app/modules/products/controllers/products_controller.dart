import 'package:get/get.dart';
import 'package:product/app/data/product_model.dart';

import '../../../data/category_model.dart';

class ProductsController extends GetxController {
  //TODO: Implement ProductsController

 final productList=[
   Product(id: 1,name: "هذا النص هو مثال لنص",img: "assets/image/img_4.png",price: 120.0,providerName: "اسم المتجر"),
   Product(id: 2,name: "هذا النص هو مثال لنص",img: "assets/image/img_5.png",price: 120.0,providerName: "اسم المتجر"),
   Product(id: 3,name: "هذا النص هو مثال لنص",img: "assets/image/img_6.png",price: 120.0,providerName: "اسم المتجر"),
   Product(id: 4,name: "هذا النص هو مثال لنص",img: "assets/image/img_7.png",price: 120.0,providerName: "اسم المتجر"),
 ];
 final categoryList=[
   Category(id: 1,img: "assets/image/img_1.png", title: "عرض الكل"),
   Category(id: 2,img: "assets/image/img_8.png", title: "تصنيف 1"),
   Category(id: 3,img: "assets/image/img_2.png", title: "تصنيف 2"),
   Category(id: 4,img: "assets/image/img_3.png", title: "تصنيف 3"),
 ];
 final selectedCategory=Category().obs;
  @override
  void onInit() {
    selectedCategory.value=categoryList.first;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
