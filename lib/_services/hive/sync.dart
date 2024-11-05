import 'package:hive/hive.dart';

import '../../_helpers/debug.dart';
import 'store.dart';

Future<bool> syncStore({
  String? space,
  String parent = '',
  required String action,
  var data,
  String id = '',
  String sid = '',
  String keys = '',
}) async {
  bool success = false;

  try {
    bool isNew = action.startsWith('c');
    bool isEdit = action.startsWith('e');
    bool isDelete = action.startsWith('d');
    Box box = storage(parent);

    //
    // new stuff
    //
    if (isNew) {
      if (sid.isNotEmpty) {
        Map itemData = box.get(id, defaultValue: {});
        itemData[sid] = data;
        await box.put(id, itemData);
      } else if (sid.isEmpty && id.isEmpty) {
        box.putAll(data);
      } else {
        await box.put(id, data);
      }
    }
    //
    // editing
    //
    else if (isEdit) {
    }
    //
    //deleting items
    //
    else if (isDelete) {
      if (sid.isNotEmpty) {
        Map itemData = box.get(id);
        itemData.remove(sid);
        await box.put(id, itemData);
      } else {
        await box.delete(id);
      }
    }
    //
    success = true;
    //
  } catch (e) {
    logError('syncStore-$parent-$action-$id-$sid-$keys-$data', e);
  }

  return success;
}
