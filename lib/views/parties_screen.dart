import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';
import 'package:im/widgets/button/stack_button.dart';
import 'package:im/widgets/cards/party_card.dart';
import 'package:im/widgets/input/tags_radio.dart';
import 'package:im/widgets/view/empty.dart';

class PartiesScreen extends StatefulWidget {
  const PartiesScreen({Key? key}) : super(key: key);

  @override
  _PartiesScreenState createState() => _PartiesScreenState();
}

class _PartiesScreenState extends State<PartiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65), // here the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Label(
              padding: [0,10],
              label: "Party",
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
          ),
          shadowColor: white,
          elevation: 1,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              color: iconColor,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.contact_mail_rounded),
              color: iconColor,
              onPressed: (){
                Future.delayed(const Duration(seconds: 0),(){
                  showBottomSheet(context: context);
                });
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: body(),
      ),
    );
  }

  Widget body() {
    return StackButton(
      btnText: "Create New Party",
      route: AppRoutes.APP_PARTY_CREATE,
      icon: Icons.add_circle,
      child: Column(
        children: [
          Box(
            expanded: true,
            decoration: const BoxDecoration(
                color: white,
                border: Border(bottom: BorderSide(
                    color: borderColor,
                    width: 4,
                    style: BorderStyle.solid
                ))
            ),
            padding: const [15],
            bgColor: white,
            child: TagsRadio(tags: const ["To Pay", "To Collect"],selected: (val){},),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.only(top: 15),
                itemBuilder: (BuildContext context, index) {
                  return PartyCard(
                    partyName: "Dhana",
                    partyType: "Customer",
                    balance: "25",
                    onPressed: () {
                      App().setNavigation(context, AppRoutes.APP_PARTY_DETAILS);
                    },
                  );
                }
            ),
          )
        ],
      ),
    );
  }

  Widget bodyEmpty() {
    return const Empty(
      text: "add_party",
      btnText: "create_party",
      route: AppRoutes.APP_PARTY_CREATE,
      icon: Icons.person,
    );
  }

  showBottomSheet({required BuildContext context}){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context){
          return Box(
            height: 250,
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
              children: [
                const Label(
                  prefix: Icon(Icons.arrow_back,color: iconColor,),
                  label: "Share",
                  textMargin: [10,0],
                  mainAxisAlignment: mainStart,
                  expanded: true,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  padding: [15,15,15,10],
                ),
                const Divider(),
                ExpandedRow(
                  padding: const [0,50],
                  children: [
                    InkWell(
                      child: Column(
                        children: const [
                          Icon(Icons.contact_mail_rounded,size: 30,color: secondaryColor,),
                          Label(
                            label: "Business Card",
                            textMargin: [10,0],
                            expanded: true,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            padding: [15,15,15,10],
                          ),
                        ],
                      ),
                      onTap: (){},
                    ),
                    InkWell(
                      child: Column(
                        children: const [
                          Icon(Icons.mail_rounded,size: 30,color: btnColor,),
                          Label(
                            label: "Greetings",
                            textMargin: [10,0],
                            expanded: true,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            padding: [15,15,15,10],
                          ),
                        ],
                      ),
                      onTap: (){},
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
