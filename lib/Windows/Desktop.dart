import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/Windows/Store.dart';
import 'package:portfolio/models/iconModel.dart';
import 'package:portfolio/utils/functions/url_launcher.dart';
import 'package:portfolio/utils/widgets/icon.dart';
import 'dart:html';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  List<Iconmodel> allIcons = [];
  @override
  void initState() {
    allIcons = [
      Iconmodel(
          title: "Projects",
          image: "assets/icons/microsoft-store.png",
          click: () {
            ShowStore(context);
          },
          link: false),
      Iconmodel(
          title: "Resume",
          image: "assets/icons/pdf.png",
          click: () {
            LaunchUs(
                "https://drive.google.com/file/d/1agrcLRUJseHMrG0xzZNYTlvOl9XQZrhX/view?usp=sharing");
          },
          link: true),
      Iconmodel(
          title: "Github",
          image: "assets/icons/github.png",
          click: () {
            LaunchUs("https://github.com/Pulkiteleven/");
          },
          link: true),
      Iconmodel(
          title: "LinkedIn",
          image: "assets/icons/linkedin.png",
          click: () {
            LaunchUs("https://www.linkedin.com/in/pulkit-dubey-75b703224/");
          },
          link: true),
      Iconmodel(
          title: "Leetcode",
          image: "assets/icons/leetcode.png",
          click: () {
            LaunchUs("https://leetcode.com/u/pulkitdubey");
          },
          link: true),
      Iconmodel(
          title: "Full Screen",
          image: "assets/icons/full_screen.png",
          click: () {
            if (document.fullscreenElement == null) {
              document.documentElement?.requestFullscreen();
            } else {
              document.exitFullscreen();
            }
          },
          link: false),
    ];

    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Wrap(
        direction: Axis.vertical, // Wraps horizontally
        spacing: 8.0, // Horizontal spacing
        runSpacing: 8.0, // Vertical spacing
        children: allIcons
            .map((e) => DesktopIcons(
                  iconmodel: e,
                  link: e.link,
                ))
            .toList(),
      ),
    );
  }
}

class DesktopIcons extends StatelessWidget {
  final Iconmodel iconmodel;
  final bool link;
  const DesktopIcons({super.key, required this.iconmodel, this.link = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 55.0,
            width: 55.0,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.center,
                    child:
                        OneIcon(ontap: iconmodel.click, icon: iconmodel.image)),
                (link)
                    ? Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.arrow_outward_rounded,
                            color: Colors.black,
                            size: 13.0,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Text(
            iconmodel.title,
            style: const TextStyle(color: Colors.white, fontSize: 11.0),
          )
        ],
      ),
    );
  }
}
