import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_practice/data/products.dart';
import 'package:my_riverpod_practice/models/product_model.dart';

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super(productItems);
}

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  return ProductNotifier();
});
