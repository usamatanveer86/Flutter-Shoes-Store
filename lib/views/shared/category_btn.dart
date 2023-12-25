import 'package:flutter/material.dart';
import 'package:shoes_shop/views/shared/appstyle.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn(
      {super.key, this.onpress, required this.buttonClr, required this.label});

  final void Function()? onpress;
  final Color buttonClr;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpress,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.24,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
                width: 1.2, color: buttonClr, style: BorderStyle.solid)),
        child: Center(
          child: Text(
            label,
            style: appstyle(16, buttonClr, FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
