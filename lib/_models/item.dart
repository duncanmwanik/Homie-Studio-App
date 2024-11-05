class Item {
  Item({
    this.parent = '',
    this.id = '',
    this.sid = '',
    required this.data,
  });

  String parent;
  String id;
  String sid;
  Map data;

  Item.empty() : this(data: {});

  String title([String? place]) => data['t'] != null && data['t'] != '' ? data['t'] : (place ?? 'Untitled');
  String? color() => data['c'];
}
