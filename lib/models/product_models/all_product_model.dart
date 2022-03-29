class Products {
  final String title;
  final dynamic price;
  final String description;
  final String imageUrl;
  final int rating;
  final int totalRating;
  Products(this.title, this.price, this.description, this.imageUrl, this.rating,
      this.totalRating);

  Products.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        description = json["description"],
        imageUrl = json['imageUrl'],
        totalRating = json["totalRating"],
        price = json['price'],
        rating = json["rating"];
}

class ProductModel {
  final List<Products> products;
  ProductModel(this.products);

  ProductModel.fromJson(Map<String, dynamic> json)
      : products =
            (json["results"] as List).map((e) => Products.fromJson(e)).toList();
}
