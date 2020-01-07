import 'package:kilobytes_flutter_core/core.dart';
import 'package:kilobytes_flutter_core/src/util/objects.dart';

class DkBenchMark {
   static int _startTime;
   static String _taskName;

   static void tick(Object where, Object tag) {
      String message;

      if (_taskName == null) {
         _taskName = tag;
         message = "Start ticking [$tag]";
      }
      else {
         int elapsed = DateTime.now().millisecond - _startTime;
         message = "Elapsed $elapsed (ms) for tag #$tag";
      }
      
      DkLogs.debug(where, message);
      
      _startTime = DateTime.now().millisecond;
   }

   static void tock(Object where) {
      DkObjects.requireNonNull(_taskName);

      int elapsed = DateTime.now().millisecond - _startTime;
      String message = "End ticking [$_taskName] in $elapsed (ms)";

      DkLogs.debug(where, message);
      
      _startTime = null;
      _taskName = null;
   }
}
