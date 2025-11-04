import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_selector/widgets/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<String> _qualities = [
    'High ( Best Quality )',
    'Medium ( Balanced )',
    'Low ( Data Saver )',
  ];

  String _selectedQuality = 'High ( Best Quality )';
  bool notificationsEnabled = true;

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
              "Settings",
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
                "Customize your Wallpaper Studio experience",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ),

        const SizedBox(height: 40),

        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 100),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(18)),
            border: BoxBorder.all(color: Color.fromARGB(10, 0, 0, 0)),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No Saved Wallpapers",

                    style: GoogleFonts.poppins(
                      fontSize: 20,

                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 13),
                  Text(
                    "Start saving your favorite wallpapers to see them here",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                   Container(
  constraints: const BoxConstraints(maxWidth: 500), // limit width
  width: double.infinity, // still responsive
  padding: const EdgeInsets.all(16),
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  child: DropdownButtonFormField<String>(
    value: _selectedQuality,
    decoration: const InputDecoration(
      labelText: 'Image Quality',
      border: InputBorder.none, // cleaner card style
    ),
    items: _qualities.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    onChanged: (newValue) {
      setState(() => _selectedQuality = newValue!);
    },
  ),
),

       
                  Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: SwitchListTile(
                      title: const Text(
                        'Notification',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Get notified about new wallpapers and updates',
                      ),
                      value: notificationsEnabled,
                      activeColor: Colors.orange,
                      onChanged: (bool value) {
                        setState(() => notificationsEnabled = value);
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          // reset to defaults
                          setState(() {
                            _selectedQuality = _qualities[0];
                            notificationsEnabled = true;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 14,
                          ),
                        ),
                        child: Text('Cancel', style: GoogleFonts.poppins()),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: save settings permanently
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Settings saved')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightOrange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Save Settings',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),
                ],
              ),
              Image.asset("assets/images/settings.png"),
            ],
          ),
        ),
      ],
    )]);
  }
}

class WallpaperSetupCard extends StatefulWidget {
  const WallpaperSetupCard({super.key});

  @override
  State<WallpaperSetupCard> createState() => _WallpaperSetupCardState();
}

class _WallpaperSetupCardState extends State<WallpaperSetupCard> {
  final List<String> _qualities = [
    'High ( Best Quality )',
    'Medium ( Balanced )',
    'Low ( Data Saver )',
  ];

  String _selectedQuality = 'High ( Best Quality )';
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Wallpaper Setup',
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          'Configure your wallpaper settings and enable auto-rotation',
          style: GoogleFonts.poppins(fontSize: 13, color: Colors.black87),
        ),
        const SizedBox(height: 18),

        // Image Quality selector
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color.fromARGB(30, 0, 0, 0)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Image Quality',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _selectedQuality,
                items: _qualities
                    .map((q) => DropdownMenuItem(value: q, child: Text(q)))
                    .toList(),
                onChanged: (v) {
                  if (v == null) return;
                  setState(() => _selectedQuality = v);
                },
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  border: InputBorder.none,
                ),
                style: GoogleFonts.poppins(color: Colors.black87),
                icon: const Icon(Icons.keyboard_arrow_down),
              ),
            ],
          ),
        ),

        const SizedBox(height: 18),

        // Notification tile
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color.fromARGB(30, 0, 0, 0)),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notification',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Get notified about new wallpapers and updates',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: _notifications,
                activeColor: AppColors.lightOrange,
                onChanged: (v) => setState(() => _notifications = v),
              ),
            ],
          ),
        ),

        const SizedBox(height: 22),

        // Action buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {
                // reset to defaults
                setState(() {
                  _selectedQuality = _qualities[0];
                  _notifications = true;
                });
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
              child: Text('Cancel', style: GoogleFonts.poppins()),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                // TODO: save settings permanently
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Settings saved')));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightOrange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Save Settings',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
