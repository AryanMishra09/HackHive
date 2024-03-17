class User {
  final String name;
  final String city;

  User({required this.name, required this.city});

}

class Post {
  final String title;
  final String body;

  Post({required this.title, required this.body});

}

class Product {
  final int id;
  final String name;
  final int price;

  Product({required this.name, required this.price, required this.id});

}