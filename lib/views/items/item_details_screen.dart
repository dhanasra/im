import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({Key? key}) : super(key: key);

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTypes.appBarBack(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.share,color: primaryColor,),splashRadius: 20,),
              IconButton(onPressed: ()=>App().setNavigation(context, AppRoutes.APP_ITEM_EDIT), icon: const Icon(Icons.edit,color: primaryColor,),splashRadius: 20,),
              IconButton(onPressed: (){}, icon: const Icon(Icons.delete_forever_rounded,color: Colors.red,),splashRadius: 20,)
            ],
          onPressed: ()=>App().setBackNavigation(context),
        ),
        body: Stack(
          children: [
            Box(
              bgColor: white,
              child: body(),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Box(
                  margin: const [20,0],
                  child: Row(
                    mainAxisAlignment: mainSpace,
                    children: [
                      Expanded(
                        child: Box(
                          margin: const [10,20],
                          child: FloatingActionButton.extended(
                              heroTag: "purchase",
                              onPressed: () {},
                              backgroundColor: primaryColor,
                              icon: const Icon(Icons.add,color: white,),
                              label: const Label(
                                label: "Stock",
                                fontSize: 14,
                                color: white,
                              )
                          ),
                        ),
                      ),
                      Expanded(
                        child: Box(
                          margin: const [10,20],
                          child: FloatingActionButton.extended(
                              heroTag: "bill",
                              onPressed: () {},
                              backgroundColor: btnColor,
                              icon: const Icon(Icons.remove,color: white,),
                              label: const Label(
                                label: "Stock",
                                fontSize: 14,
                                color: white,
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ],
        )
    );
  }

  Widget body(){
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        const Box(
          padding: [10,5,10,0],
          bgColor: white,
          child: ExpandedRow(
            children: [
              Label(
                label: "Rice IR20",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textColor,
                mainAxisAlignment: mainStart,
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
                label: "${Global.getMoneySymbol("IN")} 20/KGS",
                fontSize: 14,
                color: textColor,
                fontWeight: FontWeight.w500,
                mainAxisAlignment: mainStart,
              ),
              const Label(
                label: "Product",
                fontSize: 14,
                color: promptColor,
                fontWeight: FontWeight.w500,
                mainAxisAlignment: mainEnd,
              )
            ],
          ),
        ),
        const Divider(height: 30,),
        const ExpandedRow(
          padding: [10,0],
          children: [
            Label(
              mainAxisAlignment: mainStart,
              label: "Sales Price",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: promptColor,
            ),
            Label(
              mainAxisAlignment: mainStart,
              label: "Purchase Price",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: promptColor,
            ),
            Label(
              mainAxisAlignment: mainStart,
              label: "Wholesale Price",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: promptColor,
            ),
          ],
        ),
        const Divider(color: Colors.transparent,height: 5,),
        const ExpandedRow(
          padding: [10,0],
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
            Label(
              mainAxisAlignment: mainStart,
              label: "--",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ],
        ),
        const Divider(color: Colors.transparent,),
        const ExpandedRow(
          padding: [10,0],
          children: [
            Label(
              mainAxisAlignment: mainStart,
              label: "Stock Quantity",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: promptColor,
            ),
            Label(
              mainAxisAlignment: mainStart,
              label: "MRP",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: promptColor,
            ),
            Box()
          ],
        ),
        const Divider(color: Colors.transparent,height: 5,),
        const ExpandedRow(
          padding: [10,0],
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
            Box()
          ],
        ),
        const Divider(height: 30,),
        const ExpandedRow(
          padding: [10,0],
          children: [
            Label(
              mainAxisAlignment: mainStart,
              label: "Item Code",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: promptColor,
            ),
            Label(
              mainAxisAlignment: mainStart,
              label: "Measuring Unit",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: promptColor,
            ),
            Label(
              mainAxisAlignment: mainStart,
              label: "Low Stcok at",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: promptColor,
            ),
          ],
        ),
        const Divider(color: Colors.transparent,height: 5,),
        const ExpandedRow(
          padding: [10,0],
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
              label: "KGS",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
            Label(
              mainAxisAlignment: mainStart,
              label: "10 KGS",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ],
        ),
        const Divider(color: Colors.transparent,),
        const ExpandedRow(
          padding: [10,0],
          children: [
            Label(
              mainAxisAlignment: mainStart,
              label: "Tax Rate",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: promptColor,
            ),
            Label(
              mainAxisAlignment: mainStart,
              label: "HSN Code",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: promptColor,
            ),
            Label(
              mainAxisAlignment: mainStart,
              label: "Item Type",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: promptColor,
            ),
          ],
        ),
        const Divider(color: Colors.transparent,height: 5,),
        const ExpandedRow(
          padding: [10,0],
          children: [
            Label(
              mainAxisAlignment: mainStart,
              label: "0.0",
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
            Label(
              mainAxisAlignment: mainStart,
              label: "Product",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ],
        ),
        const Divider(height: 30,),
        const Label(
          padding: [10,0],
          mainAxisAlignment: mainStart,
          label: "Remark",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: promptColor,
        ),
        const Divider(color: Colors.transparent,height: 5,),
        const Label(
          padding: [10,0],
          mainAxisAlignment: mainStart,
          label: "--",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ],
    );
  }
}
