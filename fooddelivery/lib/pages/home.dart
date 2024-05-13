import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fooddeliveryapp/pages/details.dart';
import 'package:fooddeliveryapp/service/database.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

import 'package:fooddeliveryapp/service/shared_pref.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;
  String? username;
  Stream? fooditemStream;
  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem("Pizza");
    setState(() {});
  }

  void getUsername() async {
    String? name = await SharedPreferenceHelper().getUserName();
    setState(() {
      username = name;
    });
  }

  @override
  void initState() {
    getUsername();
    ontheload();
    super.initState();
  }

  Widget allItemsVertically() {
    return StreamBuilder(
      stream: fooditemStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  // Your item builder logic here
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            detail: ds["Detail"],
                            name: ds["Name"],
                            price: ds["Price"],
                            image: ds["Image"],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20.0, bottom: 20.0),
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  ds["Image"],
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ds["Name"],
                                    style: AppWidget.semiBoldTextFeildStyle(),
                                  ),
                                  SizedBox(height: 1.0),
                                  Text(
                                    ds["Detail"],
                                    style: AppWidget.LightTextFeildStyle(),
                                  ),
                                  SizedBox(height: 1.0),
                                  Text(
                                    "\$" + ds["Price"],
                                    style: AppWidget.semiBoldTextFeildStyle(),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget allItems() {
    return StreamBuilder(
      stream: fooditemStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // Your item builder logic here
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            detail: ds["Detail"],
                            name: ds["Name"],
                            price: ds["Price"],
                            image: ds["Image"],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                ds["Image"],
                                height: 140,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                              Text(ds["Name"],
                                  style: AppWidget.semiBoldTextFeildStyle()),
                              SizedBox(height: 1.0),
                              Text("Healthy prolly!",
                                  style: AppWidget.LightTextFeildStyle()),
                              SizedBox(height: 1.0),
                              Text("\$" + ds["Price"],
                                  style: AppWidget.semiBoldTextFeildStyle()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello ${username ?? 'User'}',
                    style: AppWidget.boldTextFeildStyle(),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                        Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 29.0),
              Text('Culinary delights',
                  style: AppWidget.HeadlineTextFeildStyle()),
              Text('Treat your taste buds to a feast',
                  style: AppWidget.LightTextFeildStyle()),
              SizedBox(height: 19.0),
              Container(
                  margin: EdgeInsets.only(right: 20.0), child: showItem()),
              SizedBox(height: 20.0),
              Container(height: 270, child: allItems()),
              SizedBox(height: 20.0),
              allItemsVertically(),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            burger = !burger;
            icecream = false;
            pizza = false;
            salad = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Burger");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            color: burger ? Colors.grey : Colors.white,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "images/burger.png",
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            pizza = !pizza;
            icecream = false;
            salad = false;
            burger = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Pizza");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            color: pizza ? Colors.grey : Colors.white,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "images/pizza.png",
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            salad = !salad;
            icecream = false;
            pizza = false;
            burger = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Salad");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            color: salad ? Colors.grey : Colors.white,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "images/salad.png",
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            icecream = !icecream;
            pizza = false;
            salad = false;
            burger = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Ice-cream");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            color: icecream ? Colors.grey : Colors.white,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "images/ice-cream.png",
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
