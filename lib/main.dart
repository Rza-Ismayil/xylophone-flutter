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

  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
  ];

  List<Expanded> generateButtons() {
    List<Expanded> boxes = [];
    for (int i = 1; i < 8; i++) {
      boxes.add(Expanded(
        child: TextButton(
          onPressed: () => player.play('note$i.wav'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colors[i - 1]),
          ),
          child: Text(
            '.',
            style: TextStyle(
              color: colors[i - 1],
            ),
          ),
        ),
      ));
    }
    return boxes;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: generateButtons(),
          ),
        ),
      ),
    );
  }
}
