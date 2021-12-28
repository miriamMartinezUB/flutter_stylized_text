import 'package:flutter/material.dart';
import 'package:flutter_stylized_text/flutter_stylized_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stylized Text'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FlutterStylizedText(
                    text: 'Uses:\n'
                        '\ncolored: [Hi, this is an example](C)'
                        '\nitalic: [Hi, this is an example](I)'
                        '\nbold: [Hi, this is an example](B)'
                        '\nunderline: [Hi, this is an example](U)'
                        '\nline throught: [Hi, this is an example](T)'
                        '\n\nyou can also combine the styles, is indifferent the order and if you indicate it with upper or under case\n'
                        '\ncolored + italic: [Hi, this is an example](CI)'
                        '\ncolored + bold: [Hi, this is an example](CB)'
                        '\ncolored + italic + bold: [Hi, this is an example](CIB)'
                        '\n\nWarning, you cannot use the underline(U) and the line through(T) at the same time\n\nHappy coding! :)',
                    fontSize: 18,
                    color: Colors.black,
                    stylizedTextColor: Colors.blue,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.center,
                  ),
                  Image.network(
                    'https://media.giphy.com/media/jUwpNzg9IcyrK/giphy.gif',
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
