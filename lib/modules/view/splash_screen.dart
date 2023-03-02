import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_tutorial/modules/view/home_screen.dart';

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 35,),
            Image.asset("assets/images/shopping.png"),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 70.0,
                       fontWeight: FontWeight.w600
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ScaleAnimatedText('Shop'),
                        ScaleAnimatedText('Save'),
                        ScaleAnimatedText('Enjoy'),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ));
                },
                child: Text(
                  "Explore Now ->",
                  style: GoogleFonts.poppins(color: Colors.green, fontSize: 17),
                ))
          ],
        ),
      ),
    );
  }
}
