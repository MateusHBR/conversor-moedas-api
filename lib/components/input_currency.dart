import 'package:flutter/material.dart';

class InputCurrency extends StatelessWidget {
  final TextEditingController currencyController;
  final size;
  final String labelText;
  final String prefixText;

  InputCurrency({
    @required this.currencyController,
    @required this.size,
    @required this.prefixText,
    @required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.10,
        vertical: size.height * 0.01,
      ),
      child: TextField(
        controller: currencyController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          labelText: labelText,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.025,
          ),
          prefixText: prefixText,
        ),
      ),
    );
  }
}
