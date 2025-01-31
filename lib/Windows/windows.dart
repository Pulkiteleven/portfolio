import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/Windows/Desktop.dart';
import 'package:portfolio/Windows/Store.dart';
import 'package:portfolio/Windows/start_menu.dart';
import 'package:portfolio/Windows/wallpaper_menu.dart';
import 'package:portfolio/utils/functions/url_launcher.dart';

late _WindowsState stateofWindows;

class Windows extends StatefulWidget {
  const Windows({super.key});

  @override
  State<Windows> createState() {
    stateofWindows = _WindowsState();
    return stateofWindows;
  }
}

class _WindowsState extends State<Windows> {
  String wallpaper = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'pop', // <-- 1
        textTheme:
            Theme.of(context).textTheme.apply(fontFamily: 'pop'), // <-- 2
      ),
      home: Scaffold(
        body: Stack(
          children: [
            (wallpaper.isNotEmpty)
                ? CachedNetworkImage(
                    imageUrl: wallpaper,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    placeholder: (context, url) {
                      return Image.asset(
                        'assets/windows.jpg',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      );
                    },
                  )
                : Image.asset(
                    'assets/windows.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
            Desktop(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: WindowsBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class WindowsBar extends StatelessWidget {
  const WindowsBar({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
          ),
          height: 60.0,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              weather("20°", "Sunny"),
              Row(
                children: [
                  bottomIcon("assets/icons/windows.png", "Start Menu", () {
                    ShowStartMenu(context);
                  }),
                  bottomIcon("assets/icons/edge.png", "Visit Website", () {
                    LaunchUs("https://bento.me/pulkitdubey");
                  }),
                  bottomIcon("assets/icons/microsoft-store.png", "My Project",
                      () {
                    ShowStore(context);
                  }),
                  bottomIcon("assets/icons/mail.png", "Mail", () {
                    LaunchUs("mailto:pulkitdubey1220@gmail.com");
                  }),
                  bottomIcon("assets/icons/seetings.png", "Wallpaper", () {
                    ShowWallpaperMenu(context);
                  }),
                  // bottomIcon("assets/icons/calendar.png", "Schedule", () {}),
                ],
              ),
              dateTime(DateFormat("hh:mm").format(now),
                  DateFormat("dd-MM-yyyy").format(now), "ENG"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget bottomIcon(String img, String msg, VoidCallback ontap) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0),
    child: InkWell(
        onTap: ontap,
        child: Tooltip(
            message: msg,
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10.0)),
            child: SizedBox(child: Image.asset(img)))),
  );
}

Widget weather(String temp, String pharse) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Icon(
        Icons.wb_sunny_outlined,
        color: Colors.white,
        size: 30.0,
      ),
      const SizedBox(
        width: 5.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            temp,
            style: const TextStyle(color: Colors.white, fontSize: 12.0),
          ),
          Text(
            pharse,
            style: const TextStyle(color: Colors.white, fontSize: 12.0),
          ),
          // Text(pharse),
        ],
      ),
    ],
  );
}

Widget dateTime(String date, String time, String lang) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        lang,
        style: const TextStyle(color: Colors.white, fontSize: 14.0),
      ),
      const SizedBox(
        width: 30.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            date,
            style: const TextStyle(color: Colors.white, fontSize: 12.0),
          ),
          Text(
            time,
            style: const TextStyle(color: Colors.white, fontSize: 12.0),
          ),
          // Text(pharse),
        ],
      ),
    ],
  );
}
