import 'package:components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';
import 'package:im/graphql/graphql_config.dart';
import 'package:im/view_models/authentication_view_model.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  late AuthenticationViewModel viewModel;
  late TextEditingController pinPutController;

  @override
  void initState() {
    viewModel = AuthenticationViewModel(App());
    pinPutController = TextEditingController();
    super.initState();
  }

  Future<void> loginUser(String phone, BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          Navigator.of(context).pop();
          UserCredential result = await _auth.signInWithCredential (credential);
          User? user = result.user;
          if(user != null){
            App().setNavigation(context, AppRoutes.APP_HOME);
          }
        },
        verificationFailed: (FirebaseAuthException exception){},
        codeSent: (String verificationId, int? forceResendingToken){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              isDismissible: false,
              enableDrag: false,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(16))),
              builder: (context) => otpWidget(_auth, verificationId)
          );
        },
        codeAutoRetrievalTimeout: (String verificationId){  },
    );
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
              padding: const [15,0],
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
            theme: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            label: "Invoice Maker",
            color: primaryColor,
            margin: const [0,0,50,0],
          ),
          colors: const [Colors.red,Colors.deepOrangeAccent,Colors.orangeAccent,Colors.red],
          stops: const [ 0.2,0.3,0.5,0.9],
        ),
        Content(
          margin: const [0,0,30,10],
          text: "Enter your mobile number to signin to the app",
          color: promptColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          fontFamily: GoogleFonts.openSans().fontFamily,
          expanded: true,
          textAlign: start,
        ),
        TextInput(
          hintText: "contact_number",
          bgColor: white,
          controller: viewModel.phoneNumberController,
          prefixIcon: Icons.phone,
          prefixIconColor: btnColor,
          autoFocus: true,
          focusedBorderColor: borderColor,
          fontFamily: GoogleFonts.openSans().fontFamily,
          enabledBorderColor: borderColor,
          fontWeight: FontWeight.w600,
          inputType: TextInputType.phone,
          color: textColor,
          labelColor: textColor1,
          fontSize: 16,
        ),
        PrimaryButton(
          margin: const [0,40],
          expanded: true,
          type: 1,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.openSans().fontFamily,
          height: btnHeight2,
          label: "Get OTP",
          onPressed: ()async{
            // loginUser("+915555555555", context);
            print("start");
            var variables = <String, dynamic>{
              "user": {
                "name":"Dhana Sekaran",
                'phoneNumber': "+915555555555",
                "language" : "ta",
                "email" : "1dhana@625gmail.com"
              }
            };

            Map<String, dynamic>? message = await graphQlObject.getQueryValues(
                graphQlObject.graphQLClient,
                "add_user",
                variables);

            if(message!=null){
              print(message);
            }else{
              print(null);
            }
          },
        ),
      ],
    );
  }

  Widget otpWidget(FirebaseAuth auth, String verificationId){
    return SafeArea(child: Box(
      margin: const [15,0],
      child: Column(
        crossAxisAlignment: crossCenter,
        children: [
          ColorShader(
            child: Label(
              theme: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              label: "Invoice Maker",
              color: primaryColor,
              margin: const [0,0,50,0],
            ),
            colors: const [Colors.red,Colors.deepOrangeAccent,Colors.orangeAccent,Colors.red],
            stops: const [ 0.2,0.3,0.5,0.9],
          ),
          Content(
            margin: const [0,0,30,10],
            text: "Enter the received code",
            color: promptColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontFamily: GoogleFonts.openSans().fontFamily,
            expanded: true,
            textAlign: start,
          ),
          PinPut(
            fieldsCount: 6,
            controller: pinPutController,
            followingFieldDecoration:  BoxDecoration(
              color: const Color.fromRGBO(235, 236, 237, 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
            pinAnimationType: PinAnimationType.scale,
            eachFieldMargin: const EdgeInsets.all(0),
            eachFieldWidth: 45.0,
            eachFieldHeight: 55.0,
            submittedFieldDecoration:  BoxDecoration(
              color: const Color.fromRGBO(235, 236, 237, 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
            fieldsAlignment: MainAxisAlignment.spaceBetween,
          ),
          Box(
            margin: const [15,15,50,0],
            bgColor: btnColor,
            radius: round,
            child: IconButton(onPressed: ()async{
              final code = pinPutController.text.trim();
              AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
              UserCredential result = await auth.signInWithCredential (credential);
              User? user = result.user;
              if(user != null){
                App().setNavigation(context, AppRoutes.APP_HOME);
              }
            }, icon: const Icon(Icons.check),color: white,),
          )
        ],
      ),
    )
    );
  }
}
