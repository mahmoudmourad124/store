class ProductModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String image;
  final String? category;
  final RatingModel rating;

  ProductModel({
    required this.category,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });
  factory ProductModel.fromJason(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        category: jsonData['category'],
        description: jsonData['description'],
        image: jsonData['image'],
        rating: RatingModel.fromJason(jsonData['rating']));
  }
}

class RatingModel {
  final num rate;
  final int count;

  RatingModel({required this.count, required this.rate});
  factory RatingModel.fromJason(jsonData) {
    return RatingModel(count: jsonData['count'], rate: jsonData['rate']);
  }
}
