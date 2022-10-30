Map<String, String> musicMap = {
  'p5101': "Music 1",
  'p5102': "Music 1C",
  'p5201': "Music 2",
  'p5202': "Music 2C",
  'p5301': "Music 3",
  'p5302': "Music 3C",
  'p5401': "Music 4",
  'p5402': "Music 4C",
  'p5501': "Music 5",
};

List<String> buttonMusic = [
  "p5101",
  "p5102",
  "p5201",
  "p5202",
  "p5301",
  "p5302",
  "p5401",
  "p5402",
  "p5501",
];

class MusicObject {
  const MusicObject({required this.code, required this.title});
  final String code;
  final String title;
}

const List<MusicObject> musicList = <MusicObject>[
  MusicObject(title: "Music 1", code: 'p5101'),
  MusicObject(title: "Music 1B", code: 'p5102'),
  MusicObject(title: "Music 2", code: 'p5201'),
  MusicObject(title: "Music 2B", code: 'p5202'),
  MusicObject(title: "Music 3", code: 'p5301'),
  MusicObject(title: "Music 3B", code: 'p5302'),
  MusicObject(title: "Music 4", code: 'p5401'),
  MusicObject(title: "Music 4B", code: 'p5402'),
  MusicObject(title: "Music 5", code: 'p5501'),
];
