import 'package:get/get.dart';
import 'package:product/app/data/product_model.dart';
import 'package:product/app/providers/helper_provider.dart';

import '../../../data/category_model.dart';

class ProductsController extends GetxController {
  //TODO: Implement ProductsController
  final productList = <Product>[].obs;
  final productListOrg = <Product>[].obs;
  // final productList=[
  //   Product(id: 1,name: "هذا النص هو مثال لنص",img: "assets/image/img_4.png",price: 120.0,providerName: "اسم المتجر"),
  //   Product(id: 2,name: "هذا النص هو مثال لنص",img: "assets/image/img_5.png",price: 120.0,providerName: "اسم المتجر"),
  //   Product(id: 3,name: "هذا النص هو مثال لنص",img: "assets/image/img_6.png",price: 120.0,providerName: "اسم المتجر"),
  //   Product(id: 4,name: "هذا النص هو مثال لنص",img: "assets/image/img_7.png",price: 120.0,providerName: "اسم المتجر"),
  // ];
  final categoryList = [
    Category(id: 1, img: "assets/image/img_1.png", title: "عرض الكل"),
    Category(id: 2, img: "assets/image/img_8.png", title: "تصنيف 1"),
    Category(id: 3, img: "assets/image/img_2.png", title: "تصنيف 2"),
    Category(id: 4, img: "assets/image/img_3.png", title: "تصنيف 3"),
  ];

  final selectedCategory = Category().obs;
  @override
  void onInit() {
    getProdduct();
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

  getProdduct() async {
    DataBase db = DataBase();
    productList.value = await db.getAllProducts();
    productListOrg.assignAll(productList.value);
    productList.refresh();
    selectedCategory.value = categoryList.first;
  }

  filter() {
    switch (selectedCategory.value.id) {
      case 1:
        productList.assignAll(productListOrg);
        break;
      default:
        productList.assignAll(productListOrg
            .where((p0) => p0.category == selectedCategory.value.id));
        break;
    }
  }
}
