import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_my_meal_user/addressScreens/address_design_widget.dart';
import 'package:try_my_meal_user/addressScreens/save_new_address_screen.dart';
import 'package:try_my_meal_user/assistantMethods/address_changer.dart';
import 'package:try_my_meal_user/global/global.dart';
import 'package:try_my_meal_user/models/address.dart';


class AddressScreen extends StatefulWidget
{
  String? chefUID;
  double? totalAmount;

  AddressScreen({this.chefUID, this.totalAmount,});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen>
{
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
          Navigator.push(context, MaterialPageRoute(builder: (c)=>SaveNewAddressScreen(
            chefUID: widget.chefUID.toString(),
            totalAmount: widget.totalAmount!.toDouble(),
          )));
        },
        label: const Text(
            "Add New Address"
        ),
        icon: const Icon(
          Icons.add_location,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [

          //query
          //model
          //design

          Consumer<AddressChanger>(builder: (context, address, c)
          {
            return Flexible(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(sharedPreferences!.getString("uid"))
                    .collection("userAddress").snapshots(),
                builder: (context, AsyncSnapshot dataSnapshot)
                {
                  if(dataSnapshot.hasData)
                  {
                    if(dataSnapshot.data.docs.length > 0)
                    {
                      return ListView.builder(
                        itemBuilder: (context, index)
                        {
                          return AddressDesignWidget(
                            addressModel: Address.fromJson(
                                dataSnapshot.data.docs[index].data() as Map<String, dynamic>
                            ),
                            index: address.count,
                            value: index,
                            addressID: dataSnapshot.data.docs[index].id,
                            totalAmount: widget.totalAmount,
                            chefUID: widget.chefUID,
                          );
                        },
                        itemCount: dataSnapshot.data.docs.length,
                      );
                    }
                    else
                    {
                      return Container();
                    }
                  }
                  else
                  {
                    return const Center(
                      child: Text(
                        "No data exists.",
                      ),
                    );
                  }
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
