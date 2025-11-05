import 'package:flutter/material.dart';
import 'package:wallpaper_selector/data/categories.dart';
import 'package:wallpaper_selector/screens/category_details.dart';
import 'package:wallpaper_selector/widgets/category_list_tile.dart';

class CatList extends StatelessWidget {
  const CatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final cur = categories[index];  
        return InkWell( onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => CategoryDetailsPage(category: cur)),
                        );},

                        child: CategoryListTile(title: cur.title, subtitle: cur.subtitle, imagePath: cur.image, count: cur.count));
      },
    );
  }
}
