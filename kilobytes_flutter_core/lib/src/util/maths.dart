class DkMaths {
   /// Parse any text to int (result at max 64 bit). Note that, this function will
   /// try to parse given `text` to get possible integer value from left to right.
   /// This will ignore `leading-plus-symbols`, consider negative value by count
   /// `leading-minus-symbols` and stop parsing until reach a symbol which is `not-a-digit`.
   /// For eg, `parseInt("---++1 2x39yz")` will result value `-1`, and
   /// `parseInt("---++ 1 2x39yz")` will result value `0`, 
   static int parseInt(final String text) {
      if (text == null || text.length == 0) {
         return 0;
      }
      
      final int N = text.length;
      final List<int> units = text.codeUnits;
      final int zero = '0'.codeUnitAt(0);
      final int nine = '9'.codeUnitAt(0);
      final int plus = '+'.codeUnitAt(0);
      final int minus = '-'.codeUnitAt(0);

      int result = 0;
      int index = -1;
      int signed = 0;
      int ch;

      while (++index < N) {
         ch = units[index];

         if (ch >= zero && ch <= nine) {
            break;
         }
         if (ch == minus) {
            signed = 1 - signed;
         }
         else if (ch != plus) {
            return 0;
         }
      }

      if (index < N) {
         do {
            result = (result << 3) + (result << 1) + (ch - zero);

            if (++index >= N) {
               break;
            }
            
            ch = units[index];
         }
         while (ch >= zero && ch <= nine);
      }
      
      return signed == 0 ? result : -result;
   }
}
