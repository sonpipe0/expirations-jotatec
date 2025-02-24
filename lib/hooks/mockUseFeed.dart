import 'package:expirations/types/CardTypeEnums.dart';
import 'package:expirations/types/FeedCardInfo.dart';

class MockUseFeed {
  const MockUseFeed();


  List<FeedCardInfo> getFeed() {
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
    ];

    return list;
  }
}