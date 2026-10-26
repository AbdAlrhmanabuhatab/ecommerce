import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/cart_floating_action_button.dart';
import '../../../../core/widgets/custom_ecommerce_app_bar.dart';
import '../../../../core/widgets/custom_ecommerce_bottom_bar.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../product_details/presentation/screens/product_details_screen.dart';
import '../../data/datasources/mock_data_source.dart';
import '../../data/models/product_model.dart';
import '../widgets/category_list_view.dart';
import '../widgets/product_card.dart';
import '../widgets/promo_banner.dart';
import '../widgets/search_bar_widget.dart';

/// Main home screen showcasing search, categories carousel, promotional banner,
/// and featured products grid.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _searchController;
  int _selectedBottomNavIndex = 0;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ProductModel> get _filteredProducts {
    if (_searchQuery.trim().isEmpty) {
      return MockDataSource.products;
    }
    return MockDataSource.products.where((product) {
      return product.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  void _navigateToProductDetails(ProductModel product) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomEcommerceAppBar(
        onNotificationTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('No new notifications')));
        },
        onFavoriteTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('3 items in your wishlist')),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CartFloatingActionButton(
        count: 3,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Viewing shopping cart')),
          );
        },
      ),
      bottomNavigationBar: CustomEcommerceBottomBar(
        selectedIndex: _selectedBottomNavIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 4.h),

          // Search Field
          SearchBarWidget(
            controller: _searchController,
            onChanged: (query) {
              setState(() {
                _searchQuery = query;
              });
            },
          ),
          SizedBox(height: 12.h),

          // Categories Section
          SectionHeader(title: 'Categories', onActionTap: () {}),
          SizedBox(height: 12.h),
          CategoryListView(
            categories: MockDataSource.categories,
            onCategorySelected: (category) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected category: ${category.name}')),
              );
            },
          ),

          // Promotional Banner
          PromoBanner(onTap: () {}),
          SizedBox(height: 8.h),

          // Featured Products Section Header
          SectionHeader(title: 'Featured products', onActionTap: () {}),
          SizedBox(height: 12.h),

          // Products Grid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _filteredProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 0.82,
              ),
              itemBuilder: (context, index) {
                final product = _filteredProducts[index];
                return ProductCard(
                  product: product,
                  onTap: () => _navigateToProductDetails(product),
                  onAddToCart: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.name} added to cart!'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
