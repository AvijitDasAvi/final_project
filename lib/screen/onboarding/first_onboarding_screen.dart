import 'package:final_project/screen/onboarding/second_onboarding_screen.dart';
import 'package:flutter/material.dart';

class FirstOnBoardingScreen extends StatefulWidget {
  const FirstOnBoardingScreen({super.key});

  @override
  State<FirstOnBoardingScreen> createState() => _FirstOnBoardingScreenState();
}

class _FirstOnBoardingScreenState extends State<FirstOnBoardingScreen> {

  Offset imageOffset = Offset.zero;
  double buttonOffset = 0.0;
  String titleText = 'Shopping';

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width -80;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 140, 168),
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Text(
              titleText,
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          Center(
            child: Text(
              'Deliver & Delight: Your world , Your order , Your way',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.white
              ),
            ),
          ),
          Spacer(),
          Transform(
            transform: Matrix4.translationValues(
              imageOffset.dx,
              0,
              0)..rotateZ((imageOffset.dx /20) * 3.14 / 180),
            child: GestureDetector(
              onPanUpdate: (details) {
                if(imageOffset.dx.abs() <= 120){
                  setState(() {
                    imageOffset = Offset(imageOffset.dx + details.delta.dx, 0);
                    titleText = 'Order';
                  });
                } 
              },
              onPanEnd: (_){
                setState(() {
                  imageOffset = Offset.zero;
                  titleText = 'Enjoy';
                });
              },
              child: SizedBox(
                height: 350.0,
                width: 350.0,
                child: Image.asset(
                  "assets/images/first.png"
                ),
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onPanUpdate: (details){
              if(details.delta.dx > 0 && buttonOffset <= buttonWidth -80){
                setState(() {
                  buttonOffset += details.delta.dx;
                });
              }
            },
            onPanEnd: (_){
              if(buttonOffset > buttonWidth / 2){
                setState(() {
                  buttonOffset = buttonWidth - 80;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondOnBoardingScreen()));
              }else{
                setState(() {
                  buttonOffset = 0.0;
                });
              }
            },
            child: Container(
              width: buttonWidth,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(40)
              ),
              child: Stack(
                children: [
                  AnimatedContainer(
                    width: buttonOffset + 80,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(40)
                    ),
                    duration: Duration(microseconds: 200),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 80,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.chevron_right_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}