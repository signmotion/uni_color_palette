import '../../uni_color_palette.dart';

typedef C = RgbInt8Color;

/// Helper sheet: https://docs.google.com/spreadsheets/d/1f8wvrgqfGcXFAiAXx-p9CgLXo3__IoEn8-Us-uRyfok/edit#gid=0
final commodore64Palette = UniPalette(
  _commodore64Colors,
  name: 'Commodore 64',
  license: '',
  source: 'https://en.wikipedia.org/wiki/Commodore_64#Graphics',
);

final _commodore64Colors = [
  C.rgbIndexName(0x00, 0x00, 0x00, 0, 'black'),
  C.rgbIndexName(0xff, 0xff, 0xff, 1, 'white'),
  C.rgbIndexName(0x9f, 0x4e, 0x44, 2, 'red'),
  C.rgbIndexName(0x6a, 0xbf, 0xc6, 3, 'cyan'),
  C.rgbIndexName(0xa0, 0x57, 0xa3, 4, 'purple'),
  C.rgbIndexName(0x5c, 0xab, 0x5e, 5, 'green'),
  C.rgbIndexName(0x50, 0x45, 0x9b, 6, 'blue'),
  C.rgbIndexName(0xc9, 0xd4, 0x87, 7, 'yellow'),
  C.rgbIndexName(0xa1, 0x68, 0x3c, 8, 'orange'),
  C.rgbIndexName(0x6d, 0x54, 0x12, 9, 'brown'),
  C.rgbIndexName(0xcb, 0x7e, 0x75, 10, 'light red'),
  C.rgbIndexName(0x62, 0x62, 0x62, 11, 'dark-gray'),
  C.rgbIndexName(0x89, 0x89, 0x89, 12, 'mid-gray'),
  C.rgbIndexName(0x9a, 0xe2, 0x9b, 13, 'light green'),
  C.rgbIndexName(0x88, 0x7e, 0xcb, 14, 'light blue'),
  C.rgbIndexName(0xad, 0xad, 0xad, 15, 'light-gray'),
];
