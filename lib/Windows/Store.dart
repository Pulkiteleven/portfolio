import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/Windows/OneProject.dart';
import 'package:portfolio/models/projectModel.dart';
import 'package:portfolio/utils/functions/url_launcher.dart';
import 'package:portfolio/utils/projectData.dart';
import 'package:portfolio/utils/widgets/HeadingTitle.dart';
import 'package:portfolio/utils/widgets/Loader.dart';
import 'package:portfolio/utils/widgets/icon.dart';

ShowStore(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (context) => Dialog(
        alignment: Alignment.center,
        backgroundColor: Colors.transparent,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const MainStore()),
  );
}

late _MainStoreState stateofMainStore;

class MainStore extends StatefulWidget {
  const MainStore({
    super.key,
  });

  @override
  State<MainStore> createState() {
    stateofMainStore = _MainStoreState();
    return stateofMainStore;
  }
}

class _MainStoreState extends State<MainStore> {
  Projectmodel? oneModel;
  bool showProject = false;

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(15.0),
        ),
        width: 1200.0,
        height: MediaQuery.of(context).size.height * 0.80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Spacer(),
                CloseButton(tap: () {
                  Navigator.of(context).pop(true);
                })
              ],
            ),
            (showProject && oneModel != null)
                ? OneProject(model: oneModel!)
                : Expanded(
                    child: ScrollbarTheme(
                      data: ScrollbarThemeData(
                        thumbColor: MaterialStateProperty.all(Colors.grey),
                        thickness: MaterialStateProperty.all(2.0),
                      ),
                      child: Scrollbar(
                        interactive: true,
                        thumbVisibility: true,
                        child: ListView(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          children: [
                            Headingtitle(title: "Featured"),
                            HeaderWidget(),
                            SizedBox(
                              height: 50.0,
                            ),
                            Headingtitle(title: "App Projects"),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                // Switch between Row and Column based on screen width
                                bool isSmallScreen = constraints.maxWidth < 650;

                                if (isSmallScreen) {
                                  return Column(
                                    children: [
                                      ProjectTile(model: appProjects[0]),
                                      const SizedBox(height: 30.0),
                                      ProjectTile(model: appProjects[1]),
                                      const SizedBox(height: 30.0),
                                      ProjectTile(model: appProjects[2]),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      ProjectTile(model: appProjects[3]),
                                    ],
                                  );
                                } else {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: ProjectTile(
                                                model: appProjects[0]),
                                          ),
                                          const SizedBox(width: 20.0),
                                          Expanded(
                                            flex: 1,
                                            child: ProjectTile(
                                                model: appProjects[1]),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 50.0,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: ProjectTile(
                                                model: appProjects[2]),
                                          ),
                                          const SizedBox(width: 20.0),
                                          Expanded(
                                            flex: 1,
                                            child: ProjectTile(
                                              model: appProjects[3],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Headingtitle(title: "Backend Projects"),
                            Wrap(
                              spacing: 20.0,
                              runSpacing: 20.0,
                              children: [
                                BackendTile(model: backendProjects[0]),
                                BackendTile(model: backendProjects[1]),
                                BackendTile(model: backendProjects[2]),
                              ],
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Headingtitle(title: "WEB / WEB3 Projects"),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                // Switch between Row and Column based on screen width
                                bool isSmallScreen = constraints.maxWidth < 650;

                                if (isSmallScreen) {
                                  return Column(
                                    children: [
                                      ProjectTile(model: webProjects[0]),
                                      const SizedBox(height: 30.0),
                                      ProjectTile(model: webProjects[1]),
                                    ],
                                  );
                                } else {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: ProjectTile(
                                                model: webProjects[0]),
                                          ),
                                          const SizedBox(width: 20.0),
                                          Expanded(
                                            flex: 1,
                                            child: ProjectTile(
                                                model: webProjects[1]),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    ).animate().scale(duration: Duration(milliseconds: 150));
  }
}

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          // Container(color: Colors.green,height: 200,width: 500.0,),

          CarousalCard(model: appProjects[0]),
          CarousalCard(model: appProjects[1]),
          CarousalCard(model: webProjects[0]),
          CarousalCard(model: appProjects[2]),
          CarousalCard(model: appProjects[3]),
          CarousalCard(model: webProjects[1]),
        ],
        options: CarouselOptions(
          height: 300.0,
          enlargeCenterPage: true,
          autoPlay: true,
        ));
  }
}

class CarousalCard extends StatelessWidget {
  final Projectmodel model;
  const CarousalCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
   
    return InkWell(
      onTap: () {
        stateofMainStore.setState(() {
          stateofMainStore.oneModel = model;
          stateofMainStore.showProject = true;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: model.banner,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              placeholder: (context, url) {
                return const Center(
                  child: SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: Loader(),
                  ),
                );
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color.fromARGB(214, 0, 0, 0),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(model.title,
                      maxLines: 2,
                      style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  Text(model.category,
                      maxLines: 1,
                      style: TextStyle(color: Colors.grey, fontSize: 15.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final Projectmodel model;
  const ProjectTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        stateofMainStore.setState(() {
          stateofMainStore.oneModel = model;
          stateofMainStore.showProject = true;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: model.icon,
                      placeholder: (context, s) {
                        return const Center(
                          child: SizedBox(
                              width: 30.0, height: 30.0, child: Loader()),
                        );
                      },
                    )),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title,
                      style: TextStyle(color: Colors.white, fontSize: 15.0)),
                  Text(model.category,
                      maxLines: 1,
                      style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: AspectRatio(
                aspectRatio: 4 / 1.8,
                child: CachedNetworkImage(
                  imageUrl: model.banner,
                  fit: BoxFit.cover,
                  placeholder: (context, s) {
                    return const Center(
                      child:
                          SizedBox(width: 30.0, height: 30.0, child: Loader()),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}

class CloseButton extends StatefulWidget {
  final VoidCallback tap;
  const CloseButton({super.key, required this.tap});

  @override
  State<CloseButton> createState() => _CloseButtonState();
}

class _CloseButtonState extends State<CloseButton> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.tap,
      onHover: (value) {
        setState(() {
          hover = value;
        });
      },
      child: Container(
        width: 35.0,
        height: 35.0,
        color: (hover) ? Colors.red : Colors.transparent,
        child: Center(
          child: Icon(
            size: 15.0,
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class BackendTile extends StatelessWidget {
  final Projectmodel model;
  const BackendTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        LaunchUs(model.allLinks[0].link);
      },
      child: Container(
        width: 200.0,
        height: 300.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.black,
        ),
        margin: EdgeInsets.symmetric(horizontal: 00.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 180.0,
              height: 180.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: model.icon,
                    placeholder: (context, s) {
                      return const Center(
                        child: SizedBox(
                            width: 30.0, height: 30.0, child: Loader()),
                      );
                    },
                  )),
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(model.title,
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                    ),
                    Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          model.allLinks[0].icon,
                          width: 50.0,
                          height: 50.0,
                        ))
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(model.category,
                    maxLines: 1,
                    style: TextStyle(color: Colors.grey, fontSize: 12.0)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
