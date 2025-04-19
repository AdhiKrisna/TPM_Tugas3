import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas3_tpm/models/recommendation_model.dart';

class RecommendationController extends GetxController {
  RxList<RecommendationModel> codingSites =
      <RecommendationModel>[
        RecommendationModel(
          siteName: "freeCodeCamp",
          siteUrl: "https://www.freecodecamp.org",
          imagePath: 'assets/images/logo/Freecodecamp.jpg',
          description:
              "Belajar coding gratis: web dev, data science, dan banyak lagi.",
        ),
        RecommendationModel(
          siteName: "The Odin Project",
          siteUrl: "https://www.theodinproject.com",
          imagePath: 'assets/images/logo/theodinproject.jpg',
          description: "Kurikulum full-stack developer gratis dan open-source.",
        ),
        RecommendationModel(
          siteName: "Codecademy",
          siteUrl: "https://www.codecademy.com",
          imagePath: "assets/images/logo/codecademy.jpg",
          description:
              "Belajar bahasa pemrograman interaktif: Python, JavaScript, dll.",
        ),
        RecommendationModel(
          siteName: "W3Schools",
          siteUrl: "https://www.w3schools.com",
          imagePath: 'assets/images/logo/w3schools.png',
          description: "Tutorial dasar HTML, CSS, JavaScript, dan lainnya.",
        ),
        RecommendationModel(
          siteName: "MDN Web Docs",
          siteUrl: "https://developer.mozilla.org",
          imagePath: 'assets/images/logo/mdn.jpg',
          description: "Dokumentasi lengkap untuk web developer dari Mozilla.",
        ),
        RecommendationModel(
          siteName: "LeetCode",
          siteUrl: "https://leetcode.com",
          imagePath: "assets/images/logo/leetcode.png",
          description: "Latihan coding dan persiapan interview teknikal.",
        ),
        RecommendationModel(
          siteName: "HackerRank",
          siteUrl: "https://www.hackerrank.com",
          imagePath: "assets/images/logo/hackerRank.jpg",
          description: "Practice coding, data structures, dan algoritma.",
        ),
        RecommendationModel(
          siteName: "GeeksforGeeks",
          siteUrl: "https://www.geeksforgeeks.org",
          imagePath: "assets/images/logo/g4g.png",
          description:
              "Artikel dan soal coding untuk belajar struktur data dan algoritma.",
        ),
        RecommendationModel(
          siteName: "CS50 - Harvard",
          siteUrl: "https://cs50.harvard.edu",
          imagePath: "assets/images/logo/cs50.jpg",
          description: "Kursus gratis Harvard: Computer Science untuk pemula.",
        ),
        RecommendationModel(
          siteName: "Dev.to",
          siteUrl: "https://dev.to",
          imagePath: "assets/images/logo/devto.png",
          description:
              "Platform komunitas developer untuk berbagi artikel dan pengalaman.",
        ),
      ].obs;
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final List<bool> favoriteStatus =
        prefs.getStringList('favoriteStatus')?.map((e) => e == 'true').toList() ??
            List.generate(codingSites.length, (index) => false);
    for (int i = 0; i < codingSites.length; i++) {
      codingSites[i].isFavorite = favoriteStatus[i];
    }
    codingSites.refresh(); // penting buat update UI
  }

  void toggleFavorite(int index) async {
    codingSites[index].isFavorite = !codingSites[index].isFavorite;
    codingSites.refresh(); // biar UI langsung update

    final prefs = await SharedPreferences.getInstance();
    List<String> updatedStatus = codingSites.map((site) => site.isFavorite.toString()).toList();
    await prefs.setStringList('favoriteStatus', updatedStatus);
  }
}
