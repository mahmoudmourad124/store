import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product_service.dart';
import 'package:store/widget/custom_button.dart';
import 'package:store/widget/custom_text_filed.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  dynamic price;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                CustomTextFiled(
                    keyboardType: TextInputType.name,
                    onChanged: (data) {
                      productName = data;
                    },
                    hintText: 'Product Name'),
                SizedBox(height: 10),
                CustomTextFiled(
                    onChanged: (data) {
                      desc = data;
                    },
                    hintText: 'Desription'),
                SizedBox(height: 10),
                CustomTextFiled(
                    keyboardType: TextInputType.number,
                    onChanged: (data) {
                      price = int.parse(data);
                    },
                    hintText: 'Price'),
                SizedBox(height: 10),
                CustomTextFiled(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: 'Image'),
                SizedBox(height: 50),
                CustomButton(
                  buttonName: 'Update',
                  ontap: () {
                    isloading = true;
                    setState(() {});
                    try {
                      updateProduct(productModel);
                      print('succes');
                    } catch (e) {
                      throw Exception(e.toString());
                    }

                    isloading = false;
                    print('succes2');

                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateProduct(ProductModel product) {
    UpdateProductService().updateProduct(
        id: UpdateProductPage.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price : price!,
        description: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category!);
  }
}
