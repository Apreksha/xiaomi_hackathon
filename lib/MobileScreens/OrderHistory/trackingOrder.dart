import 'package:flutter/material.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';

class TrackingOrder extends StatefulWidget {
  const TrackingOrder({Key? key}) : super(key: key);

  @override
  State<TrackingOrder> createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrder> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return IconStepper(
      steppingEnabled: true,
      scrollingDisabled: false,
      stepReachedAnimationEffect: Curves.linear,
      direction: Axis.vertical,
      icons: [
        Icon(Icons.radio_button_checked, color: Colors.green,),
        Icon(Icons.check),
        Icon(Icons.check),
        Icon(Icons.check),
        Icon(Icons.check),
      ],
    );
  }
}
//tu yaha copy paste kr rha hai?