import 'package:audioplayers/audioplayers.dart';
import 'package:sorcery_adventure_sheet/gen/assets.gen.dart';
import 'package:universal_platform/universal_platform.dart';

class AudioService {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static playDiceSound() {
    _audioPlayer.play(_getUrl(Assets.dicesound), isLocal: true);
  }

  static String _getUrl(String asset) {
    bool isWeb = UniversalPlatform.isWeb;
    bool isRelease = const bool.fromEnvironment('dart.vm.product');

    if (isWeb && isRelease) {
      return 'assets/$asset';
    }
    return asset;
  }
}
