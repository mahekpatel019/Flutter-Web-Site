import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../widgets/product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    int crossAxisCount;
    double childAspectRatio;
    double padding;

    if (size.width > 1200) {
      crossAxisCount = 4;
      childAspectRatio = 0.75;
      padding = 24.0;
    } else if (size.width > 900) {
      crossAxisCount = 3;
      childAspectRatio = 0.72;
      padding = 20.0;
    } else if (size.width > 600) {
      crossAxisCount = 2;
      childAspectRatio = 0.8;
      padding = 16.0;
    } else {
      crossAxisCount = 1;
      childAspectRatio = 1.1;
      padding = 12.0;
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: crossAxisCount == 1 ? 12 : 16,
              crossAxisSpacing: 16,
              childAspectRatio: childAspectRatio,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
                isCompact: size.width <= 600,
              );
            },
          ),
        ),
      ),
    );
  }
}
