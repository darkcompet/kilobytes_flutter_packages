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
      print(DkMaths.parseInt("-123456789"));
      print(DkMaths.parseInt("---12x;+123456x"));
      print(DkMaths.parseInt("-+++----1 x;+123456x"));
      print(DkMaths.parseInt("-+++---- 1++x;+123456x"));

      DkBenchMark.tick(this, "parse");

      for (int i = 0; i < 10000000; ++i) {
         int.parse("-123456789");
      }

      DkBenchMark.tock(this);

      DkBenchMark.tick(this, "parseInt");

      for (int i = 0; i < 10000000; ++i) {
         DkMaths.parseInt("-123456789");
      }
      
      DkBenchMark.tock(this);
   }
}
