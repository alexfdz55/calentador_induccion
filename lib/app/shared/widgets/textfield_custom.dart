import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldCustom extends StatefulWidget {
  final TextEditingController controller;
  // final String hintText;
  final String textValidation;
  final TextInputType textInputType;
  final bool password;
  final IconData icon;
  final bool capitalization;
  final Function onChanged;
  final FormFieldValidator<String>? validator;
  final bool colorNormal;

  TextFieldCustom({
    required this.controller,
    // required this.hintText,
    required this.textValidation,
    required this.textInputType,
    this.password = false,
    required this.icon,
    this.capitalization = false,
    required this.onChanged,
    this.colorNormal = false,
    this.validator,
  });

  @override
  _TextFieldCustomState createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool hintPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: TextFormField(
          controller: widget.controller,
          style: TextStyle(fontSize: 17, color: Colors.white),
          textCapitalization: (widget.capitalization)
              ? TextCapitalization.sentences
              : TextCapitalization.none,
          keyboardType: widget.textInputType,
          obscureText: widget.password ? hintPassword : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.5),
            focusColor: Colors.green,
            prefixIcon: Icon(widget.icon, size: 20, color: Colors.white),
            hintText: '0',
            hintStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            suffixIcon: widget.password ? buttonShowPassword() : null,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
            contentPadding: EdgeInsets.all(0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          onChanged: (value) {
            widget.onChanged();
          },
          validator: (value) => widget.validator!(value)),
    );
  }

  buttonShowPassword() {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.all(4),
        child: Icon(
          hintPassword
              ? FontAwesomeIcons.solidEye
              : FontAwesomeIcons.solidEyeSlash,
          size: 20,
          color: Colors.white,
        ),
      ),
      onTap: () {
        hintPassword = !hintPassword;
        setState(() {});
      },
    );
  }
}
