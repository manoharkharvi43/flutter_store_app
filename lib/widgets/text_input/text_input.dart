import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatefulWidget {
  const CustomInput(
      {Key? key,
        required this.placeholder,
        required this.controller,
        required this.keyboardType,
        this.inputFormatter = false,
        this.maxLength = 100,
        this.isIconRequired = false})
      : super(key: key);
  final String placeholder;
  final controller;
  final TextInputType keyboardType;
  final bool inputFormatter;
  final int maxLength;
  final bool isIconRequired;
  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: widget.isIconRequired
              ? _obscureText
              ? GestureDetector(
            child: Icon(Icons.visibility),
            onTap: () {
              setState(() {
                _obscureText = false;
              });
            },
          )
              : GestureDetector(
            child: Icon(Icons.visibility_off),
            onTap: () {
              setState(() {
                _obscureText = true;
              });
            },
          )
              : null,
          hintText: "${widget.placeholder}",
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        inputFormatters: [
          widget.inputFormatter
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter
        ],
        maxLength: widget.maxLength,
        obscureText: widget.isIconRequired ? _obscureText : false,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
    );
  }
}
