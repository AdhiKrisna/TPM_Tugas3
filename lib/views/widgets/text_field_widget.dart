
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isPass;
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isPass = false,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isHide = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isHide && widget.isPass,
      keyboardType: TextInputType.text,
      controller: widget.controller,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blue,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Colors.white,
        ),
        suffixIcon: widget.isPass
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isHide = !isHide;
                  });
                },
                icon: Icon(
                  isHide ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
