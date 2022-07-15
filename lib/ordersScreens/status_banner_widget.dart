import 'package:flutter/material.dart';

import '../chefsScreens/home_screen.dart';

class StatusBanner extends StatelessWidget
{
  bool? status;
  String? orderStatus;

  StatusBanner({this.status, this.orderStatus,});



  @override
  Widget build(BuildContext context)
  {
    String? message;
    IconData? iconData;

    status! ? iconData = Icons.done : iconData = Icons.cancel;
    status! ? message = "Successful" : message = "UnSuccessful";

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors:
            [
              Colors.red,
              Colors.orange,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          )
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: const Icon(
              Icons.transit_enterexit,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 40,),

          Text(
            orderStatus == "ended"
                ? "Parcel Delivered $message"
                : orderStatus == "shifted"
                ? "Parcel Shifted $message"
                : orderStatus == "normal"
                ? "Order Placed $message"
                : "",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
