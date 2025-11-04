import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_selector/screens/category_details.dart';
import 'package:wallpaper_selector/widgets/category_card.dart';
import 'package:wallpaper_selector/widgets/colors.dart';
import 'package:wallpaper_selector/data/categories.dart';
import 'package:wallpaper_selector/widgets/list.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key, required this.width});

  final double width;

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  String _viewMode = "Grid";
 


  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Browse Categories",
                style: TextStyle(
                  fontFamily: 'Clash Display',
                  fontSize: widget.width < 800 ? 28 : 42,
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
                  "Explore our curated collection of stunning wallpapers ",
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
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _viewMode = "Grid";
                        });
                      },
                      icon: Icon(Icons.grid_view),
                      color: _viewMode == "Grid" ? AppColors.darkOrange : Colors.grey,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _viewMode = "List";
                        });
                      },
                      icon: Icon(Icons.table_rows_sharp),
                      color: _viewMode == "List" ? AppColors.darkOrange : Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Switch between grid and list view based on _viewMode
          if (_viewMode == "Grid")
            (() {
              int crossAxisCount = widget.width > 1200
                  ? 3
                  : widget.width > 900
                      ? 3
                      : 2;
      
              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                mainAxisSpacing: 23,
                crossAxisSpacing: 23,
                childAspectRatio: 1.4,
                children: categories
                    .map((c) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => CategoryDetailsPage(category: c)),
                        );
                      },
                      child: CategoryCard(
                            title: c.title,
                            subtitle: c.subtitle,
                            count: c.count,
                            image: c.image,
                          ),
                    ))
                    .toList(),
              );
            })()
          else
            // List view
            SizedBox(
              height: 400,
              child: CatList(),
            ),
        ],
    );
  }
}
