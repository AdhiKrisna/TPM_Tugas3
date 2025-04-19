class RecommendationModel {
  String siteName;
  String siteUrl;
  String imagePath;
  String description;
  bool isFavorite;

  RecommendationModel({
    required this.siteName,
    required this.siteUrl,
    required this.imagePath,
    required this.description,
    this.isFavorite = false,
  });
}