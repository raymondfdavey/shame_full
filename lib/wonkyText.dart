import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

random(min, max) {
  var rn = new Random();
  return min + rn.nextInt(max - min);
}

int num = random(1, 1000);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: Scaffold(
          body: MainPage(),
        ));
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void handleClick(String letter) {
    if (letter == selectedLetter) {
      setState(() {
        selectedLetter = "";
      });
    } else {
      setState(() {
        selectedLetter = letter;
      });
      if (selectedLetter == "E") {
        playLocal();
      } else {
        stopAudio();
      }
    }
  }

  String selectedLetter = '';
  TextStyle mainLetters =
      TextStyle(color: Colors.blue, fontSize: 90, fontWeight: FontWeight.bold);
  TextStyle links = TextStyle(
    color: Colors.red,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'mR_IXZJyQPI',
    params: YoutubePlayerParams(
      startAt: Duration(seconds: num),
      showControls: false,
      showFullscreenButton: true,
      mute: true,
    ),
  );
  final player = new AudioCache(fixedPlayer: AudioPlayer());
  String url = '../assets/audios/noShame.mp3'; //local mp3 file in asset folder

  playLocal() async {
    await player.play(url);
  }

  stopAudio() async {
    await player.fixedPlayer?.stop();
  }

  @override
  void initState() {
    super.initState();
    player.fixedPlayer?.stop();
  }

  @override
  void dispose() {
    super.dispose();
    player.fixedPlayer?.stop();
  }

  @override
  Widget build(BuildContext context) {
    bool isScreenSmall = MediaQuery.of(context).size.width < 600;
    bool isScreenTiny = MediaQuery.of(context).size.width < 400;
    print(MediaQuery.of(context).size.width);
    return Container(
        alignment: Alignment.center,
        child: Center(
            child: Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          direction: isScreenSmall ? Axis.horizontal : Axis.vertical,
          children: [
            Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              direction: isScreenSmall ? Axis.vertical : Axis.horizontal,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      handleClick("S");
                    },
                    child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 10.0),
                        child: selectedLetter == "S"
                            ? Container(
                                height: 100,
                                width: 100,
                                child: Image(
                                  image: AssetImage('aqua.png'),
                                  fit: BoxFit.cover,
                                ))
                            : Text("S", style: mainLetters))),
                selectedLetter == "A"
                    ? isScreenSmall
                        ? Text("BANDCAMP", style: links)
                        : Column(
                            children: <Widget>[
                              Text(
                                "Y",
                                style: links,
                                textAlign: TextAlign.center,
                              ),
                              Text("O",
                                  style: links, textAlign: TextAlign.center),
                              Text("U",
                                  style: links, textAlign: TextAlign.center),
                              Text("T",
                                  style: links, textAlign: TextAlign.center),
                              Text("U",
                                  style: links, textAlign: TextAlign.center),
                              Text("B",
                                  style: links, textAlign: TextAlign.center),
                              Text("E",
                                  style: links, textAlign: TextAlign.center),
                            ],
                          )
                    // : RotatedBox(
                    //     quarterTurns: 1,
                    //     child: RichText(
                    //       textAlign: TextAlign.start,
                    //       text: TextSpan(
                    //         text: 'BANDCAMP',
                    //         style: links,
                    //       ),
                    //     ),
                    //   )

                    //
                    : Container(),
                GestureDetector(
                    onTap: () {
                      handleClick("H");
                    },
                    child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 10.0),
                        child: selectedLetter == "H"
                            ? Container(
                                height: 100,
                                width: 100,
                                child: Image(
                                  image: AssetImage('black.png'),
                                  fit: BoxFit.cover,
                                ))
                            : Text("H", style: mainLetters))),
                selectedLetter == "A"
                    ? isScreenSmall
                        ? Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: Text("WIKIPEDIA", style: links))
                        : Column(
                            children: <Widget>[
                              Text(
                                "W",
                                style: links,
                                textAlign: TextAlign.center,
                              ),
                              Text("I",
                                  style: links, textAlign: TextAlign.center),
                              Text("K",
                                  style: links, textAlign: TextAlign.center),
                              Text("I",
                                  style: links, textAlign: TextAlign.center),
                              Text("P",
                                  style: links, textAlign: TextAlign.center),
                              Text("E",
                                  style: links, textAlign: TextAlign.center),
                              Text("D",
                                  style: links, textAlign: TextAlign.center),
                              Text("I",
                                  style: links, textAlign: TextAlign.center),
                              Text("A",
                                  style: links, textAlign: TextAlign.center),
                            ],
                          )
                    //     //
                    : Container(),
                GestureDetector(
                    onTap: () {
                      handleClick("A");
                    },
                    child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 10.0),
                        child: selectedLetter == "A"
                            ? Container(
                                height: 100,
                                width: 100,
                                child: Image(
                                  image: AssetImage('blue.png'),
                                  fit: BoxFit.cover,
                                ))
                            : Text("A", style: mainLetters))),
                GestureDetector(
                    onTap: () {
                      handleClick("M");
                    },
                    child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 10.0),
                        child: selectedLetter == "M"
                            ? Container(
                                height: 100,
                                width: 100,
                                child: Image(
                                  image: AssetImage('green.png'),
                                  fit: BoxFit.cover,
                                ))
                            : Text("M", style: mainLetters))),
                selectedLetter == "A"
                    ? isScreenSmall
                        ? Text("YOUTUBE", style: links)
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "B",
                                style: links,
                                textAlign: TextAlign.center,
                              ),
                              Text("A",
                                  style: links, textAlign: TextAlign.center),
                              Text("N",
                                  style: links, textAlign: TextAlign.center),
                              Text("D",
                                  style: links, textAlign: TextAlign.center),
                              Text("C",
                                  style: links, textAlign: TextAlign.center),
                              Text("A",
                                  style: links, textAlign: TextAlign.center),
                              Text("M",
                                  style: links, textAlign: TextAlign.center),
                              Text("P",
                                  style: links, textAlign: TextAlign.center),
                            ],
                          )
                    // : RotatedBox(
                    //     quarterTurns: 1,
                    //     child: RichText(
                    //       textAlign: TextAlign.center,
                    //       text: TextSpan(
                    //         text: 'YOUTUBE',
                    //         style: links,
                    //       ),
                    //     ),
                    //   )
                    //
                    : Container(),
                GestureDetector(
                    onTap: () {
                      handleClick("E");
                    },
                    child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 10.0),
                        child: selectedLetter == "E"
                            ? Container(
                                height: 100,
                                width: 100,
                                child: Image(
                                  image: AssetImage('red.png'),
                                  fit: BoxFit.cover,
                                ))
                            : Text("E", style: mainLetters))),
              ],
            ),
            selectedLetter == "E"
                ? Container(
                    height: isScreenSmall ? 150 : isScreenTiny? 100 : 250,
                    width: isScreenSmall ? 225 : isScreenTiny?150 : 375,
                    child: YoutubePlayerIFrame(
                      controller: _controller,
                      aspectRatio: 16 / 9,
                    ),
                  )
                : Container(),
          ],
        )));
  }
}
