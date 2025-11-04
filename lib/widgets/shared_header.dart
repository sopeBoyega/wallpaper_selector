import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_selector/screens/home.dart';
import 'package:wallpaper_selector/widgets/text_styles.dart';

/// Optional right-side widget can be passed (e.g. navigation buttons)
class SharedHeader extends StatelessWidget implements PreferredSizeWidget {
  final double width;
  final Widget? rightSide;

  const SharedHeader({super.key, required this.width, this.rightSide});

  @override
  Widget build(BuildContext context) {
    if (width < 800) {
      return AppBar(
        title: const Text('Wallpaper Studio'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      );
    }

    // Desktop-style header
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => HomeScreen()));},
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/logo.svg'),
                const SizedBox(width: 5),
                Text('Wallpaper Studio', style: AppTextStyles.caption),
              ],
            ),
          ),
          // Allow screens to pass their own right-side content (nav buttons etc.)
          rightSide ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
