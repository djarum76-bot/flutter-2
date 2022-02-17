import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({
    Key? key, required this.icon, required this.isi, required this.warna,
  }) : super(key: key);

  final Widget icon;
  final String isi;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.14,
      width: Get.height * 0.13,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: warna
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.height * 0.13,
            height: Get.height * 0.14 * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                )
            ),
            child: Center(
              child: icon,
            ),
          ),
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    )
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "${isi}",
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}