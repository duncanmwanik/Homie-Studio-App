import '../../../_models/effect.dart';

const List<Effect> hubMusic = <Effect>[
  Effect(title: 'Music 1', code: 'v200'),
  Effect(title: 'Music 1B', code: 'v201'),
  Effect(title: 'Music 2', code: 'v202'),
  Effect(title: 'Music 2B', code: 'v203'),
  Effect(title: 'Music 3', code: 'v204'),
  Effect(title: 'Music 3B', code: 'v205'),
  Effect(title: 'Music 4', code: 'v206'),
  Effect(title: 'Music 4B', code: 'v207'),
  Effect(title: 'Music 5', code: 'v208'),
];

Map<String, String> musicMap = {for (var music in hubMusic) music.code: music.title};

List<String> buttonMusic = ['v200', 'v201', 'v202', 'v203', 'v204', 'v205', 'v206', 'v207', 'v208'];
