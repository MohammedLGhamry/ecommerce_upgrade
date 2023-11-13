import 'package:ecommerce/cubits/auth_user/auth_user_cubit.dart';
import 'package:ecommerce/screens/splash_screen.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  late SharedPreferences prefs;

  String? name;
  String? phone;

  @override
  void initState() {
    super.initState();
    getInfo();
  }

   getInfo() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      phone = prefs.getString('phone');
    });
  }


  void removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access-token');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => SplashScreen(),
      ),
      (route) => false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 78),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
          child: AppBar(
            title: const Text('Profile'),
            titleSpacing: 16,
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryDarkColor,
              letterSpacing: 0.5,
              height: 1.5,
              fontFamily: 'poppins',
            ),
            elevation: 0,
            backgroundColor: Colors.white,
           /* leading: IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.grey,
              ),
            ),*/
          ),
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// divider
              Container(
                child: Divider(
                  thickness: 1,
                  color: AppColors.lightGrey,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile_picture.png'),
                  ),
                  const SizedBox(width: 16,),
                  Column(
                    children: [
                      Text(
                        '$name',
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primaryDarkColor,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                            height: 1.5
                        ),
                      ),

                      Text(
                        '$phone',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryDarkColor,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                            height: 1.5
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  removeToken();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  fixedSize:
                  Size(MediaQuery.of(context).size.width * .5, 55),
                ),
                child: Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.8,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
