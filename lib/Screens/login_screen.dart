import 'package:flutter/material.dart';

import '../Data/data.dart';
import 'bottom_navigation_bar_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController shareCode = TextEditingController();

  int nameCounter = 0;
  int phoneNumberCounter = 0;

  bool isNameEnabled = true;
  bool isPhoneEnabled = true;
  bool hasShareCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/red_logo.png",
                width: MediaQuery.of(context).size.width * 0.65,
                //height: MediaQuery.of(context).size.width * 0.55,
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 20),
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        controller: name,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                                "الاسم",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 24,
                                ),
                              ),
                          //labelText: 'الاسم',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                          ),
                        ),
                        enabled: isNameEnabled,
                        onChanged: (val) {
                          setState(() {
                            if (nameCounter >= 15) {
                              isNameEnabled = false;
                              final snackBar = SnackBar(
                                content: const Text(
                                    'يجب أن لا يكون الاسم أكثر من 15 حرف'),
                                action: SnackBarAction(
                                  label: 'حسناً',
                                  onPressed: () {
                                    setState(() {
                                      name.clear();
                                      nameCounter = 0;
                                      isNameEnabled = true;
                                    });
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else
                              nameCounter++;
                          });
                        },
                      ),
                    )
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    "$nameCounter/15",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        controller: phoneNumber,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label:
                          Text(
                            "رقم الهاتف",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                            ),
                          ),
                          //labelText: 'الاسم',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                          ),
                        ),
                        enabled: isPhoneEnabled,
                        onChanged: (val) {
                          setState(() {
                            if (phoneNumberCounter >= 11) {
                              isPhoneEnabled = false;
                              final snackBar = SnackBar(
                                content:
                                const Text('تأكد أن الرقم الذي أدخلته صالح'),
                                action: SnackBarAction(
                                  label: 'حسناً',
                                  onPressed: () {
                                    setState(() {
                                      phoneNumber.clear();
                                      phoneNumberCounter = 0;
                                      isPhoneEnabled = true;
                                    });
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else
                              phoneNumberCounter++;
                          });
                        },
                      ),
                    )
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    "$phoneNumberCounter/11",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      hasShareCode = !hasShareCode;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_drop_down,
                        color: primaryColor,
                        size: 22,
                      ),
                      Text(
                        "اذا كان لديك رمز مشاركة, اضغط هنا",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                )),
            hasShareCode
                ? Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: 30,
                    ),
                    decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          controller: shareCode,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                "رمز المشاركة",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 24,
                                ),
                              ),
                              //labelText: 'الاسم',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 24,
                              )),
                        ),
                      )
                    ),
                  )
                : Container(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomBar()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                  //left: MediaQuery.of(context).size.width * 0.35,
                ),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Center(
                  child: Text(
                    "التالي",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
