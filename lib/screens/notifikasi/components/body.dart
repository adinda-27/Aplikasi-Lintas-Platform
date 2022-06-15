import 'package:flutter/material.dart';

import 'Notifikasi_menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          NotifikasiMenu(
            text: "Dapatkan potongan harga 50% spesial November",
            icon: "assets/icons/Gift Icon.svg",
            press: () => {},
          ),
          NotifikasiMenu(
            text:
                "Penawaran spesial untuk anda, packet happy bisa didaptakan dengan discount 30%",
            icon: "assets/icons/Gift Icon.svg",
            press: () {},
          ),
          NotifikasiMenu(
            text: "Wedding D baru saja merilis barang baru, segera dapatkan!!",
            icon: "assets/icons/Gift Icon.svg",
            press: () {},
          ),
          NotifikasiMenu(
            text: "Barang baru dari WedDY sekarang discount 20%",
            icon: "assets/icons/Gift Icon.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
