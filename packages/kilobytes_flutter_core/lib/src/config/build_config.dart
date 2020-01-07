library core;

import 'package:flutter/foundation.dart' show kDebugMode, kReleaseMode;

/**
 * Class holds build-config information of running app.
 * 
 * @author: `darkcompet` (co.vp@kilobytes.com.vn)
 */
class DkBuildConfig {
   static const bool DEBUG = kDebugMode;
   static const bool RELEASE = kReleaseMode;
}
