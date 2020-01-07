//import 'dart:io';
import 'dart:math' show max;

import 'package:flutter/foundation.dart' show kReleaseMode;

/**
 * Standard (Console) log utility class. Some function can be used in debug mode,
 * but some can be only used in release mode. To use all functions of this,
 * caller maybe need wrap with `if (kDebugMode) {}` or `if (DEBUG) {}`.
 * 
 * @author: `darkcompet` (co.vp@kilobytes.com.vn)
 */
class DkLogs {
   /// Write log. Note that, we can use `stdout.writeln()` instead.
   static void _log(bool invalidInReleaseMode, String type, Object where, String msg) {
      if (kReleaseMode && invalidInReleaseMode) {
         throw "Cannot use log $type in release mode";
      }
      print("${_makePrefix(where, type)} $msg");
   }

   /// Create prefix from [where] and [type] of log.
   static String _makePrefix(Object where, String type) {
      String prefix = where == null ? 'Unknown' : where.toString();
      // got prefix: Instance of 'where'
      prefix = prefix.substring(max(0, prefix.indexOf("'")));
      return "_____ $type $prefix~";
   }

   /// Debug log. Cannot use in release mode.
   static void debug(Object where, String msg) {
      _log(false, "[DEBUG]", where, msg);
   }

   /// Info log. Cannot use in release mode.
   static void logi(Object where, String msg) {
      _log(false, "[INFO]", where, msg);
   }

   /// Warning log. Can use in release mode.
   static void logw(Object where, String msg) {
      _log(false, "[WARN]", where, msg);
   }

   /// Error log. Can use in release mode.
   static void logex(Object where, Exception e) {
      _log(false, "[ERROR]", where, e.toString());
   }

   /// Error log. Can use in release mode.
   static void loge(Object where, String msg) {
      _log(false, "[ERROR]", where, msg);
   }
}
