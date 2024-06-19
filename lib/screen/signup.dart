import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purify/constants.dart';
import 'package:purify/screen/home.dart';
import 'package:purify/screen/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/shape8.png'),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: defaultPadding * 3,
                    right: defaultPadding,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Icon(
                      Icons.home,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                Text(
                  'Welcome',
                  style: GoogleFonts.ubuntu(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: defaultPadding * 2),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black54),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        height: 10,
                        width: 10,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'User Name',
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black54),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        height: 10,
                        width: 10,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black54),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        height: 10,
                        width: 10,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.phone_outlined,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Phone',
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black54),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        height: 10,
                        width: 10,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.lock_outline,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      // primary: Color(0xFFF7B43F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Handle login logic here
                    },
                    child: Text(
                      'Create',
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: GoogleFonts.ubuntu(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign In',
                        style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to the Login page
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('assets/images/shape64.png'),
        ],
      ),
    );
  }
}
