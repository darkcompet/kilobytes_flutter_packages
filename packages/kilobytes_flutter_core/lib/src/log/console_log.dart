import '../config/build_config.dart';

/**
 * Console log utility class.
 * 
 * @author: `darkcompet` (co.vp@kilobytes.com.vn)
 */
class DkLogs {
   static void _log(bool invalidInReleaseMode, String type, String msg) {
      if (DkBuildConfig.RELEASE && invalidInReleaseMode) {
         throw "Cannot use log of $type in release mode";
      }
      print(msg);
   }

   static String _makePrefix(Object where) {
      return "_____ ${where == null ? "Unknown" : where.toString()}~";
   }

   /// Debug log. Cannot use in release mode.
   static void debug(Object where, String msg) {
      String type = "[DEBUG]";
      _log(false, type, "$type ${_makePrefix(where)} $msg");
   }

   /// Info log. Cannot use in release mode.
   static void log(Object where, String msg) {
      String type = "[INFO]";
      _log(false, type, "$type ${_makePrefix(where)} $msg");
   }

   /// Warning log. Can use in release mode.
   static void logw(Object where, String msg) {
      String type = "[WARNING]";
      _log(true, type, "$type ${_makePrefix(where)} $msg");
   }

   /// Error log. Can use in release mode.
   static void loge(Object where, Exception e) {
      String type = "[ERROR]";
      _log(true, type, "$type ${_makePrefix(where)} $e");
   }
}
