import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartyCard extends StatelessWidget {
  final String partyName;
  final String partyType;
  final String balance;
  final VoidCallback onPressed;

  const PartyCard({
    Key? key,
    required this.partyType,
    required this.partyName,
    required this.onPressed,
    required this.balance
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      isShadow: true,
      margin: const [15,5],
      padding: const [10],
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: min,
          children: [
            ExpandedRow(
              children: [
                Label(
                  mainAxisAlignment: mainStart,
                  label: partyName,
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
                Label(
                  mainAxisAlignment: mainEnd,
                  label: "${Global.getMoneySymbol("IN")} $balance",
                  margin: const [0,0,5,0],
                  fontSize: 14,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            Label(
              expanded: true,
              mainAxisAlignment: mainStart,
              label: partyType,
              margin: const [0,5],
              fontSize: 12,
              color: promptColor,
            ),
          ],
        ),
      )
    );
  }
}
