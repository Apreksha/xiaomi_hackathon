import 'package:flutter/material.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';

class TrackingOrder extends StatefulWidget {
  const TrackingOrder({Key? key}) : super(key: key);

  @override
  State<TrackingOrder> createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrder> with TickerProviderStateMixin{
  List<StepperData> stepperData = [
    StepperData(
      title: "Order Placed",
      subtitle: "",
    ),
    StepperData(
      title: "Order Shipped",
      subtitle: "",
    ),
    StepperData(
      title: "Delivered",
      subtitle: "",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height*0.41,
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            children: [
              Center(child: Text('Status', style: TextStyle(color: Colors.grey),)),
              Divider(),
              showTrack(),
            ],
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  Widget showTrack(){
    return AnotherStepper(
      scrollPhysics: NeverScrollableScrollPhysics(),
      gap: 30,
      stepperList: stepperData,
      stepperDirection: Axis.vertical,
      horizontalStepperHeight: 70,
      dotWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.radio_button_off, color: Colors.green,size: 16,),
      ),
      activeBarColor: Colors.green,
      inActiveBarColor: Colors.grey,
      activeIndex: 1,
      barThickness: 5,
    );
  }
}
