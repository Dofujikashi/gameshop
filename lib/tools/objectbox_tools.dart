import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:gameshop/entities.dart';
import 'package:gameshop/objectbox.g.dart';

class ObjectboxTools {
  final Store store;
  late Box userBox;
  late Box gameBox;

  ObjectboxTools({required this.store}) {
    userBox = store.box<User>();
    gameBox = store.box<Game>();
  }

  User getUserById(int id) {
    return userBox.get(id);
  }

  void addBalance(User user, int amount) {
    user.balance += amount;
    userBox.put(user, mode: PutMode.update);
  }

  void insertGame(
    String name,
    int price,
    DateTime releaseDate,
    String imageText,
  ) async {
    final ByteData? bytes =
        await rootBundle.load('assets/images/$imageText.jpg');
    final Uint8List? imageList = bytes?.buffer.asUint8List();
    if (imageList != null) {
      Game game = Game(
        name: name,
        price: price,
        releaseDate: releaseDate,
        image: imageList,
      );
      gameBox.put(game);
    }
  }

  List getAllGames() {
    return gameBox.getAll();
  }

  void deleteGameById(int id) {
    gameBox.remove(id);
  }

  Game getGameById(int id) {
    return gameBox.get(id);
  }

  void deleteAllUserGames(User user) {
    user.games.removeWhere((game) => game.name.isNotEmpty);
    userBox.put(user);
  }

  void insertAllGames() {
    insertGame('Mount & Blade II: Bannerlord', 150,
        DateTime.parse('2020-03-30'), 'bannerlord');
    insertGame('Counter-Strike: Global Offensive', 0,
        DateTime.parse('2012-08-21'), 'csgo');
    insertGame(
        'Cyberpunk 2077', 249, DateTime.parse('2020-12-10'), 'cyberpunk');
    insertGame('ELDEN RING', 499, DateTime.parse('2022-02-25'), 'elden_ring');
    insertGame('God of War', 329, DateTime.parse('2022-01-14'), 'god_of_war');
    insertGame(
        'Red Dead Redemption 2', 299, DateTime.parse('2019-12-05'), 'red_dead');
    insertGame('The Forest', 32, DateTime.parse('2018-04-30'), 'the_forest');
    insertGame('Rust', 308, DateTime.parse('2018-02-08'), 'rust');
    insertGame(
        'Sea of Thieves', 61, DateTime.parse('2020-06-03'), 'sea_of_thieves');
    insertGame(
        'Stardew Valley', 24, DateTime.parse('2016-02-26'), 'stardew_valley');
  }

  bool checkGamesInserted() {
    if (gameBox.count() == 0) {
      return false;
    }
    return true;
  }
}
