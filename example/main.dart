// ignore_for_file: avoid_print

import 'package:uni_color_palette/uni_color_palette.dart';

/// See also `example/all_palettes` forlder with Flutter SDK example
/// that visualize a palette.
void main() {
  final palette = zeplinPalette;

  print('I know ${palette.count} colors.');
  print(palette['forrest green']);

  final all = palette.list.map((c) => c.name).toList()..sort();
  print('All colors from the palette:\n${all.join(', ')}');
}
