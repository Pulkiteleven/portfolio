import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/Windows/Store.dart';
import 'package:portfolio/models/projectModel.dart';
import 'package:portfolio/utils/functions/url_launcher.dart';
import 'package:portfolio/utils/widgets/Loader.dart';

class OneProject extends StatefulWidget {
  final Projectmodel model;
  const OneProject({super.key, required this.model});

  @override
  State<OneProject> createState() => _OneProjectState();
}

class _OneProjectState extends State<OneProject>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            children: [
              AspectRatio(
                aspectRatio: 4 / 1,
                child: Stack(children: [
                  CachedNetworkImage(
                    imageUrl: widget.model.banner,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    placeholder: (context, s) {
                      return const Center(
                        child: SizedBox(
                            width: 30.0, height: 30.0, child: Loader()),
                      );
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.9),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100.0,
                          height: 100.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: CachedNetworkImage(
                              imageUrl: widget.model.icon,
                              placeholder: (context, s) {
                                return const Center(
                                  child: SizedBox(
                                      width: 30.0,
                                      height: 30.0,
                                      child: Loader()),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.model.title,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25.0)),
                              Text(widget.model.category,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 15.0)),
                              Row(
                                children: widget.model.allLinks
                                    .map((i) => LinkTiles(links: i))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        controller.reverse();
                        stateofMainStore.setState(() {
                          stateofMainStore.showProject = false;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Screenshots",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 300.0,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: widget.model.screenshots
                            .map(
                              (e) => Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: CachedNetworkImage(
                                      imageUrl: e,
                                      fit: BoxFit.cover,
                                      placeholder: (context, s) {
                                        return SizedBox(
                                          width: 100,
                                          height: 300,
                                          child: Center(
                                            child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: Loader()),
                                          ),
                                        );
                                      },
                                    ),
                                  )),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      widget.model.desc,
                      maxLines: 300,
                      style: TextStyle(fontSize: 15.0, color: Colors.white60),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate(controller: controller)
        .slide(begin: Offset(1, 0), end: Offset(0, 0));
  }
}

class LinkTiles extends StatelessWidget {
  final LinksModel links;
  const LinkTiles({super.key, required this.links});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
            backgroundColor:
                MaterialStateProperty.all(Colors.blue.withOpacity(0.6)),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 17.0, vertical: 3.0)),
          ),
          onPressed: () {
            LaunchUs(links.link);
          },
          child: Row(
            children: [
              SvgPicture.asset(links.icon, width: 20.0),
              SizedBox(
                width: 10.0,
              ),
              Text(
                links.title,
                style: TextStyle(fontSize: 10.0, color: Colors.white),
              ),
            ],
          )),
    );
  }
}
