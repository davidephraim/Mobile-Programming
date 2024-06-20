import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purify/constants.dart';
import 'package:purify/models/for_you_products.dart';
import 'package:purify/screen/home.dart';
import 'package:purify/screen/shopping_cart.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.category,
  });

  final String title, price, image, category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 2 / 3 +
                  defaultPadding * 3,
              child: Stack(
                children: [
                  Image.asset('assets/images/shape3.png'),
                  Container(
                    padding: EdgeInsets.only(
                        left: defaultPadding,
                        right: defaultPadding,
                        top: defaultPadding * 4),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Home()));
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 30,
                              ),
                            ),
                            Icon(
                              Icons.favorite_outline,
                              size: 30,
                            ),
                          ],
                        ),
                        Text(
                          category,
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        Text(
                          title,
                          style: GoogleFonts.ubuntu(
                              fontSize: 24, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: defaultPadding * 3,
                        ),
                        Image.asset(image),
                        SizedBox(
                          height: defaultPadding * 3,
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
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              price,
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              width: defaultPadding * 3,
                            ),
                            SizedBox(
                              height: 50,
                              width: 200,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: defaultPadding * 2,
                                  ),
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
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: defaultPadding,
                                    ),
                                    Text(
                                      'Add',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white,
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: defaultPadding * 2,
            ),
            Container(
              height: 400,
              child: Stack(
                children: [
                  Image.asset('assets/images/shape4.png'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: defaultPadding * 3),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: defaultPadding * 2),
                        child: Text(
                          'Related',
                          style: GoogleFonts.ubuntu(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(height: defaultPadding * 3),
                      Padding(
                        padding: const EdgeInsets.only(left: defaultPadding),
                        child: SizedBox(
                          height: 230,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.all(0),
                            itemCount: demoProductsForYou.length,
                            itemBuilder: (context, index) {
                              return CardRelated(demoProductsForYou[index]);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container CardRelated(ProductsForYou productsForYou) {
    return Container(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: defaultPadding),
            child: Image.asset('assets/images/shape5.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                productsForYou.image,
                scale: 3,
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(
                    bottom: defaultPadding * 2,
                    left: defaultPadding * 2,
                    right: defaultPadding),
                width: 230,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productsForYou.title,
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      productsForYou.price,
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
