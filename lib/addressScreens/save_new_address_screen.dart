import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:try_my_meal_user/addressScreens/text_field_address_widget.dart';
import 'package:try_my_meal_user/global/global.dart';


class SaveNewAddressScreen extends StatefulWidget
{
  String? chefUID;
  double? totalAmount;

  SaveNewAddressScreen({this.chefUID, this.totalAmount,});

  @override
  State<SaveNewAddressScreen> createState() => _SaveNewAddressScreenState();
}

class _SaveNewAddressScreenState extends State<SaveNewAddressScreen>
{
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController streetNumber = TextEditingController();
  TextEditingController flatHouseNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController stateCountry = TextEditingController();
  String completeAddress = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
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
        ),
        title: const Text(
          "Try My Meal",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()
        {
          if(formKey.currentState!.validate())
          {
            completeAddress = streetNumber.text.trim() + ", " + flatHouseNumber.text.trim() + ", " + city.text.trim() + ", " + stateCountry.text.trim() + ".";

            FirebaseFirestore.instance
                .collection("users")
                .doc(sharedPreferences!.getString("uid"))
                .collection("userAddress")
                .doc(DateTime.now().millisecondsSinceEpoch.toString())
                .set(
                {
                  "name": name.text.trim(),
                  "phoneNumber": phoneNumber.text.trim(),
                  "streetNumber": streetNumber.text.trim(),
                  "flatHouseNumber": flatHouseNumber.text.trim(),
                  "city": city.text.trim(),
                  "stateCountry": stateCountry.text.trim(),
                  "completeAddress": completeAddress,
                }).then((value)
            {
              Fluttertoast.showToast(msg: "New Shipment Address has been saved.");
              formKey.currentState!.reset();
            });
          }
        },
        label: const Text(
            "Save Now"
        ),
        icon: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Save New Address:",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Form(
              key: formKey,
              child: Column(
                children: [

                  TextFieldAddressWidget(
                    hint: "Name",
                    controller: name,
                  ),

                  TextFieldAddressWidget(
                    hint: "Phone Number",
                    controller: phoneNumber,
                  ),

                  TextFieldAddressWidget(
                    hint: "Street Number",
                    controller: streetNumber,
                  ),

                  TextFieldAddressWidget(
                    hint: "Flat / House Number",
                    controller: flatHouseNumber,
                  ),

                  TextFieldAddressWidget(
                    hint: "City",
                    controller: city,
                  ),

                  TextFieldAddressWidget(
                    hint: "State / Country",
                    controller: stateCountry,
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
