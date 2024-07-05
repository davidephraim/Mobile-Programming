import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purify/Widgets/AppBarWidget.dart';
import 'package:purify/Widgets/CartBottomNavBar.dart';
import 'package:purify/Widgets/DrawerWidget.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int pizzaCount = 0;
  int burgerCount = 0;
  int drinkCount = 0;

  int pizzaPrice = 100000;
  int burgerPrice = 20000;
  int drinkPrice = 10000;

  int get totalCount => pizzaCount + burgerCount + drinkCount;
  int get totalPay => (pizzaCount * pizzaPrice) + (burgerCount * burgerPrice) + (drinkCount * drinkPrice);
  int get delivery => totalPay == 0 ? 0 : 20000;
  int get total => totalPay + delivery;

  void incrementPizza() {
    setState(() {
      pizzaCount++;
    });
  }

  void decrementPizza() {
    if (pizzaCount > 0) {
      setState(() {
        pizzaCount--;
      });
    }
  }

  void incrementBurger() {
    setState(() {
      burgerCount++;
    });
  }

  void decrementBurger() {
    if (burgerCount > 0) {
      setState(() {
        burgerCount--;
      });
    }
  }

  void incrementDrink() {
    setState(() {
      drinkCount++;
    });
  }

  void decrementDrink() {
    if (drinkCount > 0) {
      setState(() {
        drinkCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  AppBarWidget(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Order List",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  buildCartItem("Hot Pizza", "Taste Our Hot Pizza", "assets/icons/pizza.png", pizzaCount, pizzaPrice, incrementPizza, decrementPizza),
                  buildCartItem("Hot Burger", "Taste Our Hot Burger", "assets/icons/burger.png", burgerCount, burgerPrice, incrementBurger, decrementBurger),
                  buildCartItem("Cold Drink", "Taste Our Cold Drink", "assets/icons/drink.png", drinkCount, drinkPrice, incrementDrink, decrementDrink),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          buildSummaryRow("Items:", totalCount.toString(), isCurrency: false),
                          Divider(color: Colors.black),
                          buildSummaryRow("Sub-Total:", totalPay.toString()),
                          Divider(color: Colors.black),
                          buildSummaryRow("Delivery:", delivery.toString()),
                          Divider(color: Colors.black),
                          buildSummaryRow("Total:", total.toString(), isTotal: true),
                          Divider(color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }

  Widget buildCartItem(String title, String subtitle, String imagePath, int count, int price, VoidCallback increment, VoidCallback decrement) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 9),
      child: Container(
        width: 380,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                imagePath,
                height: 80,
                width: 150,
              ),
            ),
            Container(
              width: 190,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Rp. ${price.toString()}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xFF31B6B2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: increment,
                      child: Icon(
                        CupertinoIcons.plus,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: decrement,
                      child: Icon(
                        CupertinoIcons.minus,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSummaryRow(String label, String value, {bool isTotal = false, bool isCurrency = true}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 20, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: isTotal ? Color(0xFF31B6B2) : Colors.black),
          ),
          Text(
            isCurrency ? "Rp. " + value : value,
            style: TextStyle(fontSize: 20, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: isTotal ? Color(0xFF31B6B2) : Colors.black),
          ),
        ],
      ),
    );
  }
}
