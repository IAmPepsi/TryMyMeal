import 'package:flutter/material.dart';
import 'package:try_my_meal_user/models/items.dart';



class CartItemDesignWidget extends StatefulWidget
{
  Items? model;
  int? quantityNumber;

  CartItemDesignWidget({this.model, this.quantityNumber,});

  @override
  State<CartItemDesignWidget> createState() => _CartItemDesignWidgetState();
}



class _CartItemDesignWidgetState extends State<CartItemDesignWidget>
{
  @override
  Widget build(BuildContext context)
  {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [

              //image
              Image.network(
                widget.model!.thumbnailUrl.toString(),
                width: 140,
                height: 120,
              ),

              const SizedBox(width: 6,),

              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    //title
                    Text(
                      widget.model!.itemTitle.toString(),
                      style: const TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 2,),

                    //Price: € 12
                    Row(
                      children: [

                        const Text(
                          "Price: ",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 15,
                          ),
                        ),

                        const Text(
                          "€ ",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          widget.model!.price.toString(),
                          style: const TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(height: 4,),

                    //Quantity: 4
                    Row(
                      children: [

                        const Text(
                          "Quantity: ",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          widget.quantityNumber.toString(),
                          style: const TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
