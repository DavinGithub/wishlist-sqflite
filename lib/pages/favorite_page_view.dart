import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wishlist_sqflite/controller/favorite_controller.dart';
import 'package:wishlist_sqflite/models/drink_model.dart';

class FavoritePageView extends StatelessWidget {
  const FavoritePageView({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritePageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite",
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.drinks.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      Drinks? drinks =
                          controller.drinks[index]; // Operator null-aware
                      if (drinks != null) {
                        // Penanganan kasus null
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(8),
                              title: Text(
                                'Name: ${drinks.strDrink ?? ''}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'Drink Category: ${drinks.strCategory ?? ''}',
                              ),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  drinks.strDrinkThumb ?? '',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  controller.deleteFromFavorite(
                                      drinks.idDrink!, index);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return SizedBox
                            .shrink(); // Return widget kosong jika drinks null
                      }
                    },
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
