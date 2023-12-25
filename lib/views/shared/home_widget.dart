import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shoes_shop/ui/product_by_cat.dart';
import 'package:shoes_shop/ui/product_page.dart';
import 'package:shoes_shop/views/shared/appstyle.dart';
import 'package:shoes_shop/views/shared/new_shoes.dart';
import 'package:shoes_shop/views/shared/product_card.dart';

import '../../model/sneakers_model.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneakers>> male,
    required this.tabIndex,
  }) : _male = male;
  final int tabIndex;

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.405,
          child: FutureBuilder<List<Sneakers>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage(id: shoe.id, category: shoe.category)));
                      },
                      child: ProductCard(
                        price: "\$${shoe.price}",
                        category: shoe.category,
                        id: shoe.id,
                        name: shoe.name,
                        image: shoe.imageUrl[0],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest Shoes',
                  style: appstyle(24, Colors.black, FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductByCat(tabIndex: tabIndex),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appstyle(
                            22,
                            Colors.black,
                            FontWeight.w500,
                          ),
                        ),
                        const Icon(
                          AntDesign.caretright,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.11,
          child: FutureBuilder<List<Sneakers>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewShoes(imageUrl: shoe.imageUrl[1]),
                    );
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }
}
