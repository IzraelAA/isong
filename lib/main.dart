import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isong/AudioPlayerObject.dart';
import 'AudioController.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isong',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  double _tela;

  @override
  Widget build(BuildContext context) {
    _tela = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Isong"),
        ),
        body: Container(
          child: _play(),
        ));
  }

  Widget _tab(List<Widget> children) {
    return Center(
        child: Container(
      child: Column(
        children: children
            .map((c) => Container(
                  child: c,
                  padding: EdgeInsets.all(10.0),
                ))
            .toList(),
      ),
    ));
  }

  Widget _play() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          StreamBuilder(
              stream: audioc.outDuration,
              builder: (context, AsyncSnapshot<AudioPlayerObject> snapshot) {
                return _tab([
                  Text(
                    snapshot.data.musicAtual,
                    style: TextStyle(fontSize: _tela * .05),
                  ),
                  slider(snapshot.data),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("00:00"),
                      Text(snapshot.data.duration.inMinutes.toString() +
                          ":" +
                          (snapshot.data.duration.inSeconds - (snapshot.data.duration.inMinutes * 60)).toString()),
                    ],
                  ),
                  acces(snapshot.data)
                ]);
              }),
          Divider(),
          _listMusic('m.mp3'),
          _listMusic('b.mp3'),
          _listMusic('z.mp3'),
          Divider(),
        ],
      ),
    );
  }

  double temp = 0;

  Widget slider(AudioPlayerObject object) {
    return Slider(
      activeColor: Colors.amber,
      value: object.postition.inSeconds.toDouble(),
      max: object.duration.inSeconds.toDouble(),
      min: 0,
      onChanged: (newVal) {
        setState(() {
          audioc.tempoMusic(newVal);
          print(object.postition.inSeconds.toDouble());
        });
      },
    );
  }

  Widget acces(AudioPlayerObject object) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
            iconSize: _tela * .1,
            icon: Icon(Icons.skip_previous),
            onPressed:(){} ),
        IconButton(
            iconSize: _tela * .2,
            icon: Icon(object.play == true
                ? Icons.pause_circle_filled
                : Icons.play_circle_filled),
            onPressed: (){
              audioc.botaoPlayPause();
            }),
        IconButton(
            iconSize: _tela * .1, icon: Icon(Icons.skip_next), onPressed:(){} ),
      ],
    );
  }
  Widget _listMusic(String music){
    print("List Musik");
    return ListTile(
      title: Text(music),
      leading:  Icon(Icons.music_note),

      onTap: (){
        audioc.trocarMusic(music);
      },
    );
  }
}
