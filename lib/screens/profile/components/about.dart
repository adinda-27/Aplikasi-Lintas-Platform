import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class About extends StatelessWidget {
  static String routeName = "/about";
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
            "About",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          AboutMenu(
            text:
                "Katalog merupakan sebuah informasi yang bersumber dari perusahaan atau instansi sebagai sarana atau media promosi yang befungsi untuk menyampaikan informasi suatu produk.Mengingat perannya sangat penting sebagai pertimbangan masyarakat untuk membeli suatu product serta perkembangan era digital yang sangat pesat membuat kami memutuskan membuat aplikasi ECatalog souvenir wedding organizer.Aplikasi E-Catalog Souvenir Wedding Organizer adalah aplikasi lintas platform yang dibuat untuk memudahkan user dalam mendapatkan list souvenir wedding sesuai keinginan dengan barang dan harga yang terupdate.",
            icon: "assets/icons/Cart Icon.svg",
            press: () => {},
          ),
        ],
      ),
    );
  }
}

class AboutMenu extends StatelessWidget {
  const AboutMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFFFAB91),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Colors.black,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
