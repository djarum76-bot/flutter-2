import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'dart:async';

class HomeController extends GetxController {
  String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
  String fileName = "MP3";
  PlayerMode mode = PlayerMode.MEDIA_PLAYER;

  late AudioPlayer audioPlayer;
  final duration = Duration().obs;
  final position = Duration().obs;

  final playerState = PlayerState.PAUSED.obs;
  late StreamSubscription durationSubscription;
  late StreamSubscription positionSubscription;
  late StreamSubscription playerCompleteSubscription;
  late StreamSubscription playerErrorSubscription;
  late StreamSubscription playerStateSubscription;

  get durationText => duration.value.toString().split('.').first;
  get positionText => position.value.toString().split('.').first;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    audioPlayer = AudioPlayer(mode: mode);
    durationSubscription = audioPlayer.onDurationChanged.listen((durationM) {
      duration.value = durationM;
    });

    positionSubscription = audioPlayer.onAudioPositionChanged.listen((p) {
      position.value = p;
    });

    playerCompleteSubscription = audioPlayer.onPlayerCompletion.listen((event) {
      onComplete();
      position.value = duration.value;
    });

    playerErrorSubscription = audioPlayer.onPlayerError.listen((msg) {
      playerState.value = PlayerState.STOPPED;
      duration.value = Duration(seconds: 0);
      position.value = Duration(seconds: 0);
    });

    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      playerState.value = s;
    });

    audioPlayer.onNotificationPlayerStateChanged.listen((PlayerState s) {
      playerState.value = s;
    });
  }

  Future<int> play()async{
    final playPosition = (position.value != null && duration.value != null && position.value.inMilliseconds > 0 && position.value.inMilliseconds < duration.value.inMilliseconds) ? position.value : null;
    final result = await audioPlayer.play(url, position: playPosition);
    if(result == 1){
      playerState.value = PlayerState.PLAYING;
    }

    audioPlayer.setPlaybackRate(1.0);

    return result;
  }

  Future<int> pause()async{
    final result = await audioPlayer.pause();
    if(result == 1){
      playerState.value = PlayerState.PAUSED;
    }
    return result;
  }

  Future<int> stop()async{
    final result = await audioPlayer.stop();
    if(result == 1){
      playerState.value = PlayerState.STOPPED;
      position.value = Duration();
    }

    return result;
  }

  void onComplete(){
    playerState.value = PlayerState.STOPPED;
  }
}
