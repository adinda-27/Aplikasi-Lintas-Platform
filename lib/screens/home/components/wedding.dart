import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class Wedding extends StatelessWidget {
  static String routeName = "/wedding";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Special For You",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "",
            press: () => Navigator.pushNamed(context, Wedding.routeName),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              SpecialOfferCard(
                image: "assets/images/9.jpg",
                category: "Brand1",
                numOfBrands: 2,
                press: () => Navigator.pushNamed(context, Wedding.routeName),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              SpecialOfferCard(
                image: "assets/images/10.jpg",
                category: "Brand1",
                numOfBrands: 2,
                press: () => Navigator.pushNamed(context, Wedding.routeName),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              SpecialOfferCard(
                image: "assets/images/10.jpg",
                category: "Brand3",
                numOfBrands: 2,
                press: () => Navigator.pushNamed(context, Wedding.routeName),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              SpecialOfferCard(
                image: "assets/images/9.jpg",
                category: "Brand4",
                numOfBrands: 2,
                press: () => Navigator.pushNamed(context, Wedding.routeName),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(300),
          height: getProportionateScreenWidth(150),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.repeat,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
