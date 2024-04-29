import 'package:jiffy/jiffy.dart';

extension StringDateTimeX on String {
  String get ago => Jiffy.parse(this).fromNow(withPrefixAndSuffix: false);

  String get format => Jiffy.parse(this).format(pattern: 'dd MMM yyyy');

  String getTimeAgo(String timestamp) {
    DateTime now = DateTime.now();
    DateTime parsedTimestamp = DateTime.parse(timestamp);

    Duration difference = now.difference(parsedTimestamp);
    int seconds = difference.inSeconds;

    if (now.day - parsedTimestamp.day == 1) {
      return 'Yesterday';
    }

    Map<String, int> intervals = {
      'Y': 31536000,
      'M': 2592000,
      'W': 604800,
      'D': 86400,
      'hr': 3600,
      'min': 60,
    };

    for (var interval in intervals.entries) {
      if (seconds >= interval.value) {
        int count = (seconds / interval.value).floor();
        return '${count == 1 ? count : '$count'} ${interval.key}${count == 1 ? '' : ''} ';
      }
    }

    return 'Just now';
  }
}
