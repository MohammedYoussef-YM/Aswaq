
import 'package:intl/intl.dart';

class Utils {

  static String dateFormatStyle() {
    String date = DateFormat('kk:mm:a ').format(DateTime.now());
    return date ;
  }
}
