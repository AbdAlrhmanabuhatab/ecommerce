import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce2/features/home/data/models/product_model.dart';

void main() {
  group('ProductModel Tests', () {
    test('formats price correctly with no decimals when whole number', () {
      const product = ProductModel(
        id: '1',
        name: 'Test Product',
        price: 150.0,
        image: 'images/shoes.png',
      );

      expect(product.formattedPrice, '150\$');
    });

    test('formats price correctly with decimals when fractional', () {
      const product = ProductModel(
        id: '2',
        name: 'Fractional Product',
        price: 99.95,
        image: 'images/shoes.png',
      );

      expect(product.formattedPrice, '99.95\$');
    });

    test('parses from raw map correctly and handles dollar signs', () {
      final map = {
        'id': 'prod_123',
        'product': 'Sneaker Pro',
        'price': '120\$',
        'image': 'images/shoes.png',
        'rating': 4.8,
        'reviewsCount': 250,
      };

      final product = ProductModel.fromMap(map);

      expect(product.id, 'prod_123');
      expect(product.name, 'Sneaker Pro');
      expect(product.price, 120.0);
      expect(product.rating, 4.8);
      expect(product.reviewsCount, 250);
      expect(product.formattedPrice, '120\$');
    });

    test('copyWith updates specified fields while retaining others', () {
      const original = ProductModel(
        id: 'prod_1',
        name: 'Old Name',
        price: 50.0,
        image: 'images/shoes.png',
      );

      final updated = original.copyWith(name: 'New Name', price: 75.0);

      expect(updated.id, 'prod_1');
      expect(updated.name, 'New Name');
      expect(updated.price, 75.0);
      expect(updated.image, 'images/shoes.png');
    });
  });
}
