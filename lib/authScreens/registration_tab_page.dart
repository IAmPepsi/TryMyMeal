import 'package:flutter/material.dart';
import 'package:try_my_meal_user/widgets/custom_text_field.dart';


class RegistrationTabPage extends StatefulWidget
{
  @override
  State<RegistrationTabPage> createState() => _RegistrationTabPageState();
}



class _RegistrationTabPageState extends State<RegistrationTabPage>
{
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [

            const SizedBox(height: 12,),

            //get-capture image
            GestureDetector(
              onTap: ()
              {

              },
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add_photo_alternate,
                  color: Colors.grey,
                  size: MediaQuery.of(context).size.width * 0.20,
                ),
              ),
            ),

            const SizedBox(height: 12,),

            //inputs form fields
            Form(
              key: formKey,
              child: Column(
                children: [

                  //name
                  CustomTextField(
                    textEditingController: nameTextEditingController,
                    iconData: Icons.person,
                    hintText: "Name",
                    isObsecre: false,
                    enabled: true,
                  ),

                  //email
                  CustomTextField(
                    textEditingController: emailTextEditingController,
                    iconData: Icons.email,
                    hintText: "Email",
                    isObsecre: false,
                    enabled: true,
                  ),

                  //pass
                  CustomTextField(
                    textEditingController: passwordTextEditingController,
                    iconData: Icons.lock,
                    hintText: "Password",
                    isObsecre: true,
                    enabled: true,
                  ),

                  //confirm pass
                  CustomTextField(
                    textEditingController: confirmPasswordTextEditingController,
                    iconData: Icons.lock,
                    hintText: "Confirm Password",
                    isObsecre: true,
                    enabled: true,
                  ),

                  const SizedBox(height: 20,),

                ],
              ),
            ),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                ),
                onPressed: ()
                {

                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),

            const SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}
