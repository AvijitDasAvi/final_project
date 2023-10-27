import 'package:final_project/screen/login_forget_signup/login.dart';
import 'package:final_project/widgets/animating_circles.dart';
import 'package:flutter/material.dart';

class SecondOnBoardingScreen extends StatefulWidget {
  const SecondOnBoardingScreen({super.key});

  @override
  State<SecondOnBoardingScreen> createState() => _SecondOnBoardingScreenState();
}

class _SecondOnBoardingScreenState extends State<SecondOnBoardingScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller ;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _controller.repeat(reverse: true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 125, 125),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.0,),
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatingCircles(),
                AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Transform.translate(offset: Offset(0, _controller.value * -60),
                  child: Image.asset(
                  "assets/images/manager.png",
                  width: 200,
                  height: 200,
                   ),
                  );
                },               
              ),
              ],
            ),
            SizedBox(height: 40.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "It's not just the product we sell , but the care we put every product for you",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  itemCount: onboardingLines.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.teal,
                      ),
                      title: Text(
                        onboardingLines[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    );
                  }
                ),
              ),
            ),
            Container(
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
                  ),
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => LogInScreen())
                      );
                    }, 
                    child: Text(
                      'Let\'s Go',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ),
            ),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
  // Text(
  //                 'Create Account',
  //                 style: TextStyle(
  //                   fontSize: 18.0,
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),

  final List<String> onboardingLines = [
    "SignUp: First Signup This Online Platform.",
    "Login: If You are All Ready Create Your Account then Login.",
    "Shop , Order, Relax: We are Giveing You Free Home Delivery on Any Product.",
    "Track Your Deliveries in Real-Time: Know Exactly When to Expect Your Package.",
    "Secure and Contactless: Your Product , Our Priority",
  ];
}