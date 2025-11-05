

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_selector/screens/browse_page.dart';
import 'package:wallpaper_selector/screens/home.dart';
import 'package:wallpaper_selector/widgets/colors.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Saved Wallpapers",
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
                "Your saved wallpapers collection",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),


       Container(
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/noimage.png"),
              SizedBox(height: 20,),
              Text(
                "No Saved Wallpapers",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 87, 87, 87),
                ),
              ),
              SizedBox(height: 13,),
              Text(
                    "Start saving your favorite wallpapers to see them here",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                     textAlign: TextAlign.center,
                  ),
                   SizedBox(height: 15,),
                   ElevatedButton(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 17,
                      ),
                    ),
                    child: Text(
                      'Browse Wallpapers',
                      style: GoogleFonts.poppins(fontSize: 13),
                    ),
                  ),
            ],
          ),
        ),
       )
      ],
    );
  }
}