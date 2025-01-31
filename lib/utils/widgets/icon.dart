import 'package:flutter/material.dart';

class OneIcon extends StatelessWidget {
  final VoidCallback ontap;
  final String icon;
  const OneIcon({super.key,required this.ontap,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: SizedBox(
        width: 55.0,
        height:55.0,
        child: InkWell(
            onTap: ontap,
            child: Image.asset(icon)),
      ),
    );
  }
}
