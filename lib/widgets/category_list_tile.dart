import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath; 
  final int count;

  const CategoryListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding around each tile for spacing
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
        decoration: BoxDecoration(
          border: BoxBorder.fromLTRB(bottom: BorderSide(color: Color.fromARGB(10, 0, 0, 0)))
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. The Image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imagePath,
                width: 277.21, 
                height: 185.21, 
                fit: BoxFit.cover,
              ),
            ),
            
            const SizedBox(width: 16), 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  
                  const SizedBox(height: 4),
                  
                 
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 12),
                  
                 
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], 
                      borderRadius: BorderRadius.circular(20), 
                    ),
                    child: Text(
                      "$count wallpapers",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}