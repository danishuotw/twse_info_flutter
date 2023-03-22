import 'package:intl/intl.dart';

extension StringNumberFormatEx on String {
  String numberFormat() {
    final value = double.tryParse(this);
    if (value == null) return 'error';
    final stringBuffer = StringBuffer('#,###');
    return NumberFormat(stringBuffer.toString()).format(value);
  }
}

extension StringDateFormatEx on String {
  String dataFormat() {
    final format = DateFormat('yyyy/MM/dd');
    return format.format(DateTime.parse(this));
  }
}
