import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wishlist_sqflite/models/drink_model.dart';
import 'package:wishlist_sqflite/pages/favorite_page_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class FavoritePageController extends GetxController {
  RxList<Drinks> drinks = RxList<Drinks>();
  var isLoading = false.obs;
  Future<void> fetchData() async {
    isLoading.value = true;
    Database? database;
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_cocktail";
    database = await openDatabase(path);
    final data = await database.query("cocktail");
    drinks.value = data.map((e) => Drinks.fromJson(e)).toList();
    isLoading.value = false;
  }

  Future<void> deleteFromFavorite(String id, int index) async {
    Database? database;
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_cocktail";
    database = await openDatabase(path);
    await database.delete("cocktail", where: "idDrink = ?", whereArgs: [id]);
    drinks.removeAt(index);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    super.onInit();
  }
}
