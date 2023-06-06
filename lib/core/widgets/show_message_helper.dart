import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showMessage(String message) {
  return Fluttertoast.showToast(msg: message);
}
