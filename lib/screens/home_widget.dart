import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_selector/widgets/category_card.dart';
import 'package:wallpaper_selector/data/categories.dart';
import 'package:wallpaper_selector/widgets/colors.dart';



class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discover Beautiful Wallpapers",
              style: TextStyle(
                fontFamily: 'Clash Display',
                fontSize: width < 800 ? 28 : 42,
                fontWeight: FontWeight.w500,
                foreground: Paint()
                  ..shader = LinearGradient(
                    begin: AlignmentGeometry.centerLeft,
                    end: AlignmentGeometry.centerRight,
                    stops: [0.8, 1.0],
                    colors: [AppColors.darkOrange, AppColors.pinkish],
                  ).createShader(Rect.fromLTWH(0, 0, 400.0, 70.0)),
              ),
            ),
            const SizedBox(height: 3),
            SizedBox(
              width: 600,
              child: Text(
                "Discover curated collections of stunning wallpapers. "
                "Browse by category, preview in full-screen, and set your favorites.",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "See All",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        (double width) {
          int crossAxisCount = width > 1200
              ? 3
              : width > 900
              ? 3
              : 2;

          return GridView.count(
            crossAxisCount: crossAxisCount,
            shrinkWrap: true,
            mainAxisSpacing: 23,
            crossAxisSpacing: 23,
            childAspectRatio: 1.4,
            children: categories.map((c) => CategoryCard(
              title: c.title,
              subtitle: c.subtitle,
              count: c.count,
              image: c.image,
            )).toList(),
          );
        }(width),
      ],
    );
  }
}
