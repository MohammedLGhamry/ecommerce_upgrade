class UserAddressModel {
  final String firstName;
  final String lastName;
   String country;
  final String streetAddressOne;
  final String? streetAddressTwo;
  final String city;
  final String state;
  final String zipCode;
  final String phoneNumber;

  UserAddressModel({
    required this.firstName,
    required this.lastName,
    required this.country,
    required this.streetAddressOne,
    this.streetAddressTwo,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.phoneNumber,
  });
}
