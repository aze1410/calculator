import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final color;
  final textcolor;
  final String buttonText;

  final buttonTapped;

  MyButton(
      {Key? key,
      this.color,
      this.textcolor,
      required this.buttonText,
      this.buttonTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: color,
            child: Center(
                child: Text(
              buttonText,
              style: GoogleFonts.poppins(
                fontSize: 21,
                color: textcolor,
                fontWeight: FontWeight.w400,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
