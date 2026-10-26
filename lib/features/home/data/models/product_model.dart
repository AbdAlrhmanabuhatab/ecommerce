import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

/// Data model representing a product in the store with detailed specifications.
class ProductModel {
  final String id;
  final String name;
  final double price;
  final String image;
  final double rating;
  final double satisfactionRate;
  final int reviewsCount;
  final String description;
  final Map<String, String> specifications;
  final List<Color> availableColors;
  final bool isOnSale;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.rating = 4.2,
    this.satisfactionRate = 3.8,
    this.reviewsCount = 132,
    this.description =
        'Our compact and foldable Bluetooth earbuds are renowned for their lightweight build, '
        'offering a convenient and portable solution for audiophiles on the go.',
    this.specifications = const {
      'Model Name': 'Boat Airdopes 121V2',
      'Color': 'grey',
    },
    this.availableColors = const [
      AppColors.swatchPeach,
      AppColors.swatchBlack,
      AppColors.swatchPurple,
      AppColors.swatchBlueGrey,
    ],
    this.isOnSale = true,
  });

  /// Formatted price with dollar symbol.
  String get formattedPrice {
    if (price == price.roundToDouble()) {
      return '${price.toInt()}\$';
    }
    return '${price.toStringAsFixed(2)}\$';
  }

  /// Create model from legacy or dynamic map for backwards compatibility.
  factory ProductModel.fromMap(Map<String, dynamic> map, {String? defaultId}) {
    double parsedPrice = 0.0;
    final rawPrice = map['price'];
    if (rawPrice is num) {
      parsedPrice = rawPrice.toDouble();
    } else if (rawPrice is String) {
      final sanitized = rawPrice.replaceAll(r'$', '').trim();
      parsedPrice = double.tryParse(sanitized) ?? 0.0;
    }

    return ProductModel(
      id:
          map['id']?.toString() ??
          defaultId ??
          map['product']?.toString() ??
          '',
      name: map['product']?.toString() ?? map['name']?.toString() ?? '',
      price: parsedPrice,
      image: map['image']?.toString() ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 4.2,
      satisfactionRate: (map['satisfactionRate'] as num?)?.toDouble() ?? 3.8,
      reviewsCount: (map['reviewsCount'] as num?)?.toInt() ?? 132,
      description:
          map['description']?.toString() ??
          'Our compact and foldable Bluetooth earbuds are renowned for their lightweight build, '
              'offering a convenient and portable solution for audiophiles on the go.',
      specifications:
          (map['specifications'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, v.toString()),
          ) ??
          const {'Model Name': 'Boat Airdopes 121V2', 'Color': 'grey'},
      isOnSale: map['isOnSale'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': name,
      'price': formattedPrice,
      'image': image,
      'rating': rating,
      'satisfactionRate': satisfactionRate,
      'reviewsCount': reviewsCount,
      'description': description,
      'specifications': specifications,
      'isOnSale': isOnSale,
    };
  }

  ProductModel copyWith({
    String? id,
    String? name,
    double? price,
    String? image,
    double? rating,
    double? satisfactionRate,
    int? reviewsCount,
    String? description,
    Map<String, String>? specifications,
    List<Color>? availableColors,
    bool? isOnSale,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      satisfactionRate: satisfactionRate ?? this.satisfactionRate,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      description: description ?? this.description,
      specifications: specifications ?? this.specifications,
      availableColors: availableColors ?? this.availableColors,
      isOnSale: isOnSale ?? this.isOnSale,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
