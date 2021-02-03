library creditcard_ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCard extends StatefulWidget {
  final Color color;
  final LinearGradient gradient;
  final Border border;
  final TextEditingController number, name;
  final Map<String, TextEditingController> expire;
  final BorderRadius borderRadius;
  final List<BoxShadow> boxShadow;
  final EdgeInsets padding;
  final double height, width;
  final Widget image;
  final String cardNumberHintText,
      nameHintText,
      expiresMonthHintText,
      expiresYearHintText;
  CreditCard({
    Key key,
    this.color,
    this.gradient,
    this.number,
    this.name,
    this.expire,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.padding,
    this.height,
    this.width,
    this.image,
    this.cardNumberHintText,
    this.nameHintText,
    this.expiresMonthHintText,
    this.expiresYearHintText,
  }) : super(key: key);

  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.color,
        gradient: widget.gradient,
        borderRadius: widget.borderRadius,
        border: widget.border,
        boxShadow: widget.boxShadow,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomButton(
                borderRadius: BorderRadius.circular(200),
                color: Colors.white.withAlpha(40),
                onTap: () => {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.credit_card,
                    color: widget.color,
                  ),
                ),
              ),
              Opacity(
                opacity: 1,
                child: widget.image,
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 30,
            child: CustomField(
              controller: widget.number,
              type: TextInputType.number,
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              hintText: widget.cardNumberHintText,
              maxLen: 16,
              counterText: "",
              obscureText: false,
              onChanged: (s) => {
                if (s.length == 16) FocusScope.of(context).nextFocus(),
              },
              hintStyle: TextStyle(
                letterSpacing: 0,
                color: Colors.white.withAlpha(150),
              ),
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 4,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
                width: 150,
                child: CustomField(
                  controller: widget.name,
                  type: TextInputType.name,
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  hintText: widget.nameHintText,
                  counterText: "",
                  obscureText: false,
                  hintStyle: TextStyle(
                    color: Colors.white.withAlpha(150),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              SizedBox(
                height: 30,
                width: 20,
                child: CustomField(
                  controller: widget.expire["month"],
                  type: TextInputType.number,
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  hintText: widget.expiresMonthHintText,
                  maxLen: 2,
                  counterText: "",
                  onChanged: (s) => {
                    if (s.length == 2) FocusScope.of(context).nextFocus(),
                  },
                  obscureText: false,
                  hintStyle: TextStyle(
                    color: Colors.white.withAlpha(150),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
                child: Text(
                  "/",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                width: 20,
                child: CustomField(
                  controller: widget.expire["year"],
                  type: TextInputType.number,
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  hintText: widget.expiresYearHintText,
                  maxLen: 2,
                  onChanged: (s) => {
                    if (s.length < 1) FocusScope.of(context).previousFocus(),
                  },
                  counterText: "",
                  obscureText: false,
                  hintStyle: TextStyle(
                    color: Colors.white.withAlpha(150),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final double width;
  final EdgeInsets padding, margin;
  final TextInputType type;
  final Function submit, onChanged;
  final int maxLen;
  final Color color;
  final TextStyle style, hintStyle;
  final BorderRadius borderRadius;
  final String counterText;
  CustomField({
    Key key,
    this.controller,
    this.hintText,
    this.obscureText,
    this.padding,
    this.margin,
    this.type,
    this.submit,
    this.maxLen,
    this.width = double.infinity,
    this.borderRadius,
    this.color,
    this.onChanged,
    this.style,
    this.hintStyle,
    this.counterText,
  }) : super(key: key);

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: widget.borderRadius,
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        cursorColor: Colors.white,
        keyboardType: widget.type,
        maxLength: widget.maxLen,
        onSubmitted: widget.submit,
        style: widget.style,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          border: InputBorder.none,
          counterText: widget.counterText,
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final Color color;
  final Widget child;
  final BorderRadius borderRadius;
  final Function onTap;
  CustomButton({
    Key key,
    this.color,
    this.child,
    this.onTap,
    this.borderRadius,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: widget.borderRadius,
      color: widget.color,
      child: InkWell(
        borderRadius: widget.borderRadius,
        onTap: widget.onTap,
        child: widget.child,
      ),
    );
  }
}
