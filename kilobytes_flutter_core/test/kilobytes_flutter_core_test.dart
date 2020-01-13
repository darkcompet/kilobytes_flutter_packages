import 'package:flutter_test/flutter_test.dart';
import 'package:kilobytes_flutter_core/core.dart';
import 'package:kilobytes_flutter_core/src/log/benchmark.dart';
import 'package:kilobytes_flutter_core/src/util/maths.dart';

void main() {
  test('Tester', () {
    Tester().start();
  });
}

class Tester {
   void start() {
      DkLogs.debug("'", "msg");
   }
}
