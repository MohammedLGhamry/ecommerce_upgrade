import 'package:ecommerce/models/user_address_model.dart';
import 'package:ecommerce/screens/edit_address_screen.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatefulWidget {
  final UserAddressModel userAddressModel;
  AddressWidget({Key? key, required this.userAddressModel}) : super(key: key);


  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  Color borderColor = AppColors.lightGrey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          borderColor = borderColor == AppColors.primaryColor
              ? AppColors.lightGrey
              : AppColors.primaryColor;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: borderColor,
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.userAddressModel.firstName} ${widget.userAddressModel.lastName}',
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryDarkColor,
                letterSpacing: .5,
              ),
            ),

            const SizedBox(height: 16,),

            Text(
              '${widget.userAddressModel.streetAddressOne} ${widget.userAddressModel.streetAddressTwo} ${widget.userAddressModel.city}',
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
                letterSpacing: .5,
              ),
            ),

            Text(
              '${widget.userAddressModel.state} ${widget.userAddressModel.zipCode} ${widget.userAddressModel.country}',
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
                letterSpacing: .5,
              ),
            ),

            const SizedBox(height: 16,),

            Text(
              '${widget.userAddressModel.phoneNumber}',
              style: TextStyle(
                fontSize: 12,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
                letterSpacing: .5,
              ),
            ),

            const SizedBox(height: 16,),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditAddressScreen(userAddressModel: widget.userAddressModel,)));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    fixedSize:
                    Size(77, 55),
                  ),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.8,
                      fontWeight: FontWeight.w700,
                      letterSpacing: .5,
                    ),
                  ),
                ),

                const SizedBox(width: 24,),

                Icon(
                  Icons.delete_outline_rounded,
                  color: AppColors.grey,
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
