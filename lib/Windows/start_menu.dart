import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/Windows/Store.dart';
import 'package:portfolio/utils/functions/url_launcher.dart';
import 'package:portfolio/utils/widgets/icon.dart';
import 'package:share_plus/share_plus.dart';

ShowStartMenu(BuildContext context) {
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
        child: const StartMenuWidget()),
  );
}

class StartMenuWidget extends StatelessWidget {
  const StartMenuWidget({
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
            width: 500.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OneIcon(
                              ontap: () {
                                ShowStore(context);
                              },
                              icon: "assets/icons/microsoft-store.png"),
                          OneIcon(
                              ontap: () {
                                LaunchUs(
                                    "https://drive.google.com/file/d/1agrcLRUJseHMrG0xzZNYTlvOl9XQZrhX/view?usp=sharing");
                              },
                              icon: "assets/icons/pdf.png"),
                          OneIcon(
                              ontap: () {
                                LaunchUs("https://github.com/Pulkiteleven/");
                              },
                              icon: "assets/icons/github.png"),
                          OneIcon(
                              ontap: () {
                                LaunchUs(
                                    "https://www.linkedin.com/in/pulkit-dubey-75b703224/");
                              },
                              icon: "assets/icons/linkedin.png"),
                          OneIcon(
                              ontap: () {
                                LaunchUs("https://leetcode.com/u/pulkitdubey");
                              },
                              icon: "assets/icons/leetcode.png"),
                        ],
                      ),
                    ],
                  ),
                ),
                const StartExpansion()
              ],
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

class StartExpansion extends StatefulWidget {
  const StartExpansion({super.key});

  @override
  _StartExpansionState createState() => _StartExpansionState();
}

class _StartExpansionState extends State<StartExpansion>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCirc,
    );
  }

  void _toggleExpansion() {
    setState(() {
      if (_isExpanded) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Expanded content
        ClipRect(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizeTransition(
              sizeFactor: _animation,
              axisAlignment: -1.0, // Ensures the content expands upwards
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsItem(
                      left: "Phone",
                      right: "+91 9098096559",
                      icon: Icons.call,
                      click: () {
                        LaunchUs("tel:+919098096559");
                      },
                      showIcon: true,
                    ),
                    DetailsItem(
                      left: "Email",
                      right: "pulkitdubey1220@gmail.com",
                      icon: Icons.email_outlined,
                      click: () {
                        LaunchUs("mailto:pulkitdubey1220@gmail.com");
                      },
                      showIcon: true,
                    ),
                    DetailsItem(
                      left: "Education",
                      right: "University Institute of Technology, RGPV Bhopal\n"
                          "B.Tech in Computer Science and Engineering",
                      icon: Icons.call,
                      click: () {},
                      minHeight: 80.0,
                      showIcon: false,
                      bottomBorder: true,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Text(
                        "Technical Skills",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    DetailsItem(
                      left: "Languages",
                      right: "Java, Dart, Solidity, SQL, Javascript, GO",
                      icon: Icons.call,
                      topBorder: false,
                      click: () {},
                      showIcon: false,
                    ),
                    DetailsItem(
                      left: "Developer Tools",
                      right:
                          "Android Studio, REMIX, Visual Studio Code, Figma, GitHub, GIT",
                      icon: Icons.call,
                      click: () {},
                      showIcon: false,
                    ),
                    DetailsItem(
                      left: "Technologies",
                      right:
                          "Flutter, Android, React, Node.JS, GoLang, Ethereum",
                      icon: Icons.call,
                      click: () {},
                      showIcon: false,
                    ),
                    DetailsItem(
                      left: "Databases",
                      right:
                          "MongoDB, SQL, Firebase Firestore/Realtime Database",
                      icon: Icons.call,
                      click: () {},
                      showIcon: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Header
        GestureDetector(
          onTap: _toggleExpansion,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15.0,
                  child: ClipOval(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset('assets/bat.jpg', fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pulkit Dubey",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    Text(
                      "Developer ~ Engineer",
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ],
                ),
                Spacer(),
                Visibility(
                    visible: _isExpanded,
                    child: Row(
                      children: [
                        IconButton(
                            tooltip: "Call Me",
                            iconSize: 20.0,
                            onPressed: () {
                              LaunchUs("tel:+919098096559");
                            },
                            icon: Icon(
                              Icons.call,
                              color: Colors.white,
                            )),
                        IconButton(
                            iconSize: 20.0,
                            tooltip: "Mail Me",
                            onPressed: () {
                              LaunchUs("mailto:pulkitdubey1220@gmail.com");
                            },
                            icon: Icon(
                              Icons.email,
                              color: Colors.white,
                            )),
                        IconButton(
                            iconSize: 20.0,
                            tooltip: "Share This Portfolio",
                            onPressed: () {
                              Share.share(
                                  'This is an awesome portfolio check it out at',
                                  subject: 'Check Out this portfolio');
                            },
                            icon: Icon(
                              Icons.ios_share_rounded,
                              color: Colors.white,
                            )),
                      ],
                    ).animate().fade(duration: Duration(milliseconds: 700))),
                Visibility(
                  visible: !_isExpanded,
                  child: SizedBox(
                    height: 30.0,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.purple.withOpacity(0.3)),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 17.0, vertical: 3.0))),
                        onPressed: () {
                          _toggleExpansion();
                        },
                        child: Text(
                          "See more",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        )),
                  ).animate().fade(duration: Duration(milliseconds: 700)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class DetailsItem extends StatefulWidget {
  final String left;
  final String right;
  final IconData icon;
  final VoidCallback click;
  final bool showIcon;
  final double minHeight;
  final bool bottomBorder;
  final bool topBorder;
  const DetailsItem(
      {super.key,
      required this.left,
      required this.right,
      this.icon = Icons.abc,
      required this.click,
      this.minHeight = 50.0,
      this.bottomBorder = false,
      this.topBorder = true,
      required this.showIcon});

  @override
  State<DetailsItem> createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
  bool showButton = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.minHeight,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: widget.topBorder ? Colors.grey : Colors.transparent,
                  width: widget.topBorder ? 0.5 : 0.0),
              bottom: BorderSide(
                  color: Colors.grey, width: widget.bottomBorder ? 0.5 : 0.0))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: Text(
                widget.left,
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              )),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () {},
              onHover: (b) {
                setState(() {
                  showButton = b;
                });
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.right,
                      style: TextStyle(color: Colors.white, fontSize: 13.0),
                    ),
                  ),
                  (showButton && widget.showIcon)
                      ? InkWell(
                          onTap: widget.click,
                          child: Icon(
                            size: 20.0,
                            widget.icon,
                            color: Colors.blueAccent,
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
