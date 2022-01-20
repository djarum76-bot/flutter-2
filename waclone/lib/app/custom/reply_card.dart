import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ReplyCard extends StatelessWidget {
  ReplyCard({required this.message, required this.time});

  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: Get.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(horizontal: Get.height * 0.01838235294, vertical: Get.height * 0.00612745098),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Get.height * 0.00980392156,
                  right: Get.height * 0.0612745098,
                  top: Get.height * 0.00612745098,
                  bottom: Get.height * 0.01225490196,
                ),
                child: Text(
                  message,
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  time,
                  style: GoogleFonts.openSans(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}