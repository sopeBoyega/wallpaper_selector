// ignore_for_file: deprecated_member_use

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_selector/models/category.dart';
import 'package:wallpaper_selector/widgets/category_smaller_tile.dart';
import 'package:wallpaper_selector/widgets/colors.dart';
import 'package:wallpaper_selector/widgets/tags.dart';
import 'package:wallpaper_selector/widgets/text_styles.dart';
import 'package:wallpaper_selector/widgets/shared_header.dart';

class CategoryDetailsPage extends StatefulWidget {
  const CategoryDetailsPage({super.key, required this.category});

  final Category category;

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  bool _isPanelVisible = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mainRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First Container at the left side
        Container(
          width: 600,
          // height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                 IconButton(onPressed:() {Navigator.pop(context);}, icon:  Icon(Icons.arrow_back)),
                  SizedBox(width: 5),
                  Text(
                    "Back to Categories",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),

              // Nature Images Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.category.title,
                    style: TextStyle(
                      fontFamily: 'Clash Display',
                      fontWeight: FontWeight.w400,
                      fontSize: 40,
                    ),
                  ),

                  //  Two IconButton at the header side
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.grid_view),
                        color: AppColors.darkOrange,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.table_rows_sharp),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),

              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  return CategorySmallerListTile(
                    title: "Nature $index",
                    count: 3,
                    imagePath: "assets/images/nature1.jpg",
                  );
                },
              ),
            ],
          ),
        ),

        // Right side preview (when panel not visible)
        Container(
          width: 550,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Preview",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                      ),

                      SizedBox(height: 20),

                      Text("Name", style: AppTextStyles.normalText),

                      Text(
                        "Nature 1",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 21,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text("Tags", style: AppTextStyles.normalText),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Tag(text: "Nature"),
                          Tag(text: "Ambience"),
                          Tag(text: "Flowers"),
                        ],
                      ),

                      SizedBox(height: 25),
                      Text("Description", style: AppTextStyles.normalText),
                      _buildFadingText(),
                      SizedBox(height: 35),
                      _buildIconButtons(),
                    ],
                  ),

                  Container(child: Image.asset("assets/images/preview.png")),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.favorite_outline),
                    label: Text(
                      'Save to Favorites',
                      style: GoogleFonts.poppins(fontSize: 13),
                    ),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 17,
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isPanelVisible = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 17,
                      ),
                    ),
                    child: Text(
                      'Set to Wallpaper',
                      style: GoogleFonts.poppins(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: SharedHeader(width: width),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Stack(
          children: [
            // The main content (row with preview)
            mainRow,

            if (_isPanelVisible) ...[
              Positioned.fill(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                  child: Container(color: Colors.black.withOpacity(0.25)),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: SettingsPanel(
                  onCancel: () {
                    setState(() {
                      _isPanelVisible = false;
                    });
                  },
                  onSave: () {
                    // TODO: Add your save logic here
                    print("Settings Saved!");
                    setState(() {
                      _isPanelVisible = false;
                    });
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Builds the text widget with a fading effect at the bottom.
Widget _buildFadingText() {
  // ShaderMask is used to apply a gradient mask (the fade) to its child.
  return ShaderMask(
    shaderCallback: (bounds) {
      return const LinearGradient(
        colors: [
          Colors.black, // Fully visible
          Colors.transparent, // Fades to transparent
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.7, 1.0],
      ).createShader(bounds);
    },

    blendMode: BlendMode.dstIn,
    child: SizedBox(
      width: 230,
      child: const Text(
        "Discover the pure beauty of \"Natural Essence\" – your gateway to authentic, nature-inspired experiences. Let this unique collection elevate your senses and connect you with the unrefined el...",
        style: TextStyle(
          fontSize: 11,
          color: Colors.black,
          fontWeight: FontWeight.w600, // Set the text color
        ),
        softWrap: true,
        maxLines: 4,
      ),
    ),
  );
}

/// Builds the row of three icon buttons with grey backgrounds.
Widget _buildIconButtons() {
  return Row(
    children: [
      _buildIcon(Icons.ios_share_rounded),
      const SizedBox(width: 12),
      _buildIcon(Icons.compare_arrows),
      const SizedBox(width: 12),
      _buildIcon(Icons.settings_outlined),
    ],
  );
}

/// Helper widget to create a single icon button with the desired style.
Widget _buildIcon(IconData icon) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: IconButton(
      icon: Icon(icon, color: Color.fromARGB(255, 128, 128, 128), size: 17),
      onPressed: () {},
    ),
  );
}

enum DisplayMode { fit, fill, stretch, tile }

class SettingsPanel extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const SettingsPanel({
    super.key,
    required this.onCancel,
    required this.onSave,
  });

  @override
  State<SettingsPanel> createState() => _SettingsPanelState();
}

class _SettingsPanelState extends State<SettingsPanel> {
  DisplayMode _displayMode = DisplayMode.fit;
  bool _autoRotation = true;
  bool _lockWallpaper = true;
  bool _syncDevices = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: 550,
      height: height + 200,
      decoration: const BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1000,
            offset: Offset(-5, 0),
          ),
        ],
      ),

      // Use DefaultTextStyle to apply Poppins to all text inside the panel.
      child: DefaultTextStyle(
        style: GoogleFonts.poppins(
          color: const Color(0xFF303030),
          fontSize: 14,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Text(
                      'Wallpaper Setup',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF303030),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Configure your wallpaper settings and enable auto-rotation',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Container(
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color.fromARGB(20, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Activate Wallpaper',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Set the selected wallpaper as your\ndesktop background',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11,
                                ),
                              ),
                              Chip(
                                label: Text(
                                  'Activated',
                                  style: GoogleFonts.poppins(color: Colors.green),
                                ),
                                backgroundColor: Color.fromARGB(
                                  255,
                                  200,
                                  255,
                                  189,
                                ),
                                avatar: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                side: BorderSide.none,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),

                  

                    // Display Mode Section
                    const Text(
                      'Display mode',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // RadioListTile is perfect for this
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color.fromARGB(20, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: RadioListTile<DisplayMode>(
                        title: const Text('Fit'),
                        subtitle: const Text('Scale to fit without cropping'),
                        value: DisplayMode.fit,
                        groupValue: _displayMode,
                        onChanged: (DisplayMode? value) {
                          setState(() {
                            _displayMode = value!;
                          });
                        },
                      ),
                    ),

                     SizedBox(height: 10,),
                    Container(
                       padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color.fromARGB(20, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: RadioListTile<DisplayMode>(
                        title: const Text('Fill'),
                        subtitle: const Text('Scale to fill the entire screen'),
                        value: DisplayMode.fill,
                        groupValue: _displayMode,
                        onChanged: (DisplayMode? value) {
                          setState(() {
                            _displayMode = value!;
                          });
                        },
                      ),
                    ),
                     SizedBox(height: 10,),
                    Container(
                       padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color.fromARGB(20, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: RadioListTile<DisplayMode>(
                        title: const Text('Stretch'),
                        subtitle: const Text('Stretch to fill the screen'),
                        value: DisplayMode.stretch,
                        groupValue: _displayMode,
                        onChanged: (DisplayMode? value) {
                          setState(() {
                            _displayMode = value!;
                          });
                        },
                      ),
                    ),
                     SizedBox(height: 10,),
                      Container(
                         padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color.fromARGB(20, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: RadioListTile<DisplayMode>(
                        title: const Text('Tile'),
                        subtitle: const Text(
                          'Repeat the image to fill the screen',
                        ),
                        value: DisplayMode.tile,
                        groupValue: _displayMode,
                        onChanged: (DisplayMode? value) {
                          setState(() {
                            _displayMode = value!;
                          });
                        },
                      ),
                    ),
                     SizedBox(height: 19,),
                    // Auto-Rotation Section
                    Container(
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color.fromARGB(20, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: SwitchListTile(
                        title: const Text(
                          'Auto - Rotation',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          'Automatically change your wallpaper at regular intervals',
                        ),
                        value: _autoRotation,
                        onChanged: (bool value) {
                          setState(() {
                            _autoRotation = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 19,),

                    // Advanced Settings Section
                    const Text(
                      'Advanced Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color.fromARGB(20, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: CheckboxListTile(
                        title: const Text('Lock Wallpaper'),
                        subtitle: const Text('Prevent accidental changes'),
                        value: _lockWallpaper,
                        onChanged: (bool? value) {
                          setState(() {
                            _lockWallpaper = value!;
                          });
                        },
                      ),
                    ),
                  SizedBox(height: 7,),
                    Container(
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color.fromARGB(20, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: CheckboxListTile(
                        title: const Text('Sync Across Devices'),
                        subtitle: const Text(
                          'Keep wallpaper consistent on all devices',
                        ),
                        value: _syncDevices,
                        onChanged: (bool? value) {
                          setState(() {
                            _syncDevices = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Action Buttons
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFFE0E0E0), width: 1.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    // 7. WIRED UP THE onCancel CALLBACK
                    onPressed: widget.onCancel,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Cancel', style: GoogleFonts.poppins()),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    // 7. WIRED UP THE onSave CALLBACK
                    onPressed: widget.onSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Save Settings',
                      style: GoogleFonts.poppins(color: Colors.white),
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
