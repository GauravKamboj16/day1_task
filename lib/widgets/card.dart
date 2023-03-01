import 'package:flutter/material.dart';
import '../Constant/app_colors.dart';

class ItemCard extends StatelessWidget {
  final String text;
  final dynamic _onTapCallback;

  final Color textColor;
   

  const ItemCard(this.text, this._onTapCallback,
      {this.textColor = AppColors.whiteColor,
         });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _onTapCallback();
        },
        child: Container(
          height: MediaQuery.of(context).size.height/8,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(child: Text(text,
              style: TextStyle(color: textColor, fontSize: 22,fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        )));
  }
}
