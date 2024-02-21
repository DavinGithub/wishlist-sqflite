import 'dart:convert';
import 'dart:io';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wishlist_sqflite/models/drink_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

class HomepageController extends GetxController {
  Future<void> initDatabase() async {
    Database? database;
    String db_name = "db_cocktail";
    int db_version = 1;

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + db_name;

    if (database == null) {
      database = await openDatabase(path, version: db_version,
          onCreate: (Database db, int version) async {
        print("Creating table");
        await db.execute('''
      CREATE TABLE IF NOT EXISTS cocktail (
        idDrink TEXT,
        strDrink TEXT,
        strDrinkAlternate TEXT,
        strTags TEXT,
        strVideo TEXT,
        strCategory TEXT,
        strIBA TEXT,
        strAlcoholic TEXT,
        strGlass TEXT,
        strInstructions TEXT,
        strInstructionsES TEXT,
        strInstructionsDE TEXT,
        strInstructionsFR TEXT,
        strInstructionsIT TEXT,
        strInstructionsZHHANS TEXT,
        strInstructionsZHHANT TEXT,
        strDrinkThumb TEXT,
        strImageSource TEXT,
        strImageAttribution TEXT,
        strCreativeCommonsConfirmed TEXT,
        dateModified TEXT
      )
    ''');
        print("done create table");
      });
    }
  }

  Future<List<Drinks>> fetchData() async {
    var headers = {"Accept": "Application/json"};
    var response = await http.get(
        Uri.parse(
          "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a",
        ),
        headers: headers);
    List<dynamic> jsonData = json.decode(response.body)["drinks"];
    List<Drinks> data = jsonData.map((e) => Drinks.fromJson(e)).toList();
    return data;
  }

  Future<void> addToFavorite(Drinks drinkModel) async {
    Database? database;
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_cocktail";
    database = await openDatabase(path);

    // Cek apakah entri dengan ID yang sama sudah ada dalam database
    List<Map<String, dynamic>> existingEntries = await database.query(
      'cocktail',
      where: 'idDrink = ?',
      whereArgs: [drinkModel.idDrink],
    );

    if (existingEntries.isEmpty) {
    
      await database.insert(
        "cocktail",
        drinkModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
  
      print('Entri dengan ID yang sama sudah ada dalam database.');
    }
  }
}
