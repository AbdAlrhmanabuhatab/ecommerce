import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

/// Mock data source providing catalog data for the e-commerce application.
/// Simulates a remote repository with strongly typed data structures.
abstract final class MockDataSource {
  static const List<CategoryModel> categories = [
    CategoryModel(
      id: 'cat_foods',
      name: 'Foods',
      icon: Icons.restaurant,
      iconColor: AppColors.accentOrange,
    ),
    CategoryModel(
      id: 'cat_gift',
      name: 'Gift',
      icon: Icons.card_giftcard,
      iconColor: AppColors.accentOrange,
    ),
    CategoryModel(
      id: 'cat_fashion',
      name: 'Fashion',
      icon: Icons.shopping_bag,
      iconColor: AppColors.accentOrange,
    ),
    CategoryModel(
      id: 'cat_gadget',
      name: 'Gadget',
      icon: Icons.devices,
      iconColor: AppColors.accentOrange,
    ),
    CategoryModel(
      id: 'cat_accessory',
      name: 'Accessory',
      icon: Icons.watch,
      iconColor: AppColors.accentOrange,
    ),
  ];

  static const List<ProductModel> products = [
    ProductModel(
      id: 'prod_sneaker',
      name: 'Sneaker',
      price: 100.0,
      image: AppAssets.shoes,
      rating: 4.5,
      satisfactionRate: 4.0,
      reviewsCount: 180,
      description:
          'High-performance athletic sneakers designed for style, comfort, and everyday durability.',
      specifications: {
        'Brand': 'Nike Air',
        'Material': 'Mesh & Rubber',
        'Origin': 'Imported',
      },
    ),
    ProductModel(
      id: 'prod_fitbit',
      name: 'Fitbit Smartwatch',
      price: 150.0,
      image: AppAssets.smartwatch,
      rating: 4.3,
      satisfactionRate: 3.9,
      reviewsCount: 95,
      description:
          'Track all-day activity, 24/7 heart rate, and sleep stages with a sleek, water-resistant design.',
      specifications: {
        'Model Name': 'Fitbit Versa 3',
        'Battery Life': 'Up to 6 Days',
        'Water Resistance': '50 meters',
      },
    ),
    ProductModel(
      id: 'prod_smartphone',
      name: 'Smartphone',
      price: 599.0,
      image: AppAssets.smartphone,
      rating: 4.7,
      satisfactionRate: 4.4,
      reviewsCount: 310,
      description:
          'Features a breathtaking edge-to-edge display, all-day battery life, and pro-grade cameras.',
      specifications: {
        'Display': '6.7 inch AMOLED',
        'Storage': '256 GB',
        'RAM': '8 GB',
      },
    ),
    ProductModel(
      id: 'prod_headphone',
      name: 'Headphone',
      price: 199.0,
      image: AppAssets.headphone,
      rating: 4.2,
      satisfactionRate: 3.8,
      reviewsCount: 132,
      description:
          'Our compact and foldable Bluetooth headphones are renowned for their lightweight build, '
          'offering a convenient and portable solution for audiophiles on the go.',
      specifications: {
        'Model Name': 'Boat Airdopes 121V2',
        'Color': 'grey',
        'Playtime': 'Up to 30 Hours',
      },
    ),
  ];
}
