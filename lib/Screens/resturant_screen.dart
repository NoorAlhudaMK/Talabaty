import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:untitled/Data/data.dart';

class ResturantPage extends StatefulWidget {
  final String resName;
  final String resLocation;
  final String resImage;
  final int deliverPrice;
  final int minOrderPrice;
  final String rate;

  ResturantPage({
    required this.resName,
    required this.resImage,
    required this.rate,
    required this.resLocation,
    required this.deliverPrice,
    required this.minOrderPrice,
  });

  @override
  State<ResturantPage> createState() => _ResturantPageState();
}

class _ResturantPageState extends State<ResturantPage> {

  int counter = 1;
  int price = 6500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  color: lightGreyColor,
                  image: DecorationImage(
                    image: NetworkImage(widget.resImage),
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              top: 30,
              right: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 45,
                  height: 45,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 32,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width * 0.6) - 60,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.resName,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 35,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                buildResturantDetailsRow(
                                  Icon(
                                    Icons.tag_faces_sharp,
                                    color: Colors.black54,
                                    size: 26,
                                  ),
                                  widget.rate,
                                ),
                                SizedBox(height: 20,),
                                buildResturantDetailsRow(
                                  Icon(
                                    Icons.price_check,
                                    color: Colors.black54,
                                    size: 26,
                                  ),
                                  "الحد الأدنى للطلب: ${widget.minOrderPrice} د.ع",
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                buildResturantDetailsRow(
                                  Icon(
                                    Icons.delivery_dining,
                                    color: Colors.black54,
                                    size: 26,
                                  ),
                                  "سعر التوصيل: ${widget.deliverPrice} د.ع",
                                ),
                                SizedBox(height: 20,),
                                buildResturantDetailsRow(
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black54,
                                    size: 26,
                                  ),
                                  widget.resLocation,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      buildResturantDetailsRow(
                        Icon(
                          Icons.access_time,
                          color: Colors.black54,
                          size: 26,
                        ),
                        "وقت التوصيل المتوقع من ساعة الى نصف ساعة",
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20,),
                        child: Text(
                          "سندوتش فيليه دجاج",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 35,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: lightGreyColor,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Ionicons.chevron_up_outline,
                              color: Colors.black54,
                              size: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "اضافات",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 26,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                Text(
                                  "اختياري",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 22,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10,),
                        child: Text(
                          "تعليمات خاصة",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: lightGreyColor,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child:  Text(
                          "اذا كانت لديك أي ملاحظات تخص الطلب يرجى كتابتها هنا",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 15,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("Hmmmmm");
                                setState(() {
                                  print("Hmmmmm");
                                  if(counter > 1) {
                                    counter --;
                                    price -= 6500;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black87,
                                  size: 32,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20,),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                    "$counter",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 32,
                                    ),
                                  ),
                                ]
                                ),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                setState(() {
                                  counter ++;
                                  price += 6500;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black87,
                                  size: 32,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "السعر $price د.ع ",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }

  Widget buildResturantDetailsRow(Icon icon, String detail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          detail,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
          ),
        ),
        SizedBox(width: 5,),
        icon,
      ],
    );
  }
}
