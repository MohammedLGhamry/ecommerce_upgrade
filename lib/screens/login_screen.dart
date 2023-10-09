import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/register_screen.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordToggle = true;
  bool passwordValidation = true;

  final formKey = GlobalKey<FormState>();

  FocusNode email = FocusNode();
  FocusNode password = FocusNode();

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Icon & titles
                    Image.asset(
                      'assets/images/logo2.png',
                      height: 72,
                      width: 72,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Welcome to Lafyuu',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryDarkColor,
                        letterSpacing: .5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to continue',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.8,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                        letterSpacing: .5,
                      ),
                    ),
                    const SizedBox(height: 48),

                    /// email field
                    TextFormField(
                      focusNode: email,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(password);
                      },
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.8,
                        fontWeight: FontWeight.w700,
                        color: AppColors.grey,
                        letterSpacing: .5,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Your Email',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          height: 1.8,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                          letterSpacing: .5,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                            BorderSide(width: 1, color: AppColors.lightGrey )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primaryColor)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.lightRed)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.lightRed,
                              width: 1,
                            )),
                        errorStyle: TextStyle(
                          color: AppColors.lightRed,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: .5,
                          height: 1.5,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        ),
                        prefixIconColor: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return AppColors.primaryColor;
                              }
                              if (states.contains(MaterialState.error)) {
                                return AppColors.lightRed;
                              }
                              return AppColors.grey;
                            }),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 8),

                    /// password field
                    TextFormField(
                      focusNode: password,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.grey,
                        letterSpacing: .5,
                        height: 1.8,
                      ),
                      obscureText: passwordToggle,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                          letterSpacing: .5,
                          height: 1.8,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                            BorderSide(width: 1, color: AppColors.lightGrey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primaryColor)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.lightRed)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.lightRed,
                              width: 1,
                            )),
                        errorStyle: TextStyle(
                          color: AppColors.lightRed,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: .5,
                          height: 1.5,
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                        ),
                        prefixIconColor: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return AppColors.primaryColor;
                              }
                              if (states.contains(MaterialState.error)) {
                                return AppColors.lightRed;
                              }
                              return AppColors.grey;
                            }),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passwordToggle = !passwordToggle;
                            });
                          },
                          child: passwordToggle
                              ? const Icon(
                            Icons.visibility,
                          )
                              : const Icon(
                            Icons.visibility_off,
                          ),
                        ),
                        suffixIconColor: MaterialStateColor.resolveWith(
                                (states) => states.contains(MaterialState.focused)
                                ? AppColors.primaryColor
                                : AppColors.grey),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || passwordValidation == false) {
                          return 'Oops! Your Password Is Not Correct';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    /// sign in button
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        fixedSize: Size(width,55),
                      ),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.8,
                          fontWeight: FontWeight.w700,
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 21),

                    /// divider 'or'
                    Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                            thickness: 1,
                            color: AppColors.lightGrey,
                          )),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 23),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey,
                            letterSpacing: .7,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                            thickness: 1,
                            color: AppColors.lightGrey,
                          )),
                    ]),
                    const SizedBox(height: 16),

                    /// google button
                    OutlinedButton.icon(
                      icon: Image.asset(
                        'assets/images/google.png',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(width, 57),
                        side: BorderSide(
                          color: AppColors.lightGrey,
                        ),
                      ),
                      label: Center(
                        child: Text(
                          'Login with Google',
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            height: 1.8,
                            fontWeight: FontWeight.w700,
                            letterSpacing: .5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    /// facebook button
                    OutlinedButton.icon(
                      icon: Image.asset(
                        'assets/images/fb.png',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(width, 57),
                        side: BorderSide(
                          color: AppColors.lightGrey,
                        ),
                      ),
                      label: Center(
                        child: Text(
                          'Login with Facebook',
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            height: 1.8,
                            fontWeight: FontWeight.w700,
                            letterSpacing: .5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// forget password text
                    GestureDetector(
                      onTap: (){},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.5,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    /// register text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have a account? ',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            color: AppColors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.5,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

