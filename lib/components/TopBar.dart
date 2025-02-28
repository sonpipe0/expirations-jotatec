import 'package:expirations/design_system/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../types/UserInfo.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: const Color(0x40000000),
            blurRadius: 4,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.read<UserInfo>().username,
                style: TextStyle(
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                context.read<UserInfo>().email,
                style: TextStyle(
                  color: grey500,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Container(
            height: double.infinity, //infinity
            alignment: Alignment.center,

            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Logout",
                  style: TextStyle(
                    color: red500,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox.fromSize(size: Size.fromWidth(8)),
                SvgPicture.asset(
                  'assets/icons/logout.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(red500, BlendMode.srcIn),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90.0);
}
