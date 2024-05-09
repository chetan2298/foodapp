import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hello User', style: AppWidget.boldTextFeildStyle()),
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
            showItem(),
            SizedBox(
              height: 20.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "images/salad2.png",
                              height: 140,
                              width: 140,
                              fit: BoxFit.cover,
                            ),
                            Text("Subway Salad",
                                style: AppWidget.semiBoldTextFeildStyle()),
                            SizedBox(
                              height: 1.0,
                            ),
                            Text("Healthy prolly!",
                                style: AppWidget.LightTextFeildStyle()),
                            SizedBox(
                              height: 1.0,
                            ),
                            Text("\$15",
                                style: AppWidget.semiBoldTextFeildStyle()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "images/salad3.png",
                            height: 140,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                          Text("Homemade Salad",
                              style: AppWidget.semiBoldTextFeildStyle()),
                          SizedBox(
                            height: 1.0,
                          ),
                          Text("Healthy def!",
                              style: AppWidget.LightTextFeildStyle()),
                          SizedBox(
                            height: 1.0,
                          ),
                          Text("\$12",
                              style: AppWidget.semiBoldTextFeildStyle()),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              burger = !burger;
              icecream = false;
              pizza = false;
              salad = false;
            });
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
          onTap: () {
            setState(() {
              pizza = !pizza;
              icecream = false;
              salad = false;
              burger = false;
            });
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
          onTap: () {
            setState(() {
              salad = !salad;
              icecream = false;
              pizza = false;
              burger = false;
            });
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
          onTap: () {
            setState(() {
              icecream = !icecream;
              pizza = false;
              salad = false;
              burger = false;
            });
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
