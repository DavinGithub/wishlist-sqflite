import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wishlist_sqflite/controller/homepage_controller.dart';
import 'package:wishlist_sqflite/models/drink_model.dart';
import 'package:wishlist_sqflite/pages/favorite_page_view.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepageController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.PSWaowNVlTEJevpTWVyowAHaHa?w=175&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7'),
            ),
            SizedBox(width: 10),
            Text(
              'haidar',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(FavoritePageView());
            },
            icon: Icon(Icons.favorite_outline),
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List<Drinks>>(
                future: controller.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Drinks> drinkss = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: drinkss.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        Drinks? drinks = drinkss[index];
                        if (drinks != null) {
                          return Card(
                            elevation: 4,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                  child: drinks.strDrinkThumb != null
                                      ? Image.network(
                                          drinks.strDrinkThumb!,
                                          fit: BoxFit.cover,
                                          height: 200,
                                        )
                                      : Container(),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Cocktail Name : ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            drinks.strDrink!,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      drinks.strCategory != null
                                          ? Text(
                                              'Drink Category: ${drinks.strCategory != null ? " " + drinks.strCategory! : ""}',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            )
                                          : Container(),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Drink Glass: ${drinks.strGlass != null ? " " + drinks.strGlass! : ""}',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.addToFavorite(
                                      Drinks(
                                        idDrink: drinks.idDrink,
                                        strDrink: drinks.strDrink,
                                        strDrinkAlternate:
                                            drinks.strDrinkAlternate,
                                        strTags: drinks.strTags,
                                        strVideo: drinks.strVideo,
                                        strCategory: drinks.strCategory,
                                        strIBA: drinks.strIBA,
                                        strAlcoholic: drinks.strAlcoholic,
                                        strGlass: drinks.strGlass,
                                        strInstructions: drinks.strInstructions,
                                        strInstructionsES:
                                            drinks.strInstructionsES,
                                        strInstructionsDE:
                                            drinks.strInstructionsDE,
                                        strInstructionsFR:
                                            drinks.strInstructionsFR,
                                        strInstructionsIT:
                                            drinks.strInstructionsIT,
                                        strInstructionsZHHANS:
                                            drinks.strInstructionsZHHANS,
                                        strInstructionsZHHANT:
                                            drinks.strInstructionsZHHANT,
                                        strDrinkThumb: drinks.strDrinkThumb,
                                        strImageSource: drinks.strImageSource,
                                        strImageAttribution:
                                            drinks.strImageAttribution,
                                        strCreativeCommonsConfirmed:
                                            drinks.strCreativeCommonsConfirmed,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Add to Favorite',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent.shade100,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return SizedBox
                              .shrink(); // Return widget kosong jika drinks null
                        }
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
