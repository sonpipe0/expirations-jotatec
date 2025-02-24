import 'package:expirations/types/CardTypeEnums.dart';
import 'package:expirations/types/FeedCardInfo.dart';
import 'package:flutter/material.dart';

const SecondaryStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Color(0xff4a4a4a));

const PrimaryStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 16,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

String _getDate(DateTime date) {
  String day = date.day < 10 ? '0${date.day}' : date.day.toString();
  String month = date.month < 10 ? '0${date.month}' : date.month.toString();
  String year = date.year.toString();

  String result = '$day/$month/$year';
  return result;
}

class FeedCard extends StatelessWidget {
  final FeedCardInfo information;

  const FeedCard({super.key, required this.information});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffffdfdf),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: (0.457 * 1000).toInt(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  information.username,
                  style: PrimaryStyle,
                ),
                Text(
                  information.email,
                  style: SecondaryStyle,
                )
              ],
            ),
          ),
          Expanded(
            flex: (0.210 * 1000).toInt(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Date',
                  style: PrimaryStyle,
                ),
                Text(
                  _getDate(information.date),
                  style: SecondaryStyle,
                )
              ],
            ),
          ),
          Expanded(
            flex: (0.106 * 1000).toInt(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Type',
                  style: PrimaryStyle,
                ),
                Text(
                  information.type == CardTypeEnum.BATTERY ? 'BAT' : 'ECG',
                  style: SecondaryStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
