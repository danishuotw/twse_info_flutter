import 'package:intl/intl.dart';

extension StringEx on String {
  String numberFormat() {
    final value = double.tryParse(this);
    if (value == null) return 'error';
    final stringBuffer = StringBuffer('#,###');
    return NumberFormat(stringBuffer.toString()).format(value);
  }
}
