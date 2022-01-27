import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';

class StackButton extends StatelessWidget {

  final Widget child;
  final String btnText;
  final String route;
  final IconData icon;

  const StackButton({
    Key? key,
    required this.btnText,
    required this.route,
    required this.icon,
    required this.child
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Align(
            alignment: Alignment.bottomCenter,
            child: Box(
              margin: const [0,30],
              child: FloatingActionButton.extended(
                onPressed: () {
                  App().setNavigation(context, route);
                },
                icon: Icon(icon),
                backgroundColor: btnColor,
                label: Label(
                  label: btnText,
                  fontSize: 14,
                  color: white,
                )
              ),
            )
        ),
      ],
    );
  }
}
