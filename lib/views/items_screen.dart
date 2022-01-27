import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';
import 'package:im/widgets/button/stack_button.dart';
import 'package:im/widgets/cards/item_card.dart';
import 'package:im/widgets/input/tags_radio.dart';
import 'package:im/widgets/view/empty.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65), // here the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Label(
            padding: [0,10],
            label: "Items",
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
              icon: const Icon(Icons.settings),
              color: iconColor,
              onPressed: () {},
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
      btnText: "Create New Item",
      route: AppRoutes.APP_ITEM_CREATE,
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
            child: TagsRadio(tags: const ["All", "Low Stock"],selected: (val){},),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.only(top: 15),
                itemBuilder: (BuildContext context, index) {
                  return ItemCard(
                    itemName: "Rice Flour",
                    stockValue: "22",
                    purchasePrice: "25",
                    salesPrice: "20",
                    unit: "KGS",
                    onPressed: (){
                      App().setNavigation(context, AppRoutes.APP_ITEM_DETAILS);
                    },
                    onEditPressed: () { },
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
      text: "add_item",
      btnText: "create_item",
      route: AppRoutes.APP_ITEM_CREATE,
      icon: CupertinoIcons.cube_box_fill,
    );
  }
}
