class ReviewModel {
  String profilePicture;
  String username;
  int? ratingStars;
  String reviewDescription;
  List<String>? listOfImages;
  String date;


  ReviewModel({
    required this.profilePicture,
    required this.username,
    this.ratingStars,
    required this.reviewDescription,
    required this.date,
    this.listOfImages
  });
}
