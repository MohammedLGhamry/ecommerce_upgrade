import 'package:ecommerce/cubits/auth_user/auth_user_cubit.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:ecommerce/themes/flutter_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordToggle = true;
  bool passwordValidation = true;

  final formKey = GlobalKey<FormState>();

  FocusNode fullName = FocusNode();
  FocusNode email = FocusNode();
  FocusNode phone = FocusNode();
  FocusNode password = FocusNode();
  FocusNode passwordAgain = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
        //resizeToAvoidBottomInset : false,

        body: BlocListener<AuthUserCubit, AuthUserState>(
          listener: (context, state) {
            if (state is AuthFailedUnExpected) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.red,
              ));
            }

            if (state is AuthDataNotValid) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.red,
              ));
            }

            if (state is AuthSuccess) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => MainScreen()),
                (route) => false,
              );
            }
          },
          child: BlocBuilder<AuthUserCubit, AuthUserState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SafeArea(
                child: Center(
                  child: SingleChildScrollView(
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
                              'Let’s Get Started',
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
                              'Create an new account',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.8,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                                letterSpacing: .5,
                              ),
                            ),
                            const SizedBox(height: 28),

                            /// full name field
                            TextFormField(
                              controller: nameController,
                              focusNode: fullName,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(email);
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
                                hintText: 'Full Name',
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
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.lightGrey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.lightRed)),
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
                                  FlutterFontIcons.user,
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
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Your Full Name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 8),

                            /// email field
                            TextFormField(
                              controller: emailController,
                              focusNode: email,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(phone);
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
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.lightGrey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.lightRed)),
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
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
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

                            /// phone field
                            TextFormField(
                              controller: phoneController,
                              focusNode: phone,
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
                                hintText: 'Your Phone',
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
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.lightGrey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.lightRed)),
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
                                  Icons.phone,
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
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Your Phone';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 8),

                            /// password field
                            TextFormField(
                              controller: passwordController,
                              focusNode: password,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(passwordAgain);
                              },
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
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.lightGrey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.lightRed)),
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
                                    (states) =>
                                        states.contains(MaterialState.focused)
                                            ? AppColors.primaryColor
                                            : AppColors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Your Password';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 8),

                            /// confirm password field
                            TextFormField(
                              controller: confirmPasswordController,
                              focusNode: passwordAgain,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey,
                                letterSpacing: .5,
                                height: 1.8,
                              ),
                              obscureText: passwordToggle,
                              decoration: InputDecoration(
                                hintText: 'Password Again',
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
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.lightGrey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.lightRed)),
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
                                    (states) =>
                                        states.contains(MaterialState.focused)
                                            ? AppColors.primaryColor
                                            : AppColors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    passwordController.text !=
                                        confirmPasswordController.text) {
                                  return 'Passwords do not match!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 16),

                            /// sign up button

                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthUserCubit>().register(
                                        nameController.text,
                                        emailController.text,
                                        phoneController.text,
                                        passwordController.text,
                                      );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                fixedSize: Size(width, 55),
                              ),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  height: 1.8,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .5,
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            /// sign in text
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'have a account? ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5,
                                    color: AppColors.grey,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ));
                                    },
                                    style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontSize: 12,
                                        height: 1.5,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.5,
                                        color: AppColors.primaryColor,
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
