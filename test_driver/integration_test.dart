import 'dart:convert';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver.dart';
import 'package:path/path.dart' as path;

Future<void> main() async {
  integrationDriver(
    responseDataCallback: (Map<String, dynamic>? data) async {
      await fs.directory(_destinationDirectory).create(recursive: true);

      final file = fs.file(
        path.join(
          _destinationDirectory,
          '$_testOutputFilename.json',
        ),
      );

      if (data != null) {
        final resultString = _encodeJson(data);
        await file.writeAsString(resultString);
      }
    },
  );
}

String _encodeJson(Map<String, dynamic> jsonObject) {
  return _prettyEncoder.convert(jsonObject);
}

const _prettyEncoder = JsonEncoder.withIndent('  ');
const _testOutputFilename = 'integration_response_data';
const _destinationDirectory = 'integration_test';
