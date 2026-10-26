/// Type-safe asset references for images and icons used in the application.
/// Prevents runtime typos and guarantees compile-time verification of assets.
abstract final class AppAssets {
  static const String _imagesPath = 'images';

  static const String advertisement = '$_imagesPath/advertisement.png';
  static const String appLogo = '$_imagesPath/applogo.jpg';
  static const String shoes = '$_imagesPath/shoes.png';
  static const String headphone = '$_imagesPath/headphone.png';
  static const String smartphone = '$_imagesPath/smartphone.png';
  static const String smartwatch = '$_imagesPath/smartwatch.png';
}
