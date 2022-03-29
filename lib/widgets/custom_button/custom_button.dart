import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function onClick;
  const CustomButton(
      {Key? key,
      required this.onClick,
      required this.buttonName,
      required this.buttonColor,
      required this.textColor})
      : super(key: key);
  final String buttonName;
  final Color buttonColor;
  final Color textColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => widget.onClick(),
        child: Container(
          child: Text(
            widget.buttonName,
            style: TextStyle(color: Colors.white),
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.83,
          color: widget.buttonColor,
        ));
  }
}
