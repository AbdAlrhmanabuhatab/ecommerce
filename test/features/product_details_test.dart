import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce2/core/theme/app_theme.dart';
import 'package:ecommerce2/features/home/data/models/product_model.dart';
import 'package:ecommerce2/features/product_details/presentation/screens/product_details_screen.dart';

void main() {
  testWidgets(
    'ProductDetailsScreen increments and decrements quantity correctly',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.5;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      const testProduct = ProductModel(
        id: 'test_product',
        name: 'Wireless Earbuds',
        price: 99.0,
        image: 'images/headphone.png',
        rating: 4.6,
        reviewsCount: 88,
      );

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          builder: (context, child) => MaterialApp(
            theme: AppTheme.lightTheme,
            home: const ProductDetailsScreen(product: testProduct),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify initial counter is 0
      expect(find.text('0'), findsAtLeastNWidgets(1));

      // Tap increment (+)
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Verify counter became 1
      expect(find.text('1'), findsAtLeastNWidgets(1));

      // Tap decrement (-)
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pumpAndSettle();

      // Verify counter returned to 0
      expect(find.text('0'), findsAtLeastNWidgets(1));
    },
  );
}
