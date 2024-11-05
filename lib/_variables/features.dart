Features feature = Features();

class Features {
  String colors = 'colors';
  String patterns = 'patterns';
  String music = 'music';
  String mixer = 'mixer';
  String favorites = 'favorites';
}

extension FeatureExtentions on String {
  bool isColors() => feature.colors == this;
  bool isPatterns() => feature.patterns == this;
  bool isMusic() => feature.music == this;
  bool isMixer() => feature.mixer == this;
  bool isFavorites() => feature.favorites == this;
}
