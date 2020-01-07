class DkMaths {
   /// Parse any text to int (at max 64 bit). Note that, this function will
   /// try to parse given `text` to get possible integer value.
   /// 
   static int parseInt(final String text) {
      if (text == null || text.length == 0) {
         return 0;
      }
      
      final int N = text.length;
      final int minus = '-'.codeUnitAt(0);
      final int zero = '0'.codeUnitAt(0);
      final int nine = '9'.codeUnitAt(0);
      int result = 0;
      int index = -1;
      int signed = 0;

      while (++index < N && text.codeUnitAt(index) == minus) {
         signed = 1 - signed;
      }

      for (; index < N; ++index) {
         int ch = text.codeUnitAt(index);

         if (ch < zero || ch > nine) {
            break;
         }
         result = (result << 3) + (result << 1) + (ch - zero);
      }
      
      return signed == 0 ? result : -result;
   }
}
