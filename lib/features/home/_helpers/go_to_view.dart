import '../../../_providers/_providers.dart';

void goToView(String type) {
  if (type != state.views.view) {
    state.views.setView(type);
  }
}
