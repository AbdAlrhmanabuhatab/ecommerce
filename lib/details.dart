import 'package:flutter/material.dart';
import 'core/constants/app_assets.dart';
import 'features/home/data/models/product_model.dart';
import 'features/product_details/presentation/screens/product_details_screen.dart';

export 'features/product_details/presentation/screens/product_details_screen.dart';

/// Backward-compatible adapter for [ProductDetailsScreen].
/// Accepts dynamic legacy map data or strongly-typed [ProductModel].
class ItemsDetails extends StatelessWidget {
  final dynamic data;

  const ItemsDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final ProductModel product;
    if (data is ProductModel) {
      product = data as ProductModel;
    } else if (data is Map) {
      product = ProductModel.fromMap(Map<String, dynamic>.from(data as Map));
    } else {
      product = const ProductModel(
        id: 'default',
        name: 'Item Details',
        price: 0.0,
        image: AppAssets.headphone,
      );
    }

    return ProductDetailsScreen(product: product);
  }
}
