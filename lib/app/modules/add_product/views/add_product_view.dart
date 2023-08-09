import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/category_model.dart';
import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'اضافة منتجات',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        centerTitle: true,
        // toolbarHeight: 70,
        leading: const Card(
          child: SizedBox(
            width: 50,
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: controller.saveProduct,
        child: Container(
          height: 60,
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(14)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "اضافه المنتج",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: controller.keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 18.0),
                  child: Text(
                    "صور المنتج",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Obx(
                  () => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 100,
                      child: Row(
                          children: controller.product.value.images
                              .map((e) => Container(
                                    width: 100,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
                                            child: Image.file(File(e))),
                                        InkWell(
                                          onTap: (){
                                            controller.product.value.images.remove(e);
                                            if(controller.product.value.images.isNotEmpty) {
                                              controller.product.value.img=controller.product.value.images.last;
                                            }
                                            controller.product.refresh();
                                          },
                                          child: const Align(
                                            alignment: Alignment.topLeft,
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.red,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList()),
                    ),
                  ),
                ),
                InkWell(
                  onTap: controller.addImage,
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(14)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          "اضغط لاضافة الصور",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "اسم المنتج",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                TextFormField(
                  validator: (input)=>input!.isEmpty?"اسم المنتج":null,
                  onSaved: (input)=>controller.product.value.name=input,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)),
                    hintText: "اسم المنتج",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "اسم المتجر",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                TextFormField(
                  validator: (input)=>input!.isEmpty?"اسم المتجر":null,
                  onSaved: (input)=>controller.product.value.providerName=input,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)),
                    hintText: "اسم المتجر",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "السعر",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (input)=>input!.isEmpty?"السعر":int.parse(input)>0?null:"اكبر من ٠",
                  onSaved: (input)=>controller.product.value.price=double.tryParse(input!),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)),
                    hintText: "السعر",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "التصنيف",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                Obx(
                  () => DropdownButton<Category>(
                    borderRadius: BorderRadius.circular(14),

                    isExpanded: true,
                    hint: const Text("اسم التصنيف"),
                    // Initial Value
                    value: controller.selectedCategory.value.hasData
                        ? controller.selectedCategory.value
                        : null,

                    // Down Arrow Icon
                    icon: const Icon(Icons.arrow_circle_down_outlined),

                    // Array list of items
                    items: controller.categoryList.map((Category items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items.title!),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (newValue) {
                      controller.selectedCategory.value = newValue!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
