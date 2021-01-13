import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:how_much_flutter/constants.dart';

class AppBarBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.15,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.2 - 27,
                decoration: BoxDecoration(
                    color: PrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    )),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: DefaultPadding),
                    padding: EdgeInsets.symmetric(horizontal: DefaultPadding),
                    height: 54,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: PrimaryColor.withOpacity(0.2))
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "누규?",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5)
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
