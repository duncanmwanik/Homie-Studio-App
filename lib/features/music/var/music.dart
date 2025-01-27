import '../../../_models/effect.dart';

const List<Effect> hubMusic = <Effect>[
  Effect(title: 'Music 1', code: 'vu1'),
  Effect(title: 'Music 1 Centered', code: 'vu1c'),
  Effect(title: 'Music 2', code: 'vu2'),
  Effect(title: 'Music 2 Centered', code: 'vu2c'),
  Effect(title: 'Music 3', code: 'vu3'),
  Effect(title: 'Music 3 Centered', code: 'vu3c'),
  Effect(title: 'Music 4', code: 'vu4'),
  Effect(title: 'Music 4 Centered', code: 'vu4b'),
  Effect(title: 'Music 5', code: 'vu5'),
];

Map<String, String> musicMap = {for (var music in hubMusic) music.code: music.title};

List<String> buttonMusic = ['v200', 'v201', 'v202', 'v203', 'v204', 'v205', 'v206', 'v207', 'v208'];
