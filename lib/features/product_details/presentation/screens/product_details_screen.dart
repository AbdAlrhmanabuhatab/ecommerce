import 'package:flutter/material.dart';
import '../../../../core/widgets/cart_floating_action_button.dart';
import '../../../../core/widgets/custom_ecommerce_app_bar.dart';
import '../../../../core/widgets/custom_ecommerce_bottom_bar.dart';
import '../../../home/data/models/product_model.dart';
import '../widgets/product_bottom_action_bar.dart';
import '../widgets/product_color_selector.dart';
import '../widgets/product_description_section.dart';
import '../widgets/product_image_header.dart';
import '../widgets/product_info_header.dart';
import '../widgets/product_ratings_row.dart';
import '../widgets/product_specifications_section.dart';

/// Screen displaying exhaustive details, specs, color selection, and purchasing actions
/// for a selected product.
class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 0;
  int _selectedColorIndex = 0;
  bool _isFavorite = false;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomEcommerceAppBar(
        showBrandLogo: false,
        title: widget.product.name,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CartFloatingActionButton(
        count: _quantity,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Cart items: $_quantity'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomEcommerceBottomBar(selectedIndex: 0),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ProductImageHeader(
                  heroTag: 'product_image_${widget.product.id}',
                  imagePath: widget.product.image,
                ),
                ProductInfoHeader(product: widget.product),
                ProductRatingsRow(
                  rating: widget.product.rating,
                  satisfactionRate: widget.product.satisfactionRate,
                  reviewsCount: widget.product.reviewsCount,
                ),
                ProductColorSelector(
                  colors: widget.product.availableColors,
                  selectedIndex: _selectedColorIndex,
                  onColorSelected: (index) {
                    setState(() {
                      _selectedColorIndex = index;
                    });
                  },
                ),
                ProductDescriptionSection(
                  description: widget.product.description,
                ),
                ProductSpecificationsSection(
                  specifications: widget.product.specifications,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          ProductBottomActionBar(
            quantity: _quantity,
            onIncrement: _incrementQuantity,
            onDecrement: _decrementQuantity,
            isFavorite: _isFavorite,
            onToggleFavorite: _toggleFavorite,
            onBuyNow: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Purchased ${_quantity > 0 ? _quantity : 1}x ${widget.product.name}!',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
