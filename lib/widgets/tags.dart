import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tag extends StatelessWidget {
  const Tag({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color:Color.fromARGB(153, 191, 191, 191),
                      borderRadius: BorderRadius.circular(20),
                      border: BoxBorder.all(color: Colors.white)
                    ),
                    child: Text(
                      text,
                      style: GoogleFonts.poppins(
                        fontSize: 8,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  );
  }
}