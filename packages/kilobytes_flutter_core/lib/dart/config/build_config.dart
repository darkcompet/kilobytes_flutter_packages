library core;

import 'package:flutter/foundation.dart';

/**
 * Class holds build-config information of running app.
 * 
 * @author: `darkcompet` (co.vp@kilobytes.com.vn)
 */
class DkBuildConfig {
   static const bool DEBUG = !kReleaseMode;
   static const bool RELEASE = kReleaseMode;
}
