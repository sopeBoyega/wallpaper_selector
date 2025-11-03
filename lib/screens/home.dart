import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_selector/data/categories.dart';
import 'package:wallpaper_selector/screens/browse_page.dart';
import 'package:wallpaper_selector/screens/category_details.dart';
import 'package:wallpaper_selector/screens/home_widget.dart';
// removed unused imports
import 'package:wallpaper_selector/widgets/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeTab = "Home";

  @override
  void initState() {
    super.initState();
    activeTab = "Home";
  }

  void _setActiveTab(String tab) {
    setState(() => activeTab = tab);
  }

  Widget _navButton(IconData icon, String label) {
    final bool isActive = activeTab == label;
    return InkWell(
      borderRadius: BorderRadius.circular(12), 
      onTap: () => _setActiveTab(label),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          // height: 44,
          // padding: const EdgeInsets.symmetric(horizontal: 16), 
          decoration: BoxDecoration(
            color: isActive
                ? const Color.fromARGB(255, 245, 245, 245)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12), 
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isActive ? Colors.black : Colors.grey,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: isActive ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

  Widget content; 

  switch (activeTab) {
    case "Browse":
      content = BrowsePage(width: width,);
      break;
    case "Favourites":
      // TODO: Create and add your Favourites page
      content = const Center(child: Text("Favourites Page"));
      break;
    case "Settings":
      // TODO: Create and add your Settings page
      content = const Center(child: Text("Settings Page"));
      break;
    case "Home": // 'Home' will fall through to the default
    default:
      content = HomeWidget(width: width);
  }

    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: width < 800
          ? _mobileAppBar()
          : PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: _desktopNavBar(),
            ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: CategoryDetailsPage(category: categories[0]),
      ),
    );
  }

  AppBar _mobileAppBar() => AppBar(
    title: const Text("Wallpaper Studio"),
    backgroundColor: Colors.white,
    elevation: 0,
  );

  Widget _desktopNavBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/logo.svg'),
              SizedBox(width: 5),
              Text("Wallpaper Studio", style: AppTextStyles.caption),
            ],
          ),
          Row(
            children: [
              _navButton(Icons.home, "Home"),
              _navButton(Icons.image, "Browse"),
              _navButton(Icons.favorite, "Favourites"),
              _navButton(Icons.settings, "Settings"),
            ],
          ),
        ],
      ),
    );
  }
}
