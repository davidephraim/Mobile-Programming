import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purify/constants.dart';
import 'package:purify/models/cart_products.dart';
import 'package:purify/screen/home.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: defaultPadding * 4, left: defaultPadding),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: Text(
              'My cart',
              style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
            child: SizedBox(
              width: double.infinity,
              child: ListView.builder(
                itemCount: demoCartProducts.length,
                itemBuilder: (context, index) {
                  return CardCart(demoCartProducts[index]);
                },
              ),
            ),
          ))
        ],
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset('asssets/images/shape11.png'),
          Expanded(
              child: Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: Image.asset(
                        'assets/icons/coupons.png',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Do you have a coupon?",
                            style: GoogleFonts.ubuntu(fontSize: 14),
                            children: <TextSpan>[
                          TextSpan(
                            text: 'apply',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14, color: Colors.black),
                          )
                        ]))
                  ],
                ),
                SizedBox(
                  height: defaultPadding * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal: ',
                      style:
                          GoogleFonts.ubuntu(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      '1200 DA: ',
                      style:
                          GoogleFonts.ubuntu(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax: ',
                      style:
                          GoogleFonts.ubuntu(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      '200 DA: ',
                      style:
                          GoogleFonts.ubuntu(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1400 DA',
                      style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ShoppingCart()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: defaultPadding,
                            ),
                            Text(
                              'Finalize order',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Container CardCart(CartProducts cartProducts) {
    return Container(
      margin: EdgeInsets.only(bottom: defaultPadding),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/shape10.png'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Image.asset(cartProducts.image)),
              SizedBox(
                width: defaultPadding * 2,
              ),
              Expanded(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartProducts.title,
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      cartProducts.price,
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {},
                              child: Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {},
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
