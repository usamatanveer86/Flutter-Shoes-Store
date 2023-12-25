import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shoes_shop/model/sneakers_model.dart';
import 'package:shoes_shop/services/helper.dart';
import 'package:shoes_shop/views/shared/category_btn.dart';
import 'package:shoes_shop/views/shared/custom_spacer.dart';
import 'package:shoes_shop/views/shared/latestshoes.dart';

import '../views/shared/appstyle.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key, required this.tabIndex,});
  final int tabIndex;

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

  void getMale() {
    _male = Helper().getMaleSneaker();
  }

  void getFemale() {
    _female = Helper().getFemaleSneaker();
  }

  void getKids() {
    _kids = Helper().getKidsSneaker();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

  List<String> brand = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/nike.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 22, 0, 0),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/top_image.png"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            AntDesign.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(
                            FontAwesome.sliders,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                ),
                TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: appstyle(20, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: ("Men Shoes"),
                      ),
                      Tab(
                        text: ("Women Shoes"),
                      ),
                      Tab(
                        text: ("Kids Shoes"),
                      ),
                    ]),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.175,
                left: 16,
                right: 12),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: TabBarView(controller: _tabController, children: [
                LatestShoes(male: _male),
                LatestShoes(male: _female),
                LatestShoes(male: _kids),
              ]),
            ),
          )
        ]),
      ),
    );
  }

  Future<dynamic> filter() {
    double value = 100;
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        context: context,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.84,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5,
                  width: 45,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.black38),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(children: [
                    const CustomSpacer(),
                    Text(
                      "Filter",
                      style: appstyle(40, Colors.black, FontWeight.bold),
                    ),
                    const CustomSpacer(),
                    Text(
                      "Gender",
                      style: appstyle(20, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        CategoryBtn(buttonClr: Colors.black, label: "Men"),
                        CategoryBtn(buttonClr: Colors.grey, label: "Women"),
                        CategoryBtn(buttonClr: Colors.grey, label: "Kids"),
                      ],
                    ),
                    const CustomSpacer(),
                    Text(
                      "Category",
                      style: appstyle(20, Colors.black, FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        CategoryBtn(buttonClr: Colors.black, label: "Shoes"),
                        CategoryBtn(buttonClr: Colors.grey, label: "Apparrels"),
                        CategoryBtn(
                            buttonClr: Colors.grey, label: "Accessories"),
                      ],
                    ),
                    const CustomSpacer(),
                    Slider(
                        value: value,
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey,
                        thumbColor: Colors.black,
                        max: 500,
                        divisions: 50,
                        label: value.toString(),
                        secondaryTrackValue: 200,
                        onChanged: (double value) {}),
                    const CustomSpacer(),
                    Text(
                      "Brand",
                      style: appstyle(20, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 80,
                      child: ListView.builder(
                          itemCount: brand.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12))),
                                child: Image.asset(
                                  brand[index],
                                  height: 60,
                                  width: 70,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }),
                    )
                  ]),
                )
              ]),
            ));
  }
}
