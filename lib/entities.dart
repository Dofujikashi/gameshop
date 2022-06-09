import 'dart:typed_data';
import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  int id = 0;
  String userName;
  String password;
  int balance;

  final games = ToMany<Game>();

  User({
    required this.userName,
    required this.password,
    required this.balance,
  });
}

@Entity()
class Game {
  int id = 0;
  String name;
  int price;
  @Property(type: PropertyType.date)
  DateTime releaseDate;
  Uint8List image;

  Game({
    required this.name,
    required this.price,
    required this.releaseDate,
    required this.image,
  });
}
