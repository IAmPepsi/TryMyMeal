import 'package:flutter/material.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:try_my_meal_user/mealsScreens/meals_screen.dart';
import 'package:try_my_meal_user/models/chefs.dart';


class ChefsUIDesignWidget extends StatefulWidget
{
  Chefs? model;

  ChefsUIDesignWidget({this.model,});

  @override
  State<ChefsUIDesignWidget> createState() => _ChefsUIDesignWidgetState();
}




class _ChefsUIDesignWidgetState extends State<ChefsUIDesignWidget>
{
  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: ()
      {
        //send user to a chef's meals screen
        Navigator.push(context, MaterialPageRoute(builder: (c)=> MealsScreen(
          model: widget.model,
        )));
      },
      child: Card(
        color: Colors.black54,
        elevation: 20,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 270,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    widget.model!.photoUrl.toString(),
                    height: 220,
                    fit: BoxFit.fill,
                  ),
                ),

                const SizedBox(height: 1,),

                Text(
                  widget.model!.name.toString(),
                  style: const TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SmoothStarRating(
                  rating: widget.model!.ratings == null ? 0.0 : double.parse(widget.model!.ratings.toString()),
                  starCount: 5,
                  color: Colors.pinkAccent,
                  borderColor: Colors.pinkAccent,
                  size: 16,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
