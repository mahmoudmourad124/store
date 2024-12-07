import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screen/update_product_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard(this.product);
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, UpdateProductPage.id,
                arguments: product);
          },
          child: Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  blurRadius: 20,
                  // blurStyle: BlurStyle.outer,
                  offset: Offset(1, 15),
                )
              ],
            ),
            child: Card(
              color: Colors.white,
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.title.substring(0, 10),
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price}',
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: -40,
          child: Image.network(product.image),
          height: 100,
          width: 80,
        ),
      ],
    );
  }
}
