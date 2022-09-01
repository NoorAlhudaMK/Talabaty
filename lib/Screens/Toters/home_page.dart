import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/material.dart';

import '../../Data/data.dart';

class TotersHome extends StatefulWidget {
  const TotersHome({Key? key}) : super(key: key);

  @override
  State<TotersHome> createState() => _TotersHomeState();
}

class _TotersHomeState extends State<TotersHome> {
  final List<String> listImages = [
    burgerat,
    falafelLibnan,
    burgerat,
    falafelLibnan,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.settings,
          color: Colors.black87,
          size: 32,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "توصيل الى",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.black87,
                      size: 14,
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "بيروت, لبنان",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLoginRow(),
          buildSlider(),
          buildTypesSection(),
        ],
      ),
    );
  }

  Widget buildLoginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 5,),
        Text(
          "سجل الدخول باستخدام تطبيق توترز و استمتع بمزايا حصرية !",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
        SizedBox(width: 5,),
        Icon(
          Icons.arrow_back,
          color: Colors.green,
          size: 18,
        ),
        SizedBox(width: 5,),
      ],
    );
  }

  Widget buildSlider() {
    return Padding(padding: EdgeInsets.all(10),
    child: CarouselImages(
      //scaleFactor: 0.7,
      listImages: listImages,
      height: 300.0,
      borderRadius: 15.0,
      cachedNetworkImage: true,
      verticalAlignment: Alignment.bottomCenter,
      onTap: (index) {
        print('Tapped on page $index');
      },
    ),);
  }

  Widget buildTypesSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTypesColumn(dietDish, "دايت فوود"),
            buildTypesColumn(resturant, "المطاعم"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTypesColumn(nuts, "الكرزات"),
            buildTypesColumn(coffee, "البن و القهوة"),
            buildTypesColumn(flowers, "الزهور"),
          ],
        ),
        // buildTypesColumn(cards, "بطاقات تعبئة"),
        // buildTypesColumn(seaFoodDish, "بحرية"),
        // buildTypesColumn(foodProcessing, "تجهيزات غذائية"),
        // buildTypesColumn(fruitDish, "فواكه و خضراوات"),
        // buildTypesColumn(breakfastDish, "فطور"),
      ],
    );
  }

  Widget buildTypesColumn(String typeImage, String typeText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          margin: EdgeInsets.only(
            left: 5,
            right: 5,
            bottom: 3,
            top: 2,
          ),
          decoration: BoxDecoration(
            color: lightGreyColor,
            image: DecorationImage(
                image: NetworkImage(typeImage), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        Text(
          typeText,
          style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 22),
        ),
      ],
    );
  }
}
