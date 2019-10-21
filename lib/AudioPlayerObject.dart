import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerObject{
  AudioPlayer _audioPlayer;
  AudioCache _audioCache;
  String _locasFilepath;
  double _sliderVal;
  Duration _duration;
  Duration _postition;
  String _tempoMuscian= "";
  bool _play = false;
  String _musicAtual = "";

  AudioPlayerObject(this._audioPlayer, this._audioCache, this._locasFilepath,
      this._sliderVal, this._duration, this._postition, this._tempoMuscian,
      this._play, this._musicAtual);

  String get musicAtual => _musicAtual;



  set musicAtual(String value) {
    _musicAtual = value;
  }

  bool get play => _play;

  set play(bool value) {
    _play = value;
  }

  String get tempoMuscian => _tempoMuscian;

  set tempoMuscian(String value) {
    _tempoMuscian = value;
  }

  Duration get postition => _postition;

  set postition(Duration value) {
    _postition = value;
  }

  Duration get duration => _duration;

  set duration(Duration value) {
    _duration = value;
  }

  double get sliderVal => _sliderVal;

  set sliderVal(double value) {
    _sliderVal = value;
  }

  String get locasFilepath => _locasFilepath;

  set locasFilepath(String value) {
    _locasFilepath = value;
  }

  AudioCache get audioCache => _audioCache;

  set audioCache(AudioCache value) {
    _audioCache = value;
  }

  AudioPlayer get audioPlayer => _audioPlayer;

  set audioPlayer(AudioPlayer value) {
    _audioPlayer = value;
  }


}