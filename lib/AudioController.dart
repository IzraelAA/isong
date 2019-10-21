import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:isong/AudioPlayerObject.dart';
import 'package:rxdart/rxdart.dart';
class AudioPlayerController extends BlocBase{
  BehaviorSubject<AudioPlayerObject> dur = new BehaviorSubject<AudioPlayerObject>();
  Stream<AudioPlayerObject> get outDuration => dur.stream;
  Sink<AudioPlayerObject> get inDuration => dur.sink;
  AudioPlayer audioPlayer = new AudioPlayer();
  AudioPlayerObject audioPlayerObject;

  AudioPlayerController(){
    audioPlayerObject = new AudioPlayerObject(audioPlayer,
    new AudioCache(fixedPlayer: audioPlayer), "",0,
    new Duration(),new Duration(),
    "",false,"");

    audioPlayerObject.audioPlayer.onDurationChanged.listen((Duration d){
      audioPlayerObject.duration = d;
      inDuration.add(audioPlayerObject);
    });
    audioPlayerObject.audioPlayer.onAudioPositionChanged.listen((Duration p){
      audioPlayerObject.postition = p;
      inDuration.add(audioPlayerObject);
    });
    audioPlayerObject.musicAtual ='Malaikat.mp3';
    inDuration.add(audioPlayerObject);
  }
   botaoPlayPause(){
    if(audioPlayerObject.play){
      audioPlayerObject.play = false;
      audioPlayerObject.audioPlayer.pause();
    }else {
      audioPlayerObject.play = true;
      audioPlayerObject.audioCache.play(audioPlayerObject.musicAtual);
    }
    inDuration.add(audioPlayerObject);
   }
   trocarMusic(String music){
    audioPlayerObject.musicAtual = music;
    print(music);
    audioPlayerObject.audioCache.play(audioPlayerObject.musicAtual);
    audioPlayerObject.play = true;
    inDuration.add(audioPlayerObject);
   }
   tempoMusic(double newValeu){
    Duration newDuration = Duration (seconds:  newValeu.toInt());
    audioPlayerObject.audioPlayer.seek(newDuration);
    audioPlayerObject.tempoMuscian = newValeu.toStringAsFixed(0);
    audioPlayerObject.audioPlayer.resume();
    audioPlayerObject.play = true;
    inDuration.add(audioPlayerObject);
    print(newValeu.toInt());
   }
  @override
  void dispose() {
    // TODO: implement dispose
  }

}

AudioPlayerController audioc = new AudioPlayerController();