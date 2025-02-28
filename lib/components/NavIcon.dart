import 'package:expirations/design_system/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavIcon extends StatelessWidget {
  final String trailingText;
  final bool selected;
  final String iconName;
  const NavIcon(
      {super.key,
      required this.trailingText,
      required this.iconName,
      this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 55,
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 4,
        mainAxisSize: MainAxisSize.max,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 150),
            padding: selected ? EdgeInsets.symmetric(horizontal: 16, vertical: 2) : EdgeInsets.all(0),
            margin: !selected ? EdgeInsets.symmetric(vertical: 2) : EdgeInsets.all(0),
            decoration: selected ? BoxDecoration(
              color: blue_10op,
              borderRadius: BorderRadius.circular(16)
            ): null,
          child: SvgPicture.asset(
            'assets/icons/$iconName${selected ? '_filled.svg' : '.svg'}',
            width: 24,
            height: 24,
          ),
          ),
          Text(
            trailingText,
            style: TextStyle(
              color: black,
              fontFamily: 'Roboto',
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
