import 'package:Cloud_Music/resource/config/string.dart';

class NumUtil {
  static late NumUtil? _instance;

  NumUtil._internal() {
    _instance = this;
  }

  factory NumUtil() => _instance ?? NumUtil._internal();

  String transferPlayCountToString(num playCount) {
    double basicScale = 1e4;
    double biggerScale = 1e8;
    if (playCount > biggerScale) {
      return (playCount / biggerScale).toStringAsFixed(1) +
          StringResource.playCountLargerScale;
    } else if (playCount > basicScale) {
      return (playCount / basicScale).toString() +
          StringResource.playCountBasicScale;
    } else {
      return playCount.toString();
    }
  }
}
