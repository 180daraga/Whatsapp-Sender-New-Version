import 'package:first/shared/styles/colors/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constrans.dart';

class StandardContainer extends StatelessWidget {
  List<Widget> widgets = [];
  var padding;

  StandardContainer(this.widgets, {var ipadding}) {
    padding = ipadding;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.only(
            left: padding == null ? sidePadding : padding,
            right: padding == null ? sidePadding : padding,
            top: 10.0),
        width: double.infinity,
        child: Column(
          children: widgets,
        ),
      ),
    );
  }
}

Widget defaultTextField(
        {required TextEditingController controller,
        required TextInputType textInputType,
        required String label,
        required prefixIcon,
        enabled = true,
        required Function validation,
        var onTap,
        suffixIcon,
        int maxLines = 1,
        isPassword = false,
        var suffixIconPressed}) =>
    TextFormField(
        cursorColor: PrimaryColor,
        onTap: onTap,
        enabled: enabled,
        maxLines: maxLines,
        obscureText: isPassword,
        controller: controller,
        validator: (value) {
          return validation(value);
        },
        keyboardType: textInputType,
        decoration: InputDecoration(
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ThirdColor),
            ),
            hoverColor: Colors.white,
            labelText: label,
            fillColor: TextFieldFill,
            border: OutlineInputBorder(borderSide: BorderSide.none),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: IconButton(
              onPressed: suffixIconPressed,
              icon: Icon(suffixIcon),
            )));

Widget defaultButton(
        {var color,
        bool border = true,
        Color textColor = PrimaryColor,
        double width = double.infinity,
        double height = 50.0,
        double textSize = 18.0,
        required text,
        required Function function}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
          border: border
              ? Border.all(color: textColor == Colors.white ? color : textColor)
              : null),
      height: height,
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: textSize),
        ),
        onPressed: () {
          function();
        },
      ),
    );

class PhoneInfo extends StatelessWidget {
  String name = '';
  String phone = '';
  bool state = true;
  var func;

  PhoneInfo({
    required String iName,
    required String iPhone,
    required var iFunction,
    required bool iState
  }) {
    name = iName;
    phone = iPhone;
    func = iFunction;
    state = iState;
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  '$name',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text('$phone',

                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 15)),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 80,
                  child: defaultButton(
                      text: 'Send',
                      function: () {
                        func();
                      },
                      height: 25,
                      textSize: 15,
                      color: state? SecondaryColor : Colors.grey,
                      textColor: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
