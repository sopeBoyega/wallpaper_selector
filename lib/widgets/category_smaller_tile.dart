// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySmallerListTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final int count;

  const CategorySmallerListTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
        decoration: const BoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    imagePath,
                    width: 150.21,
                    height: 185.21,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 2,
                  left: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Nature",
                              style: GoogleFonts.poppins(
                                fontSize: 9,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 2,
                  right: 7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 5,
                        //   vertical: 5,
                        // ),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_outlined, color: Colors.white),
                            iconSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 1),
          ],
        ),
      ),
    );
  }
}
