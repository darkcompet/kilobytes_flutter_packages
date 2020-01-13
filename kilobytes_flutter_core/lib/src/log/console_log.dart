//import 'dart:io';
import 'dart:math' show max;

import 'package:flutter/foundation.dart' show kReleaseMode;

/**
 * Standard (Console) log utility class. Some functions can be used in debug mode,
 * but some ones can be only used in release mode. To use all functions of this,
 * caller maybe need wrap with `if (kDebugMode) {}` or `if (DEBUG) {}`.
 * 
 * @author: `darkcompet` (co.vp@kilobytes.com.vn)
 */
class DkLogs {
   /// Write log. Note that, we can use `stdout.writeln()` instead.
   static void _log(bool validInProduct, dynamic logType, Object where, dynamic msg) {
      if (kReleaseMode && !validInProduct) {
         throw "Cannot use log [$logType] in release mode";
      }
      print("${_makePrefix(where, logType)} $msg");
   }

   /// Create prefix from [where] and [logType] of log.
   static String _makePrefix(Object where, dynamic logType) {
      String prefix = where == null ? 'Unknown' : where.toString();
      // got prefix: Instance of 'where'
      prefix = prefix.substring(max(0, prefix.indexOf("'")));
      return "_____[$logType] $prefix~";
   }

   /// Debug log. Cannot use in release mode.
   /// Caller should use it for debug only, remove it after done job.
   static void debug(Object where, dynamic msg) {
      _log(false, "DEBUG", where, msg);
   }

   /// Info log. Cannot use in release mode.
   /// Caller should wrap it inside `if (DEBUG)` to log general events.
   static void info(Object where, dynamic msg) {
      _log(false, "INFO", where, msg);
   }

   /// Warn log. Can use in release mode.
   /// Caller should use it to warn mistake or action which should not be occured.
   static void warn(Object where, dynamic msg) {
      _log(true, "WARN", where, msg);
   }

   /// Error log. Can use in release mode.
   /// Caller should use it to log error message or exception.
   static void error(Object where, dynamic msg) {
      _log(true, "ERROR", where, msg);
   }

   /// Fatal error log. Can use in release mode.
   /// Caller should use it to log fatal error like OutOfMemory, StackOverFlow...
   static void fatal(Object where, dynamic msg) {
      _log(true, "FATAL", where, msg);
   }

   /// Complain a mistake which should not be happened.
   /// This function will throw an exception.
   static void complain(Object where, dynamic msg) {
      String prefix = _makePrefix(where, "ERROR");
      throw "$prefix $msg";
   }
}
