import 'dart:math';

import 'package:expirations/types/CardTypeEnums.dart';
import 'package:expirations/types/FeedCardInfo.dart';

Future<List<FeedCardInfo>> getFeed(int index) async{
  List<String> indexToType = ['Today', 'Tomorrow', 'Custom'];
  final List<FeedCardInfo> list = [
    FeedCardInfo(
      username: 'john_doe',
      email: 'john.doe@example.com',
      date: DateTime(2023, 10, 1),
      type: CardTypeEnum.ECG_PAD,
    ),
    FeedCardInfo(
      username: 'jane_smith',
      email: 'jane.smith@example.com',
      date: DateTime(2023, 9, 2),
      type: CardTypeEnum.BATTERY,
    ),
    FeedCardInfo(
      username: 'alice_jones',
      email: 'alice.jones@example.com',
      date: DateTime(2025, 9, 3),
      type: CardTypeEnum.BATTERY,
    ),
    FeedCardInfo(
      username: 'alice_jones',
      email: 'alice.jones@example.com',
      date: DateTime(2025, 9, 3),
      type: CardTypeEnum.BATTERY,
    ),
    FeedCardInfo(
      username: 'alice_jones',
      email: 'alice.jones@example.com',
      date: DateTime(2025, 9, 3),
      type: CardTypeEnum.BATTERY,
    ),
    FeedCardInfo(
      username: 'alice_jones',
      email: 'alice.jones@example.com',
      date: DateTime(2025, 9, 3),
      type: CardTypeEnum.BATTERY,
    ),
    FeedCardInfo(
      username: 'alice_jones',
      email: 'alice.jones@example.com',
      date: DateTime(2025, 9, 3),
      type: CardTypeEnum.BATTERY,
    ),
    FeedCardInfo(
      username: 'alice_jones',
      email: 'alice.jones@example.com',
      date: DateTime(2025, 9, 3),
      type: CardTypeEnum.BATTERY,
    ),
  ];

  // Simulate a delay
  return Future.delayed(const Duration(seconds: 2), () {
    list.shuffle(Random(indexToType[index].length));
    return list;
  });
}

List<FeedCardInfo> populateSkeletons() {
  return [
    FeedCardInfo(
      username: 'john_doe',
      email: 'john_doe@gmail.com',
      date: DateTime(2023, 10, 1),
      type: CardTypeEnum.ECG_PAD,
    ),
    FeedCardInfo(
      username: 'john_doe',
      email: 'john_doe@gmail.com',
      date: DateTime(2023, 10, 1),
      type: CardTypeEnum.ECG_PAD,
    ),
    FeedCardInfo(
      username: 'john_doe',
      email: 'john_doe@gmail.com',
      date: DateTime(2023, 10, 1),
      type: CardTypeEnum.ECG_PAD,
    ),
    FeedCardInfo(
      username: 'john_doe',
      email: 'john_doe@gmail.com',
      date: DateTime(2023, 10, 1),
      type: CardTypeEnum.ECG_PAD,
    ),
    FeedCardInfo(
      username: 'john_doe',
      email: 'john_doe@gmail.com',
      date: DateTime(2023, 10, 1),
      type: CardTypeEnum.ECG_PAD,
    ),
    FeedCardInfo(
      username: 'john_doe',
      email: 'john_doe@gmail.com',
      date: DateTime(2023, 10, 1),
      type: CardTypeEnum.ECG_PAD,
    ),
    FeedCardInfo(
      username: 'john_doe',
      email: 'john_doe@gmail.com',
      date: DateTime(2023, 10, 1),
      type: CardTypeEnum.ECG_PAD,
    ),
    FeedCardInfo(
      username: 'john_doe',
      email: 'john_doe@gmail.com',
      date: DateTime(2023, 10, 1),
      type: CardTypeEnum.ECG_PAD,
    ),
  ];
}