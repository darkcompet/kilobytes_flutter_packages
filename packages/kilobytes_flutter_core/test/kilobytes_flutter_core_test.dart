import 'package:flutter_test/flutter_test.dart';
import 'package:kilobytes_flutter_core/core.dart';

void main() {
  test('test log', () {
    Tester().start();
  });
}

class Tester {
   void start() {
      DkLogs.debug(this, "test debug");
   }
}
