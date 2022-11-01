import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  MenuButton(
      {required this.text,
      required this.borderColor,
      required this.pressedColor,
      required this.customOnPressed});

  final Text text;
  final Color borderColor;
  final Color pressedColor;
  final Function() customOnPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 70,
      child: OutlinedButton(
        style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(
                  color: borderColor, width: 2, style: BorderStyle.solid),
            ),
            backgroundColor: getColor(Colors.transparent, pressedColor),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        onPressed: customOnPressed,
        child: text,
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    getColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    }

    return MaterialStateProperty.resolveWith(getColor);
  }
}
