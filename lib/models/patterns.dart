class PatternObject {
  const PatternObject({required this.code, required this.title});
  final String code;
  final String title;
}

const List<PatternObject> patternList = <PatternObject>[
  PatternObject(title: "Bit", code: 'p0'),
  PatternObject(title: "Bit Color", code: 'p1'),
  PatternObject(title: "Bounce 3", code: 'p2'),
  PatternObject(title: "Bounce 6", code: 'p3'),
  // PatternObject(title: "Bounce Color 3", code: 'p4'),
  // PatternObject(title: "Bounce Color 6", code: 'p5'),
  PatternObject(title: "BPM", code: 'p6'),
  PatternObject(title: "Colorwipe RGB", code: 'p8'),
  PatternObject(title: "Colorwipe Main", code: 'p9'),
  PatternObject(title: "Colorwipe Random", code: 'p10'),
  PatternObject(title: "Color Jar", code: 'p29'),
  PatternObject(title: "Color Fly", code: 'p30'),
  PatternObject(title: "Confetti", code: 'p7'),
  PatternObject(title: "Cylon Bounce", code: 'p11'),
  PatternObject(title: "Fire", code: 'p12'),
  PatternObject(title: "Fill", code: 'p36'),
  PatternObject(title: "Halloween Eyes", code: 'p13'),
  PatternObject(title: "Halloween Eyes Main", code: 'p14'),
  PatternObject(title: "Juggle", code: 'p15'),
  PatternObject(title: "Juggle Mini", code: 'p16'),
  PatternObject(title: "Matrix 1", code: 'p46'),
  PatternObject(title: "Matrix 2", code: 'p47'),
  PatternObject(title: "Matrix 3", code: 'p48'),
  PatternObject(title: "Matrix 4", code: 'p49'),
  PatternObject(title: "Matrix 5", code: 'p50'),
  PatternObject(title: "Meteor Rain", code: 'p17'),
  PatternObject(title: "Meteor Shower", code: 'p18'),
  PatternObject(title: "Mini Boss", code: 'p19'),
  PatternObject(title: "New KITT", code: 'p20'),
  PatternObject(title: "Pacifica", code: 'p24'),
  PatternObject(title: "Palette", code: 'p21'),
  PatternObject(title: "Party Of Colors", code: 'p22'),
  // PatternObject(title: "---", code: 'p23'),
  PatternObject(title: "Pride", code: 'p25'),
  PatternObject(title: "Rainbow Cycle", code: 'p26'),
  PatternObject(title: "Rainbow Run", code: 'p27'),
  PatternObject(title: "RGB Loop", code: 'p28'),
  PatternObject(title: "Running Lights", code: 'p31'),
  PatternObject(title: "Sinelon", code: 'p32'),
  PatternObject(title: "Sinelon Random", code: 'p33'),
  // PatternObject(title: "Sinelon 2", code: 'p34'),
  PatternObject(title: "Snow Sparkle", code: 'p35'),
  // PatternObject(title: "---", code: 'p36'),
  PatternObject(title: "Sparkle", code: 'p37'),
  PatternObject(title: "Sparkle Main", code: 'p38'),
  PatternObject(title: "Sparkle Random", code: 'p39'),
  PatternObject(title: "Strobe", code: 'p40'),
  PatternObject(title: "Theater Chase", code: 'p41'),
  PatternObject(title: "Theater Chase Rainbow", code: 'p42'),
  PatternObject(title: "Twinkle", code: 'p43'),
  PatternObject(title: "Twinkle Random", code: 'p44'),
  PatternObject(title: "Twinkle 2", code: 'p45'),
];

Map<String, String> patternsMap = {for (var pattern in patternList) pattern.code: pattern.title};

List<String> buttonPatterns = ["p1", "p2", "p8", "p12", "p15", "p18", "p21", "p24", "p29"];
