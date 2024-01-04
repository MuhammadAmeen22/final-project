import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const StyledButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 55,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(colors: [
            Color(0xff101113),
            Color(0xff253f96),
          ]),
        ),
        child:  Center(
          child: Text(
            text,
             style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white),

          ),
        ),
      ),
    );
  }
}
