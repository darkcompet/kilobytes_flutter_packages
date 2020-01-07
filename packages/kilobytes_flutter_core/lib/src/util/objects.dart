class DkObjects {
   static bool isEmpty(List list) {
      return list == null || list.length == 0;
   }

   static void requireNonNull(Object obj, {String msg}) {
      if (obj == null) {
         throw msg == null ? "Cannot be null" : msg;
      }
   }
}
