import 'package:flutter/material.dart';
import 'package:uni_color_palette/uni_color_palette.dart';

/// See also `example/main.dart` file with pure Dart SDK example.
/// You can choose any palette.
void main() => runApp(App(
      palette: UniPalette(zeplinColors),
    ));

class App extends StatelessWidget {
  const App({super.key, required this.palette});

  final UniPalette<RgbInt8Color> palette;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('AllPalettes'),
            ),
          ),
          body: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [note, ...glasses],
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );

  Widget get note => Text(
        'The palette contains ${palette.count} colors.',
        textScaler: const TextScaler.linear(1.5),
      );

  List<Widget> get glasses => [
        for (final color in palette.list..sort()) Glass(color.rgbInt8Color),
      ];
}

class Glass extends StatelessWidget {
  const Glass(
    this.color, {
    super.key,
  });

  final RgbInt8Color color;

  String get code => '#$color';

  @override
  Widget build(BuildContext context) {
    final c = Color(color.int24).withOpacity(1.0);

    final size = MediaQuery.of(context).size;
    final height = size.height / 12;

    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: c,
              offset: const Offset(0, 2),
              blurRadius: 1,
            )
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, c],
          ),
        ),
        height: height,
        alignment: Alignment.centerLeft,
        child: Text(
          '$code ${color.name}',
          textScaler: const TextScaler.linear(2),
        ),
      ),
    );
  }
}
