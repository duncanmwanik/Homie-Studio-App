class MusicObject {
  const MusicObject({required this.code, required this.title});
  final String code;
  final String title;
}

const List<MusicObject> musicList = <MusicObject>[
  MusicObject(title: "Music 1", code: 'v200'),
  MusicObject(title: "Music 1B", code: 'v201'),
  MusicObject(title: "Music 2", code: 'v202'),
  MusicObject(title: "Music 2B", code: 'v203'),
  MusicObject(title: "Music 3", code: 'v204'),
  MusicObject(title: "Music 3B", code: 'v205'),
  MusicObject(title: "Music 4", code: 'v206'),
  MusicObject(title: "Music 4B", code: 'v207'),
  MusicObject(title: "Music 5", code: 'v208'),
];

Map<String, String> musicMap = {for (var music in musicList) music.code: music.title};

List<String> buttonMusic = [
  "v200",
  "v201",
  "v202",
  "v203",
  "v204",
  "v205",
  "v206",
  "v207",
  "v208",
];
