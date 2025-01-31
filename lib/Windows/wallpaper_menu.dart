import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/Windows/Store.dart';
import 'package:portfolio/Windows/windows.dart';
import 'package:portfolio/utils/functions/url_launcher.dart';
import 'package:portfolio/utils/projectData.dart';
import 'package:portfolio/utils/widgets/Loader.dart';
import 'package:portfolio/utils/widgets/icon.dart';
import 'package:share_plus/share_plus.dart';

ShowWallpaperMenu(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (context) => Dialog(
        alignment: Alignment.bottomCenter,
        backgroundColor: Colors.transparent,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const WallpaperMenuWidget()),
  );
}

class WallpaperMenuWidget extends StatelessWidget {
  const WallpaperMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.0),
            ),
            width: 1500.0,
            child: Container(
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    wallpapers.map((e) => smallWallpaper(url: e)).toList(),
              ),
            ),
          ),
        ),
      )
          .animate()
          .slide(
              begin: Offset(0, 1),
              end: Offset(0, 0),
              duration: Duration(milliseconds: 100))
          .fade(),
    );
  }
}

class smallWallpaper extends StatelessWidget {
  final String url;
  const smallWallpaper({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        stateofWindows.setState(() { 
          stateofWindows.wallpaper = url;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return const Center(
                    child: SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: Loader(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
