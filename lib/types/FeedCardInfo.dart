import 'package:expirations/types/CardTypeEnums.dart';

class FeedCardInfo {
  final String username;
  final String email;
  final DateTime date;
  final CardTypeEnum type;

  const FeedCardInfo(
      {required this.username,
      required this.email,
      required this.date,
      required this.type});
}
