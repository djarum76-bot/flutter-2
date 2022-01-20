import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OwnMessageCard extends StatelessWidget{
  OwnMessageCard({ required this.message, required this.time});

  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: Get.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(horizontal: Get.height * 0.01838235294, vertical: Get.height * 0.00612745098),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Get.height * 0.01225490196,
                  right: Get.height * 0.03676470588,
                  top: Get.height * 0.00612745098,
                  bottom: Get.height * 0.02450980392,
                ),
                child: Text(
                  message,
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: Get.height * 0.00490196078,
                right: Get.height * 0.01225490196,
                child: Row(
                  children: [
                    Text(
                      time,
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}