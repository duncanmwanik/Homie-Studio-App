import '../../_helpers/navigation.dart';
import '../buttons/action.dart';
import '../others/others/other.dart';
import '../others/text.dart';
import 'app_dialog.dart';

Future<void> showConfirmationDialog({
  required String title,
  String content = '',
  String? yeslabel,
  String? noLabel,
  bool showBottomPadding = false,
  required Function() onAccept,
}) async {
  bool yes = false;

  await showAppDialog(
    title: title,
    content: content.isNotEmpty ? AppText(text: content, faded: true) : const NoWidget(),
    actions: [
      ActionButton(
          isCancel: true,
          label: noLabel,
          onPressed: () {
            popWhatsOnTop();
          }),
      ActionButton(
          label: yeslabel,
          onPressed: () {
            yes = true;
            popWhatsOnTop();
          }),
    ],
  );

  if (yes) onAccept();
}
