import 'package:flutter/material.dart';
import 'package:uni_color_palette/uni_color_palette.dart';

/// See also `example/main.dart` file with pure Dart SDK example.
/// You can choose any palette.
void main() => runApp(App(
      palettes: [
        commodore64Palette,
        ralPalette,
        // zeplinPalette,
      ],
    ));

class App extends StatelessWidget {
  const App({super.key, required this.palettes});

  final List<UniPalette<int>> palettes;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('AllColors'),
            ),
          ),
          body: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                commonNote,
                nonUniqueNote,
                ...nonUniqueGlasses,
                uniqueNote,
                ...uniqueGlasses,
              ],
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );

  /// Color values (keys) with colors from palettes.
  Map<int, List<String>> get colors {
    final r = <int, List<String>>{};
    for (final palette in palettes) {
      for (final color in palette.list) {
        r.update(
          color.rgbInt8Color.int24,
          (lc) {
            if (!lc.contains(color.name)) {
              lc.add(color.name);
            }
            return lc;
          },
          ifAbsent: () => [color.name],
        );
      }
    }

    return r;
  }

  Widget get commonNote => Text(
        'The ${palettes.length} palettes contains'
        ' ${colors.length} colors.',
        textScaler: const TextScaler.linear(1.5),
        textAlign: TextAlign.center,
      );

  Widget get nonUniqueNote => Text(
        '${nonUniqueGlasses.length} colors occur several times'
        '\nwith different names:',
        textScaler: const TextScaler.linear(1.4),
        textAlign: TextAlign.center,
      );

  Widget get uniqueNote => Text(
        '${uniqueGlasses.length} colors are unique:',
        textScaler: const TextScaler.linear(1.4),
        textAlign: TextAlign.center,
      );

  List<Widget> get nonUniqueGlasses => [
        for (final e in colors.entries)
          if (e.value.length > 1) Glass(e.key, e.value),
      ];

  List<Widget> get uniqueGlasses => [
        for (final e in colors.entries)
          if (e.value.length == 1) Glass(e.key, e.value),
      ];
}

class Glass extends StatelessWidget {
  const Glass(
    this.color,
    this.names, {
    super.key,
  });

  final int color;
  final List<String> names;

  String get code => '#${color.hex(6)}';

  @override
  Widget build(BuildContext context) {
    final c = Color(color).withOpacity(1.0);

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
          '$code ${names.join(' | ')}',
          textScaler: const TextScaler.linear(1.4),
        ),
      ),
    );
  }
}
