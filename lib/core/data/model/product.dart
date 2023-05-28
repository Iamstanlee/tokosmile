import 'dart:math';

class Product {
  final String shopName;
  final String brandName;
  final String color;
  final String category;
  final String name;
  final int rating;
  final int reviews;
  final int amount;
  final int soldCount;
  final bool isLiked;
  final List<String> imageUrls;

  const Product({
    required this.shopName,
    required this.brandName,
    required this.color,
    required this.category,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.amount,
    required this.soldCount,
    required this.isLiked,
    required this.imageUrls,
  });

  static List<Product> seeded(int count) => List.generate(
        count,
        (index) => Product(
          shopName: "Zara Inc",
          brandName: "Zara",
          color: "Black",
          category: "Cloth",
          name: "Essential Crewneck T-Shirt 0${++index}",
          amount: Random().nextInt(500),
          reviews: Random().nextInt(5000),
          soldCount: Random().nextInt(5500),
          rating: Random().nextInt(5),
          isLiked: Random().nextBool(),
          imageUrls: [
            "res/images/shirt_01.png",
            "res/images/shirt_02.png",
            "res/images/shirt_03.png",
            "res/images/shirt_04.png",
          ]..shuffle(),
        ),
      );
}
