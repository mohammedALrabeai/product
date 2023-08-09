import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product/app/data/product_model.dart';
import 'package:product/app/providers/helper_provider.dart';

import '../../../data/category_model.dart';

class AddProductController extends GetxController {
  //TODO: Implement AddProductController
final product=Product().obs;
final categoryList=[
  // Category(id: 1,img: "assets/image/img_1.png", title: "عرض الكل"),
  Category(id: 2,img: "assets/image/img_8.png", title: "تصنيف 1"),
  Category(id: 3,img: "assets/image/img_2.png", title: "تصنيف 2"),
  Category(id: 4,img: "assets/image/img_3.png", title: "تصنيف 3"),
];
final selectedCategory=Category().obs;

  var keyForm=GlobalKey<FormState>();

  @override
  void onInit() {
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


  Future<void> addImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      product.value.images.add(image.path);
      product.value.img=image.path;
      product.refresh();
    }
  }

   saveProduct() async {
    if(keyForm.currentState!.validate()) {
      if(!selectedCategory.value.hasData){
        Get.snackbar("التصنيف", "اختر تصنيف");
        return;
      }

      keyForm.currentState!.save();
      product.value.category=selectedCategory.value.id;
      DataBase dataBase = DataBase();
      await dataBase.saveProduct(product.value);
      Get.back();
    }
  }
}
