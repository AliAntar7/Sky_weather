import 'package:flutter/material.dart';

class DefButton extends StatelessWidget {
   DefButton({super.key, required this.text, this.onTap});

   String text;
   Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration : BoxDecoration(
        color: const Color(0xff2C74B3),
        borderRadius: BorderRadius.circular(30),
      ),
      height: 60,
      width: 330.0,
      child: MaterialButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'janna',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void navigateTo(context, widget) => Navigator.push(
  context, MaterialPageRoute(
  builder: (context) => widget,
),
);