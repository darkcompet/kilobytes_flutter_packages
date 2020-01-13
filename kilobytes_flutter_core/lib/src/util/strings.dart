class DkStrings {
   static bool isEquals(String a, String b) {
      if (a == null) return b == null;
      if (b == null) return a == null;
      if (a.length != b.length) return false;

      for (int i = a.length - 1; i >= 0; --i) {
         if (a.codeUnitAt(i) != b.codeUnitAt(i)) {
            return false;
         }
      }

      return true;
   }
}
