import 'dart:convert';

import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';
import 'package:http/http.dart' as http;

class AllProductsSrevice {
  Future<List<ProductModel>> getAllProdcuts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productList = [];

    for (var i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJason(data[i]));
    }
    return productList;
  }
}
