// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PriceField3 extends StatefulWidget {
  const PriceField3({
    Key? key,
    this.width,
    this.height,
    required this.color,
    required this.borderRadius,
    required this.initialValue,
    required this.fontSize,
    required this.textColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color color;
  final double borderRadius;
  final String initialValue;
  final double fontSize;
  final Color textColor;

  @override
  _PriceFieldState createState() => _PriceFieldState();
}

class _PriceFieldState extends State<PriceField3> {
  late TextEditingController _priceEditingController;
  final currencyFormat = new NumberFormat("#,##0.00", "es_US");

  @override
  void initState() {
    super.initState();
    _priceEditingController = TextEditingController();
    _priceEditingController.text = widget.initialValue;
  }

  @override
  void dispose() {
    _priceEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: TextField(
        controller: _priceEditingController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          TextInputFormatter.withFunction((oldValue, newValue) {
            final text = newValue.text;
            final selection = newValue.selection;
            if (text.isEmpty) {
              return TextEditingValue(text: '', selection: selection);
            } else if (text.length == 1) {
              final number = int.tryParse(text);
              if (number == null) {
                return oldValue;
              } else {
                final newText = '0.${number.toString()}';
                return TextEditingValue(
                  text: newText,
                  selection: TextSelection.collapsed(offset: newText.length),
                );
              }
            } else {
              final price = double.parse(text.replaceAll('.', '')) / 100;
              final newText = currencyFormat.format(price);
              FFAppState().update(() {
                FFAppState().propPrice3 = price;
              });
              final newSelectionIndex =
                  newText.length - (text.length - selection.end);
              return TextEditingValue(
                text: newText,
                selection: TextSelection.collapsed(offset: newSelectionIndex),
              );
            }
          })
        ],
        onChanged: (value) {},
        style: TextStyle(
          fontSize: widget.fontSize,
          color: widget.textColor,
        ),
        decoration: InputDecoration(
          hintText: '24 horas',
          hintStyle: TextStyle(color: widget.color),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(color: widget.color),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(color: widget.color),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(color: widget.color),
          ),
        ),
      ),
    );
  }
}
