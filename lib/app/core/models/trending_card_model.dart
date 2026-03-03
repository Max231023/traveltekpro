class TrendingCardModel {
  final String imageUrl;
  final String tag;
  final String title;
  final String location;
  final double rating;
  final bool hasLoyaltyBadge;

  const TrendingCardModel({
    required this.imageUrl,
    required this.tag,
    required this.title,
    required this.location,
    required this.rating,
    this.hasLoyaltyBadge = true,
  });
}
