import 'package:flutter/material.dart';

class OrdersDialog {
  static Future<void> showDialogOrder(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {        
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            
            title: const Text('lista ordini'),
            content: Container(
            
              width: MediaQuery.of(context).size.width*0.7,
              
              height: MediaQuery.of(context).size.height * 0.7,)
          );
        });
  }
}
