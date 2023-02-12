import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

class Alert {
  alertSuccess(BuildContext context) {
    return CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text: "Your transaction was successful!",
    );
  }

  alertSuccessWithFunc(BuildContext context, dynamic method) {
    return CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text: "Your transaction was successful!",
      onConfirmBtnTap: method,
    );
  }

  alertConfirm(BuildContext context,
      {required dynamic confirm, required String message}) {
    return CoolAlert.show(
      context: context,
      type: CoolAlertType.confirm,
      text: message,
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.green,
      onConfirmBtnTap: confirm,
      backgroundColor: Colors.transparent,
      loopAnimation: true,
    );
  }

  alertLoading(BuildContext context) {
    return CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
    );
  }
}
