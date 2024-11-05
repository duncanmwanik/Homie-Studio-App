List<String> splitList(String? string, {String separator = '|', bool clearEmpties = true}) {
  if (string != null) return clearEmpties ? string.split(separator).where((e) => e.isNotEmpty).toList() : string.split(separator);
  return [];
}

String joinList(List list) => list.isNotEmpty ? list.join('|') : '';
String getUniqueId() => DateTime.now().millisecondsSinceEpoch.toString();
