import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/material.dart';

class Elegantnotif extends StatelessWidget {
  const Elegantnotif({super.key});

  void myElegantSuccess(BuildContext context, String info) {
    return ElegantNotification.success(
      width: MediaQuery.of(context).size.width - 60,
      height: 60,
      isDismissable: true,
      stackedOptions: StackedOptions(
        key: 'top',
        type: StackedType.same,
        itemOffset: const Offset(-5, -5),
      ),
      title: const Text('Update'),
      description: Text(info),
      onDismiss: () {
        //Message when the notification is dismissed
      },
      onNotificationPressed: () {
        //Message when the notification is pressed
      },
      border: const Border(
        bottom: BorderSide(
          color: Colors.green,
          width: 2,
        ),
      ),
    ).show(context);
  }

  void myElegantError(BuildContext context, String err) {
    return ElegantNotification.error(
      width: MediaQuery.of(context).size.width - 60,
      height: 60,
      isDismissable: true,
      stackedOptions: StackedOptions(
        key: 'topRight',
        type: StackedType.below,
        itemOffset: const Offset(0, 5),
      ),
      position: Alignment.topRight,
      animation: AnimationType.fromRight,
      title: const Text('Error'),
      description: Text(err),
      onDismiss: () {},
    ).show(context);
  }

  void myElegantInfo(BuildContext context, String info, int tim) {
    return ElegantNotification.info(
      width: MediaQuery.of(context).size.width - 60,
      height: 60,
      isDismissable: true,
      stackedOptions: StackedOptions(
        key: 'topRight',
        type: StackedType.same,
        scaleFactor: 0.2,
        itemOffset: const Offset(-20, 10),
      ),
      toastDuration: Duration(seconds: tim),
      position: Alignment.topRight,
      animation: AnimationType.fromRight,
      title: const Text('Info'),
      description: Text(info),
      showProgressIndicator: true,
      onDismiss: () {},
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
