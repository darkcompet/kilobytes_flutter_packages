import 'package:flutter/material.dart';
import 'package:kilobytes_flutter_core/core.dart';

void toast() {
   //
}

void snack(BuildContext context, String msg, String actionText,
   {Function onActionPressed, bool autoDismissOnPressed = true}) {
   
   final snackbar = Scaffold.of(context);
   snackbar.showSnackBar(SnackBar(
      content: Text(msg),
      action: SnackBarAction(label: actionText, onPressed: () {
         if (autoDismissOnPressed) {
            snackbar.hideCurrentSnackBar();
         }
         if (onActionPressed != null) {
            onActionPressed();
         }
      }),
   ));
}
