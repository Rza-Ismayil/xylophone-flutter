import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  // add these lines
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  final player = AudioCache();

  List<ElevatedButton> generateButtons(List colors) {
    List<ElevatedButton> boxes = [];
    for (int i = 1; i < 8; i++) {
      boxes.add(ElevatedButton(
        onPressed: () => player.play('note$i.wav'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(colors[i - 1]),
        ),
        child: const SizedBox(
          height: 80.0,
          width: 240.0,
        ),
      ));
    }
    return boxes;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: generateButtons([
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.teal,
                Colors.blue,
                Colors.purple,
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
