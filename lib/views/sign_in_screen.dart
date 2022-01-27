import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leadingWidth: 45,
        leading: SizedBox(
          child: IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.arrow_back,color: black,),
            onPressed: () => App().setBackNavigation(context),
          ),
        )
      ),
      body: Box(
        padding: const [15,0],
        expanded: true,
        child: body(),
        bgColor: white,
      ),
    );
  }

  Widget body(){
    return Column(
      children: [
        const Label(
          expanded: true,
          mainAxisAlignment: mainStart,
          label: "Login to your account",
          fontWeight: FontWeight.bold,
          fontSize: 24,
          margin: [0,0,30,0],
        ),
        const TextInput(
          fontSize: 14,
          hintText: "Email or phone number",
          margin: [0,0,40,0],
        ),
        const TextInput(
          fontSize: 14,
          hintText: "Password",
          margin: [0,0,15,0],
          isObscured: true,
          suffixIcon: Icons.remove_red_eye,
          changeObscured: true,
        ),
        PrimaryButton(
          margin: const [0,0,20,0],
          width: 150,
          radius: round,
          height: btnHeight2,
          label: "Login",
          fontSize: 14,
          type: 1,
          onPressed: (){},
        ),
        const Label(
          label: "OR",
          fontWeight: btnTextWeight,
          textMargin: [10,0],
          margin: [0,0,30,20],
          fontSize: 14,
          prefix: Box(width: 120,height: 1,bgColor: promptColor,),
          suffix: Box(width: 120,height: 1,bgColor: promptColor,),
        ),
        PrimaryButton(
          expanded: true,
          margin: const [0,0,10,0],
          buttonColor: white,
          color: btnColor,
          noBorder: false,
          mainAxisAlignment: mainSpace,
          height: btnHeight2,
          mainAxisSize: max,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          prefix: const Box(width: 20,height: 20,padding: [10,0,0,0],asset: "google.png",),
          suffix: const Box(width:30),
          label: "Login with google",
          type: 1,
          onPressed: () {},
        ),
        PrimaryButton(
          expanded: true,
          margin: const [0,0,10,0],
          buttonColor: white,
          color: btnColor,
          noBorder: false,
          mainAxisSize: max,
          mainAxisAlignment: mainSpace,
          height: btnHeight2,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          prefix: const Box(width: 20,height: 20,padding: [10,0,0,0],asset: "facebook.png",),
          suffix: const Box(width:30),
          label: "Login with facebook",
          type: 1,
          onPressed: ()=>App().setNavigation(context, AppRoutes.APP_HOME),
        ),
        const Spacer(),
        const Label(
          mainAxisAlignment: mainCenter,
          label: "Don't have an account?",
          fontWeight: btnTextWeight,
          textMargin: [5,0],
          margin: [0,0,10,30],
          fontSize: 14,
          suffix: Label(
            label: "Signup",
            fontSize: 14,
            fontWeight: btnTextWeight,),
        ),
      ],
    );
  }
}
