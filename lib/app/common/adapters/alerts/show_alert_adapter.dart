import 'package:ipoanki/app/common/adapters/alerts/show_alert_adapter_interface.dart';

class ShowAlertAdapter implements IShowAlertAdapter {
  final void Function(String) functionSnackBar;

  ShowAlertAdapter({
    required this.functionSnackBar,
  });
  @override
  void showAlertSnackBar(String text) {
    functionSnackBar(text);
  }
}
