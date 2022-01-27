import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/view_models/authentication_view_model.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late AuthenticationViewModel viewModel;

  @override
  void initState() {
    viewModel = AuthenticationViewModel(App());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        App().closeApp();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            body: Box(
              expanded: true,
              bgColor: white,
              child: buildView(),
            )
        ),
      )
    );
  }

  buildView(){
    return Column(
      crossAxisAlignment: crossCenter,
      children: [
        ColorShader(
          child: Label(
            label: "INVOICE MAKER",
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            margin: [0,0,50,0],
          ),
          colors: [Colors.red,Colors.red.withOpacity(0.5),Colors.red],
          stops: [ 0.4,0.4,0.9],
        ),
        Box(
          margin: [15,50],
          padding: [15],
          isShadow: true,
          child: Column(
            children: [
              Content(
                text: "Enter your mobile number to signin to the app",
                color: primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                expanded: true,
                textAlign: start,
              ),
              TextInput(
                margin: [0,0,20,40],
                hintText: "contact_number",
                bgColor: white,
                controller: viewModel.codeController,
                prefixIcon: Icons.phone,
                prefixIconColor: btnColor,
                focusedBorderColor: borderColor,
                enabledBorderColor: borderColor,
                fontWeight: FontWeight.w600,
                inputType: TextInputType.phone,
                color: textColor,
                labelColor: textColor1,
                fontSize: 16,
              ),
              PrimaryButton(
                width: 120,
                radius: round,
                height: btnHeight2,
                label: "Continue",
                onPressed: ()async{
                  viewModel.verifyPhoneNumber();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
