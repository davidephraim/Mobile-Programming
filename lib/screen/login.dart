import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:purify/screen/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  static const double defaultPadding = 16.0;  // Define defaultPadding

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/shape7.png'),
          Spacer(),
          Center(
            child: Column(
              children: [
                Text(
                  'Welcome Back!',
                  style: GoogleFonts.ubuntu(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: defaultPadding * 2),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black54)),
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
                        hintText: 'Email address',
                        hintStyle: TextStyle(color: Colors.black26)),
                  ),
                ),
                SizedBox(height: defaultPadding),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black54)),
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
                        hintStyle: TextStyle(color: Colors.black26)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: 
                    Row(children: [
                      Checkbox(value: isChecked, 
                      checkColor: Colors.white,
                      activeColor: Colors.orange,
                      side: BorderSide(width: 1, color: Colors.orange),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      onChanged: (bool? value){
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                      SizedBox(width: 5,),
                      Text(
                        'Remember me!',
                        style: GoogleFonts.ubuntu(
                          color: Colors.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,),
                      ),
                    ],
                  ),
                ),
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
                      'Login',
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
                    text: "Don't have an account? ",
                    style: GoogleFonts.ubuntu(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to the SignUp page
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => SignUp()),
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
