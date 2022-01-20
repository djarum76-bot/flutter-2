import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TabunganAkhiratItem extends StatelessWidget {
  const TabunganAkhiratItem({
    Key? key, required this.msg, required this.gambar,
  }) : super(key: key);

  final String msg;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: Get.width * 0.3,
        height: Get.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              width: Get.width * 0.3,
              height: Get.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Color(0xFF9BF4D5)
              ),
              child: Center(
                child: Image.asset(gambar, fit: BoxFit.cover,),
              ),
            ),
            Expanded(
              child: Container(
                width: Get.width * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Color(0xFF346357)
                ),
                child: Center(
                  child: Text(
                    msg,
                    style: GoogleFonts.workSans(fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xffFFFFFF)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}