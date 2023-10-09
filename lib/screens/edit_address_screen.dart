import 'package:ecommerce/models/user_address_model.dart';
import 'package:ecommerce/screens/shipping_screen.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';


class EditAddressScreen extends StatefulWidget {
  final UserAddressModel userAddressModel;
  const EditAddressScreen({Key? key, required this.userAddressModel})
      : super(key: key);

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 78),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 8, right: 15),
          child: AppBar(
            title: const Text('Edit Address'),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShippingScreen()));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.grey,
              ),
            ),
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

                        /// country section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Country or region',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryDarkColor,
                                letterSpacing: .5,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            CSCPicker(
                              flagState: CountryFlag.DISABLE,
                              showCities: false,
                              showStates: false,
                              countryFilter: CscCountry.values,
                              countryDropdownLabel: widget.userAddressModel.country,
                              dropdownDecoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: AppColors.lightGrey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledDropdownDecoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: AppColors.lightGrey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              selectedItemStyle: TextStyle(
                                fontSize: 12,
                                height: 2,
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey,
                                letterSpacing: .5,
                              ),
                              dropdownHeadingStyle: TextStyle(
                                  color: AppColors.primaryDarkColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  letterSpacing: .5,
                              ),

                              dropdownItemStyle: TextStyle(
                                color: AppColors.primaryDarkColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                letterSpacing: .5,
                              ),
                              dropdownDialogRadius: 5.0,
                              searchBarRadius: 5.0,

                              onCountryChanged: (value){
                               setState(() {
                                  widget.userAddressModel.country = value;
                                });
                              },

                            ),

                          ],
                        ),
                        const SizedBox(height: 24,),

                        /// first name section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Name',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryDarkColor,
                                letterSpacing: .5,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.8,
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey,
                                letterSpacing: .5,
                              ),
                              decoration: InputDecoration(
                                hintText: widget.userAddressModel.firstName,
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  height: 1.8,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.grey,
                                  letterSpacing: .5,
                                ),

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color: AppColors.lightGrey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.primaryColor)
                                ),

                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.lightRed)
                                ),

                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lightRed,
                                      width: 1,
                                    )
                                ),

                                errorStyle: TextStyle(
                                  color: AppColors.lightRed,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .5,
                                  height: 1.5,
                                ),
                              ),

                            ),
                          ],
                        ),
                        const SizedBox(height: 24,),

                        /// last name section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last Name',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryDarkColor,
                                letterSpacing: .5,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.8,
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey,
                                letterSpacing: .5,
                              ),
                              decoration: InputDecoration(
                                hintText: widget.userAddressModel.lastName,
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  height: 1.8,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.grey,
                                  letterSpacing: .5,
                                ),

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color: AppColors.lightGrey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.primaryColor)
                                ),

                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.lightRed)
                                ),

                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lightRed,
                                      width: 1,
                                    )
                                ),

                                errorStyle: TextStyle(
                                  color: AppColors.lightRed,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .5,
                                  height: 1.5,
                                ),
                              ),

                            ),
                          ],
                        ),
                        const SizedBox(height: 24,),

                        /// Street Address One section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Street Address',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryDarkColor,
                                letterSpacing: .5,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.streetAddress,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.8,
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey,
                                letterSpacing: .5,
                              ),
                              decoration: InputDecoration(
                                hintText: widget.userAddressModel.streetAddressOne,
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  height: 1.8,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.grey,
                                  letterSpacing: .5,
                                ),

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color: AppColors.lightGrey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.primaryColor)
                                ),

                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.lightRed)
                                ),

                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lightRed,
                                      width: 1,
                                    )
                                ),

                                errorStyle: TextStyle(
                                  color: AppColors.lightRed,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .5,
                                  height: 1.5,
                                ),
                              ),

                            ),
                          ],
                        ),
                        const SizedBox(height: 24,),

                        /// Street Address Two section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Street Address 2 (Optional)',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryDarkColor,
                                letterSpacing: .5,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.streetAddress,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.8,
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey,
                                letterSpacing: .5,
                              ),
                              decoration: InputDecoration(
                                hintText: widget.userAddressModel.streetAddressTwo == null ? 'Undefined': widget.userAddressModel.streetAddressTwo,
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  height: 1.8,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.grey,
                                  letterSpacing: .5,
                                ),

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color: AppColors.lightGrey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.primaryColor)
                                ),

                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.lightRed)
                                ),

                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lightRed,
                                      width: 1,
                                    )
                                ),

                                errorStyle: TextStyle(
                                  color: AppColors.lightRed,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .5,
                                  height: 1.5,
                                ),
                              ),

                            ),
                          ],
                        ),
                        const SizedBox(height: 24,),

                        /// city section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'City',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryDarkColor,
                                letterSpacing: .5,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.8,
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey,
                                letterSpacing: .5,
                              ),
                              decoration: InputDecoration(
                                hintText: widget.userAddressModel.city,
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  height: 1.8,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.grey,
                                  letterSpacing: .5,
                                ),

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color: AppColors.lightGrey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.primaryColor)
                                ),

                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.lightRed)
                                ),

                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lightRed,
                                      width: 1,
                                    )
                                ),

                                errorStyle: TextStyle(
                                  color: AppColors.lightRed,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .5,
                                  height: 1.5,
                                ),
                              ),

                            ),
                          ],
                        ),
                        const SizedBox(height: 24,),

                        /// State/Province/Region section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'State/Province/Region',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryDarkColor,
                                letterSpacing: .5,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.8,
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey,
                                letterSpacing: .5,
                              ),
                              decoration: InputDecoration(
                                hintText: widget.userAddressModel.state,
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  height: 1.8,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.grey,
                                  letterSpacing: .5,
                                ),

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color: AppColors.lightGrey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.primaryColor)
                                ),

                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.lightRed)
                                ),

                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lightRed,
                                      width: 1,
                                    )
                                ),

                                errorStyle: TextStyle(
                                  color: AppColors.lightRed,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .5,
                                  height: 1.5,
                                ),
                              ),

                            ),
                          ],
                        ),
                        const SizedBox(height: 24,),

                        /// Zip Code section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Zip Code',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryDarkColor,
                                letterSpacing: .5,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.8,
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey,
                                letterSpacing: .5,
                              ),
                              decoration: InputDecoration(
                                hintText: widget.userAddressModel.zipCode,
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  height: 1.8,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.grey,
                                  letterSpacing: .5,
                                ),

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color: AppColors.lightGrey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.primaryColor)
                                ),

                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.lightRed)
                                ),

                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lightRed,
                                      width: 1,
                                    )
                                ),

                                errorStyle: TextStyle(
                                  color: AppColors.lightRed,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .5,
                                  height: 1.5,
                                ),
                              ),

                            ),
                          ],
                        ),
                        const SizedBox(height: 24,),

                        /// Phone Number section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryDarkColor,
                                letterSpacing: .5,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.8,
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey,
                                letterSpacing: .5,
                              ),
                              decoration: InputDecoration(
                                hintText: widget.userAddressModel.phoneNumber,
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  height: 1.8,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.grey,
                                  letterSpacing: .5,
                                ),

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color: AppColors.lightGrey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.primaryColor)
                                ),

                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.lightRed)
                                ),

                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lightRed,
                                      width: 1,
                                    )
                                ),

                                errorStyle: TextStyle(
                                  color: AppColors.lightRed,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .5,
                                  height: 1.5,
                                ),
                              ),

                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),

                        /// Save Address button
                        ElevatedButton(
                          onPressed: (){
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            fixedSize: Size(MediaQuery.of(context).size.width,55),
                          ),
                          child: Text(
                            'Save Address',
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
