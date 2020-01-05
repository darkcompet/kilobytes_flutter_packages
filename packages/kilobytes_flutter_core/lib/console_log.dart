import 'build_config.dart';

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

   static String _makePrefix(Type where) {
      return "$where~ ";
   }

   /// Debug log. Cannot use in release mode.
   static void debug(Type where, String msg) {
      _log(false, "debug", "_____ ${_makePrefix(where)} $msg");
   }

   /// Info log. Cannot use in release mode.
   static void log(Type where, String msg) {
      _log(false, "info", _makePrefix(where) + msg);
   }

   /// Warning log. Can use in release mode.
   static void logw(Type where, String msg) {
      _log(true, "warning", _makePrefix(where) + msg);
   }

   /// Error log. Can use in release mode.
   static void loge(Type where, Exception e) {
      _log(true, "error", _makePrefix(where) + e.toString());
   }
}
