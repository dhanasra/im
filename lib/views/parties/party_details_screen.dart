import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';
import 'package:im/widgets/view/empty_text.dart';

class PartyDetailsScreen extends StatefulWidget {
  const PartyDetailsScreen({Key? key}) : super(key: key);


  @override
  _PartyDetailsScreenState createState() => _PartyDetailsScreenState();
}

class _PartyDetailsScreenState extends State<PartyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTypes.appBarBack(
            children: [
              PrimaryButton(
                label: "EDIT",
                fontSize: 12,
                buttonBorderColor: primaryColor,
                color: primaryColor,
                buttonColor: white,
                radius: round,
                type: 1,
                noBorder: false,
                onPressed: ()=>App().setNavigation(context, AppRoutes.APP_PARTY_EDIT),
                margin: const [0,12],),
              PrimaryButton(
                label: "DEL",
                fontSize: 12,
                buttonBorderColor: Colors.red,
                color: Colors.red,
                buttonColor: white,
                radius: round,
                type: 1,
                noBorder: false,
                onPressed: (){},
                margin: const [10,12],),
            ],
          onPressed: ()=>App().setBackNavigation(context),
        ),
        body: Box(
          child: body(),
        )
    );
  }

  Widget body(){
    return Column(
      children: [
        const Box(
          padding: [10,5,10,0],
          bgColor: white,
          child: ExpandedRow(
            children: [
              Label(
                label: "Dhana Sekaran",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textColor,
                mainAxisAlignment: mainStart,
              ),
              InkWell(
                child: Label(
                  prefix: Icon(Icons.picture_as_pdf,color: btnColor,size: 20,),
                  label: "Statement",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: btnColor,
                  mainAxisAlignment: mainEnd,
                  suffix: Icon(Icons.keyboard_arrow_right_rounded,color: btnColor,size: 16,),
                ),
              ),
            ],
          ),
        ),
        Box(
          padding: const [10],
          bgColor: white,
          child: ExpandedRow(
            children: [
              Label(
                label: "${Global.getMoneySymbol("IN")} 0.0",
                fontSize: 14,
                color: textColor,
                fontWeight: FontWeight.w500,
                mainAxisAlignment: mainStart,
              ),
              const Label(
                label: "Customer",
                fontSize: 14,
                color: promptColor,
                fontWeight: FontWeight.w500,
                mainAxisAlignment: mainEnd,
              )
            ],
          ),
        ),
        Expanded(
            child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const Box(
                      child: TabBar(
                        indicatorColor: primaryColor,
                        labelColor: primaryColor,
                        unselectedLabelColor: promptColor,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                        ),
                        unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                        ),
                        tabs: [
                          Tab(text: "Transactions",),
                          Tab(text: "Details",),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          border: Border(
                              bottom: BorderSide(width: 1,color: borderColor),
                              top: BorderSide(width: 1,color: borderColor)
                          )
                      ),
                    ),
                    Flexible(child: Box(
                      bgColor: white,
                      child: TabBarView(
                        children: [
                          transactions(),
                          details()
                        ],
                      ),
                    ))
                  ],
                )
            )
        )
      ],
    );
  }

  Widget transactions(){
    return Stack(
      children: [
        const EmptyText(
            text: "Your data is secured & Encrypted",
            subText: "We do not share your data",
            icon: Icons.security),
        Align(
            alignment: Alignment.bottomCenter,
            child: Box(
              height: 50,
              margin: const [10,20],
              child: Row(
                mainAxisAlignment: mainCenter,
                children: [
                  Box(
                    margin: const [5,0],
                    child: FloatingActionButton(
                      onPressed: (){},
                      backgroundColor: btnColor,
                      child: const Icon(Icons.add,color: white,),
                    ),
                  ),
                  FloatingActionButton.extended(
                          heroTag: "bill",
                          onPressed: () {
                          },
                          backgroundColor: btnColor,
                          label: const Label(
                            label: "Bill/Invoice",
                            fontSize: 14,
                            color: white,
                          )
                      ),
                ],
              ),
            )
        ),
      ],
    );
  }

  Widget details(){
    return Box(
      padding: const [15],
      child: Column(
        crossAxisAlignment: crossStart,
        children: const [
          Label(
            label: "Contact Number",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor1,
          ),
          Divider(color: Colors.transparent,),
          Label(
            label: "91 8056384773",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          Divider(),
          Label(
            margin: [0,5],
            mainAxisAlignment: mainStart,
            label: "Address Details",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor1,
          ),
          Divider(color: Colors.transparent,),
          ExpandedRow(
            children: [
              Label(
                mainAxisAlignment: mainStart,
                label: "Billing Address",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: promptColor,
              ),
              Label(
                mainAxisAlignment: mainStart,
                label: "Shipping Address",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: promptColor,
              ),
            ],
          ),
          Divider(color: Colors.transparent,height: 5,),
          ExpandedRow(
            children: [
              Label(
                mainAxisAlignment: mainStart,
                label: "--",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              Label(
                mainAxisAlignment: mainStart,
                label: "--",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ],
          ),
          Divider(color: Colors.transparent,),
          Label(
            mainAxisAlignment: mainStart,
            label: "Place of Supply",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: promptColor,
          ),
          Divider(color: Colors.transparent,height: 5,),
          Label(
            mainAxisAlignment: mainStart,
            label: "--",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          Divider(),
          Label(
            margin: [0,5],
            mainAxisAlignment: mainStart,
            label: "GST Details",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor1,
          ),
          Divider(color: Colors.transparent,),
          ExpandedRow(
            children: [
              Label(
                mainAxisAlignment: mainStart,
                label: "GST Registration type",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: promptColor,
              ),
              Label(
                mainAxisAlignment: mainStart,
                label: "GSTIN",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: promptColor,
              ),
            ],
          ),
          Divider(color: Colors.transparent,height: 5,),
          ExpandedRow(
            children: [
              Label(
                mainAxisAlignment: mainStart,
                label: "--",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              Label(
                mainAxisAlignment: mainStart,
                label: "--",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ],
          ),
          Divider(),
          Label(
            margin: [0,5],
            mainAxisAlignment: mainStart,
            label: "Balance Details",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor1,
          ),
          Divider(color: Colors.transparent,),
          ExpandedRow(
            children: [
              Label(
                mainAxisAlignment: mainStart,
                label: "Credit Period (Days)",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: promptColor,
              ),
              Label(
                mainAxisAlignment: mainStart,
                label: "Credit Limit",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: promptColor,
              ),
            ],
          ),
          Divider(color: Colors.transparent,height: 5,),
          ExpandedRow(
            children: [
              Label(
                mainAxisAlignment: mainStart,
                label: "7",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              Label(
                mainAxisAlignment: mainStart,
                label: "--",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
