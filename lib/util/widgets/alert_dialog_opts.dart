import 'package:flutter/material.dart';

import '../my_colors.dart';

dynamic alertDialogOpts(
    {required BuildContext context,
    required String tittle,
    String? subTittle,
    String? txtBtnPositive,
    String? txtBtnNegative,
    Function? tapPositive,
    Function? tapNegative,
    required bool dismissible,
    Widget? widgetSubtitle}) {
  if (widgetSubtitle == null) {
    widgetSubtitle = SizedBox();
  }
  return showDialog(
    context: context,
    barrierDismissible: dismissible,
    builder: (context) => AlertDialog(
      title: Text(
        tittle == null ? "" : tittle,
        style: TextStyle(
          color: MyColors.primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
      content: subTittle != null
          ? Text(subTittle == null ? "" : subTittle)
          : widgetSubtitle,
      actions: [
        txtBtnPositive == null
            ? SizedBox()
            : MaterialButton(
                child: Text(txtBtnPositive, style: TextStyle()),
                onPressed: () {
                  tapPositive == null
                      ? print("no function positive")
                      : tapPositive();
                }),
        txtBtnNegative == null
            ? SizedBox()
            : MaterialButton(
                child: Text(txtBtnNegative,
                    style: TextStyle(
                      color: MyColors.acentColor,
                    )),
                onPressed: () {
                  tapNegative == null
                      ? print("no function negative")
                      : tapNegative();
                })
      ],
    ),
  );
}
