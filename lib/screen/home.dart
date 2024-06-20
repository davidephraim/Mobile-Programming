import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purify/constants.dart';
import 'package:purify/models/best_sellers_products.dart';
import 'package:purify/models/categories_icons.dart';
import 'package:purify/models/for_you_products.dart';
import 'package:purify/screen/product_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset('assets/images/shape1.png'),
                Padding(
                  padding: const EdgeInsets.only(
                    top: defaultPadding * 4,
                    left: defaultPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.place_outlined,
                            size: 40,
                          ),
                          Text(
                            'Algeria, Tlemcen',
                            style: GoogleFonts.ubuntu(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: defaultPadding),
                            child: ClipOval(
                              child: SizedBox(
                                height: 50,
                                child: Image.asset('assets/images/unnamed.jpg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: defaultPadding),
                      Text(
                        'Hello\nDavid Ephraim',
                        style: GoogleFonts.ubuntu(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 50,
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultPadding),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.search_outlined,
                                  color: Colors.black,
                                ),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              ),
                            ),
                          )),
                          SizedBox(
                            width: defaultPadding * 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: defaultPadding),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Image.asset(
                                'assets/icons/settings.png',
                                scale: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: defaultPadding * 2,
                      ),
                      SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.all(0),
                            itemCount: demoCategories.length,
                            itemBuilder: (context, index) {
                              return Categories(demoCategories[index]);
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Container(
              padding: EdgeInsets.only(left: defaultPadding),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Best sellers',
                  style: GoogleFonts.ubuntu(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: demoProductsForYou.length,
                      itemBuilder: (context, index) {
                        return CardBestSellers(context, demoProductsForYou[index]);
                      }),
                ),
                SizedBox(height: defaultPadding*2,),
                Text(
                  'For you',
                  style: GoogleFonts.ubuntu(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: demoBestSellesProducts.length,
                      itemBuilder: (context, index) {
                        return CardForYou(context, demoBestSellesProducts[index]);
                      }),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
              ]),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.all(defaultPadding),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          color: Colors.white,
          elevation: 3,
          child: TabBar(
            labelColor: Colors.orangeAccent,
            unselectedLabelColor: Colors.black,
            controller: _tabController,
            indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
            onTap: (value) {},
            tabs: [
              Icon(Icons.home_outlined, size: 30,),
              Icon(Icons.favorite_outline, size: 30,),
              Icon(Icons.shop_outlined, size: 30,),
              Icon(Icons.person_outline, size: 30,),
            ],
          ),
        ),
      ),
    );
  }

  Container CardForYou(BuildContext context, ProductsForYou productsForYou) {
    return Container(
      width: MediaQuery.of(context).size.width - defaultPadding * 4,
      margin: EdgeInsets.only(right: defaultPadding),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/shape2.png')),
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              productsForYou.image,
              scale: 2.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding*2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                    productsForYou.category,
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                Text(
                    productsForYou.title,
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: defaultPadding,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding*3, right: defaultPadding*1.5),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_outline, size: 40,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding*1.5, right: defaultPadding*1.5),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                productsForYou.price,
                style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails(
                  title: productsForYou.title,
                  price: productsForYou.price,
                  image: productsForYou.image,
                  category: productsForYou.category,
                )));
              },
              child: Image.asset('assets/images/shape2.png', color: Colors.transparent,),
            ),
          )
        ],
      ),
    );
  }
  Container CardBestSellers(BuildContext context, BestSellesProducts bestSellesProducts) {
    return Container(
      width: MediaQuery.of(context).size.width - defaultPadding * 4,
      margin: EdgeInsets.only(right: defaultPadding),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/shape2.png')),
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              bestSellesProducts.image,
              scale: 2.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding*2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                    bestSellesProducts.category,
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                Text(
                    bestSellesProducts.title,
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: defaultPadding,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding*3, right: defaultPadding*1.5),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_outline, size: 40,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding*1.5, right: defaultPadding*1.5),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                bestSellesProducts.price,
                style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails(
                  title: bestSellesProducts.title,
                  price: bestSellesProducts.price,
                  image: bestSellesProducts.image,
                  category: bestSellesProducts.category,
                )));
              },
              child: Image.asset('assets/images/shape2.png', color: Colors.transparent,),
            ),
          )
        ],
      ),
    );
  }

  Padding Categories(CategoriesIcons categoriesIcons) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(categoriesIcons.icon),
                ),
                Text(
                  categoriesIcons.title,
                  style: GoogleFonts.ubuntu(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
