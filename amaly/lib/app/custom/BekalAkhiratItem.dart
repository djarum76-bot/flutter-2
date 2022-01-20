import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BekalAkhiratItem extends StatelessWidget {
  const BekalAkhiratItem({
    Key? key, required this.msg, required this.onTap, required this.gambar,
  }) : super(key: key);

  final String msg;
  final VoidCallback onTap;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.2,
        height: Get.height * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: Get.height * 0.13,
                width: Get.width * 0.2,
                child: Center(
                  child: Image.asset(
                    gambar,
                    fit: BoxFit.cover,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            SizedBox(height: 5,),
            Expanded(
                child: Text(
                  msg,
                  style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF2D3254)),
                  textAlign: TextAlign.center,
                )
            ),
          ],
        ),
      ),
    );
  }
}