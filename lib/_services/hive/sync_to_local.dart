import 'package:hive/hive.dart';

import '../../_helpers/debug.dart';
import 'store.dart';

Future<bool> syncToLocal({
  required String action,
  String parent = '',
  String? space,
  String id = '',
  String sid = '',
  String key = '',
  var value,
}) async {
  bool success = false;

  try {
    bool isNew = action == 'c';
    bool isDelete = action == 'd';
    Box box = local(parent, space: space);

    // show('::syncToLocal: $action,$parent,$id,$sid,$key,$value');

    // new
    if (isNew) {
      if (key.isNotEmpty && sid.isNotEmpty && id.isNotEmpty) {
        Map itemData = box.get(id, defaultValue: {});
        Map subData = itemData[sid] ?? {};
        subData[key] = value;
        itemData[sid] = subData;
        await box.put(id, itemData);
      }
      //
      else if (key.isNotEmpty && sid.isEmpty && id.isNotEmpty) {
        Map itemData = box.get(id, defaultValue: {});
        itemData[key] = value;
        await box.put(id, itemData);
      }
      //
      else if (key.isEmpty && sid.isNotEmpty && id.isNotEmpty) {
        Map itemData = box.get(id, defaultValue: {});
        itemData[sid] = value;
        await box.put(id, itemData);
      }
      //
      else if (key.isEmpty && sid.isEmpty && id.isNotEmpty) {
        await box.put(id, value);
      }
      //
      else if (key.isNotEmpty && sid.isEmpty && id.isEmpty) {
        await box.put(key, value);
      }
      //
      else {
        await box.putAll(value);
      }
    }
    //deleting
    if (isDelete) {
      if (key.isNotEmpty && sid.isNotEmpty && id.isNotEmpty) {
        Map itemData = box.get(id, defaultValue: {});
        Map subData = itemData[sid] ?? {};
        subData.remove(key);
        itemData[sid] = subData;
        await box.put(id, itemData);
      }
      //
      else if (key.isNotEmpty && sid.isEmpty && id.isNotEmpty) {
        Map itemData = box.get(id, defaultValue: {});
        itemData.remove(key);
        await box.put(id, itemData);
      }
      //
      else if (key.isEmpty && sid.isNotEmpty && id.isNotEmpty) {
        Map itemData = box.get(id);
        itemData.remove(sid);
        await box.put(id, itemData);
      }
      //
      else if (key.isEmpty && sid.isEmpty && id.isNotEmpty) {
        await box.delete(id);
      }
    }

    success = true;
  } catch (e) {
    logError('syncToLocal-$action-$parent-$id-$sid-$key-$value', e);
  }

  return success;
}
