import 'package:flutter/material.dart';

class BookAppBar extends StatelessWidget {
  final VoidCallback leftButtonFun;
  final VoidCallback rightButtonFun;
  final String leftIcon;
  final String rightIcon;

  const BookAppBar(
      {Key key,
      @required this.leftButtonFun,
      @required this.rightButtonFun,
      @required this.leftIcon,
      @required this.rightIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: 80.0,
      child: new Column(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: new Image.asset(
                  leftIcon,
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.contain,
                ),
                onPressed: leftButtonFun,
                iconSize: 10.0,
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Design Books",
                    style: TextStyle(fontSize: 20.0, letterSpacing: 0.0),
                  ),
                ],
              ),
              IconButton(
                icon: new Image.asset(
                  rightIcon,
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.contain,
                ),
                onPressed: rightButtonFun,
                iconSize: 10.0,
              ),
            ],
          ),
          SizedBox(
            width: 100.0,
            height: 2.0,
            child: Container(
              height: 2.0,
              color: const Color(0xffAF0D10F),
            ),
          ),
        ],
      ),
    );
  }
}
