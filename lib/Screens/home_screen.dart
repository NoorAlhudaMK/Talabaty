import 'package:flutter/material.dart';

import '../Data/data.dart';
import 'account_screen.dart';
import 'orders_screen.dart';
import 'wallet_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 3;
  List<Widget> screens = [
    AccountPage(),
    OrdersPage(),
    WalletPage(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(
          Icons.search,
          color: Colors.black.withOpacity(0.7),
          size: 32,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black.withOpacity(0.7),
              size: 32,
            ),
            Text(
              "المنصور",
              style:
                  TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 26),
            ),
          ],
        ),
        actions: [
          // SizedBox(width: 5,),
          // Stack(
          //   children: [
          Icon(
            Icons.notifications_none_outlined,
            color: Colors.black.withOpacity(0.7),
            size: 32,
          ),
          // Positioned(top: 10, right: 10, child: Icon(Icons.circle, color: Colors.red, size: 8,)),
          //   ],
          // ),
          // SizedBox(width: 5,),
        ],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTypesSection(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.58,
              child: ListView(
                children: [
                  buildCommonColumnTitle(),
                  buildCommonSection(),
                  buildFilterButtonsSlider(),
                  buildResturantCard(
                      zarzor, zarzorText, true, false, 5000, 10000, "المنصور", "جيد"),
                  buildResturantCard(
                      falafelLibnan, falafelLibnanText, false, true, 2500, 8000, "الكرادة", "جيد جداً"),
                  buildResturantCard(
                      burgerKing, burgerKingText, true, false, 5000, 10000, "المنصور", "جيد"),
                  buildResturantCard(
                      hardeez, hardeezText, false, true, 2500, 8000, "الكرادة", "جيد جداً"),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'الحساب'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.featured_play_list_outlined,
              ),
              label: 'الطلبات'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet,
            ),
            label: 'المحفظة',
            tooltip: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'الرئيسية',
            tooltip: 'الرئيسية',
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 30),
        selectedLabelStyle: TextStyle(fontSize: 16, color: primaryColor),
        unselectedLabelStyle: TextStyle(fontSize: 14, color: primaryColor),
        currentIndex: selected,
        onTap: (index) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => screens[index]));
        },
      ),
    );
  }

  Widget buildTypesSection() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildTypesColumn(nuts, "الكرزات"),
          buildTypesColumn(coffee, "البن و القهوة"),
          buildTypesColumn(flowers, "الزهور"),
          buildTypesColumn(cards, "بطاقات تعبئة"),
          buildTypesColumn(seaFoodDish, "بحرية"),
          buildTypesColumn(foodProcessing, "تجهيزات غذائية"),
          buildTypesColumn(fruitDish, "فواكه و خضراوات"),
          buildTypesColumn(breakfastDish, "فطور"),
          buildTypesColumn(dietDish, "دايت فوود"),
          buildTypesColumn(resturant, "المطاعم"),
        ],
      ),
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
          style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 24),
        ),
      ],
    );
  }

  Widget buildCommonColumnTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 10,
          ),
          child: Text(
            "المحلات الأكثر شيوعاً",
            style: TextStyle(color: primaryColor, fontSize: 24),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 2,
          decoration: BoxDecoration(
            color: primaryColor,
          ),
        ),
      ],
    );
  }

  Widget buildCommonSection() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildCommonColumn(zarzor, zarzorText),
          buildCommonColumn(falafelLibnan, falafelLibnanText),
          buildCommonColumn(burgerKing, burgerKingText),
          buildCommonColumn(hardeez, hardeezText),
          buildCommonColumn(zarzor, zarzorText),
          buildCommonColumn(falafelLibnan, falafelLibnanText),
          buildCommonColumn(burgerKing, burgerKingText),
          buildCommonColumn(hardeez, hardeezText),
        ],
      ),
    );
  }

  Widget buildCommonColumn(String typeImage, String typeText) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 130,
            margin: EdgeInsets.only(
              left: 25,
              bottom: 3,
              top: 2,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              image: DecorationImage(
                  image: NetworkImage(typeImage), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Text(
            typeText,
            style: TextStyle(color: primaryColor, fontSize: 24),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget buildFilterButtonsSlider() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildFilterButtons(
              Icon(
                color: lightBlackColor,
                Icons.store_rounded,
                size: 22,
              ),
              "جديد",
              lightGreyColor),
          buildFilterButtons(
              Icon(
                color: lightBlackColor,
                Icons.star_border_outlined,
                size: 22,
              ),
              "حصري",
              lightGreyColor),
          buildFilterButtons(
              Icon(
                color: lightBlackColor,
                Icons.shopping_cart_outlined,
                size: 22,
              ),
              "توصيل طلباتي",
              lightGreyColor),
          buildFilterButtons(
              Icon(
                color: lightBlackColor,
                Icons.card_giftcard,
                size: 22,
              ),
              "توصيل مجاني",
              lightGreyColor),
          buildFilterButtons(
              Icon(
                color: lightBlackColor,
                Icons.wallet,
                size: 22,
              ),
              "يدعم المحفضة",
              lightGreyColor),
          buildFilterButtons(
              Icon(
                color: lightBlackColor,
                Icons.percent_sharp,
                size: 22,
              ),
              "خصومات",
              lightGreyColor),
          buildFilterButtons(
              Icon(
                color: Colors.white,
                Icons.home_outlined,
                size: 22,
              ),
              "الكل",
              primaryColor),
        ],
      ),
    );
  }

  Widget buildFilterButtons(
      Icon buttonIcon, String buttonText, Color buttonColor) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: buttonColor, //Colors.grey.withOpacity(0.2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: TextStyle(
              color:
                  buttonColor == primaryColor ? Colors.white : lightBlackColor,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          buttonIcon,
        ],
      ),
    );
  }

  Widget buildResturantCard(
      String resturantImage,
      String resturantName,
      bool hasBromo,
      bool isexclusive,
      int minimumPrice,
      int deliveryPrice,
      String location,
      String evaluation) {
    double IconSize = 18;
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 30, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    image: DecorationImage(
                        image: NetworkImage(resturantImage), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: isexclusive
                      ? Container(
                          padding: EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 4,
                            bottom: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.redAccent,
                          ),
                          child: Text(
                            "حصري",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Container(),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    hasBromo
                        ? Container(
                            padding: EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 4,
                              bottom: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: Text(
                              "بروموكود",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 4,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 28,
                        color: primaryColor,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "الحد الأدنى للطب: $minimumPrice د.ع",
                  style: TextStyle(
                    color: lightBlackColor,
                    fontSize: 18,
                  ),
                ),
                Text(
                  resturantName,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildResturantDetailsRow(
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: IconSize,
                      color: lightBlackColor,
                    ),
                    "سعر التوصيل: $deliveryPrice د.ع"),
                buildResturantDetailsRow(
                    Icon(
                      Icons.tag_faces_sharp,
                      size: IconSize,
                      color: lightBlackColor,
                    ),
                    evaluation),
                buildResturantDetailsRow(
                    Icon(
                      Icons.location_on,
                      size: IconSize,
                      color: lightBlackColor,
                    ),
                    location),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildResturantDetailsRow(Icon icon, String detail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          detail,
          style: TextStyle(
            color: lightBlackColor,
            fontSize: 18,
          ),
        ),
        icon,
      ],
    );
  }
}