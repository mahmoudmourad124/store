import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String name}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$name');

    List<ProductModel> productList = [];

    for (var i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJason(data[i]));
    }

    return productList;
  }
}
