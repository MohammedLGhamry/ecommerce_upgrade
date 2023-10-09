import 'package:ecommerce/models/user_address_model.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:ecommerce/widgets/address_widget.dart';
import 'package:flutter/material.dart';

class ShippingScreen extends StatelessWidget {
  ShippingScreen({Key? key}) : super(key: key);

  List<UserAddressModel> usersAddress = [
    UserAddressModel(
      firstName: 'Mohammed',
      lastName: 'L Ghamry',
      country: 'Egypt',
      streetAddressOne: 'Ramses street',
      city: 'Itay Elbaroud',
      state: 'Beheira',
      zipCode: '22951',
      phoneNumber: '01146633942',
    ),
    UserAddressModel(
      firstName: 'Leo',
      lastName: 'Messi',
      country: 'Egypt',
      streetAddressOne: 'Ramses street',
      city: 'Itay Elbaroud',
      state: 'Beheira',
      zipCode: '22951',
      phoneNumber: '01146633942',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 78),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 8, right: 15),
          child: AppBar(
            title: const Text('Ship To'),
            titleSpacing: 0,
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
            leading: IconButton(
              onPressed: () {
                // TODO back button
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.grey,
              ),
            ),
            actions: [
              // TODO add address tap
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              /// divider
              Container(
                child: Divider(
                  thickness: 1,
                  color: AppColors.lightGrey,
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: ListView.separated(
                            itemCount: usersAddress.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index){
                            return AddressWidget(userAddressModel: usersAddress[index]);
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 16,);
                            },
                          ),
                        ),

                        const SizedBox(height: 16,),

                        /// next button
                        ElevatedButton(
                          onPressed: () {
                            /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShippingScreen()));*/
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 55),
                          ),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.8,
                              fontWeight: FontWeight.w700,
                              letterSpacing: .5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
