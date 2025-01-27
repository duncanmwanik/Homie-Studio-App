class Effect {
  const Effect({
    required this.title,
    required this.code,
  });

  final String title;
  final String code;

  bool isFav() => code.isEmpty;
}
