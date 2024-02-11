import 'package:homie_ble/ble/ble_service.dart';

import '../common_variables/state_providers.dart';
import '../data/shared_prefs.dart';
import '../widgets/toast/toast.dart';
import 'global_logic.dart';

void sendCommandToDevice(option) {
  bleService.sendMessageToDevice(option.toString());
  commandWatch.updateSelected(option);
}

void addToFavorite(String type, String option) {
  try {
    // if (type == "color") {
    //   if (commandWatch.favoriteColorList.contains(option)) {
    //     commandWatch.addToFavorite(type, option);
    //     sharedPrefs.setStringList("favoriteColorList", commandWatch.favoriteColorList);
    //     showToast(1, "Added to favorites!");
    //   } else {
    //     showToast(2, "Already in favorites!");
    //   }
    // }
    // if (type == "pattern") {
    //   if (globalWatch.favoritePatternList.contains(option)) {
    //     commandWatch.addToFavorite(type, option);
    //     sharedPrefs.setStringList("favoritePatternList", globalWatch.favoritePatternList);
    //     showToast(1, "Added to favorites!");
    //   } else {
    //     showToast(2, "Already in favorites!");
    //   }
    // }
    // if (type == "music") {
    //   if (commandWatch.favoriteMusicList.contains(option)) {
    //     commandWatch.addToFavorite(type, option);
    //     sharedPrefs.setStringList("favoriteMusicList", commandWatch.favoriteMusicList);
    //     showToast(1, "Added to favorites!");
    //   } else {
    //     showToast(2, "Already in favorites!");
    //   }
    // }
  } catch (e) {
    errorPrint("add-fav", e);
    showToast(0, "Not added to favorites!");
  }
}

void removeFromFavorite(String type, String option) {
  try {
    if (type == "color") {
      if (commandWatch.favoriteColorList.contains(option)) {
        commandWatch.removeFromFavorite(type, option);
        sharedPrefs.setStringList("favoriteColorList", commandWatch.favoriteColorList);
      } else {
        showToast(2, "Hmmm...");
      }
    }
    if (type == "pattern") {
      if (globalWatch.favoritePatternList.contains(option)) {
        commandWatch.removeFromFavorite(type, option);
        sharedPrefs.setStringList("favoritePatternList", globalWatch.favoritePatternList);
      } else {
        showToast(2, "Hmmm...");
      }
    }
    if (type == "music") {
      if (commandWatch.favoriteMusicList.contains(option)) {
        commandWatch.removeFromFavorite(type, option);
        sharedPrefs.setStringList("favoriteMusicList", commandWatch.favoriteMusicList);
      } else {
        showToast(2, "Hmmm...");
      }
    }
  } catch (e) {
    errorPrint("remove-fav", e);
    showToast(0, "Failed to remove!");
  }
}

void changePatternSpeed(int value) {}

void changeMusicSensitivity(int value) {}
