import 'dart:developer';

import 'package:bytes_delivery_app/features/catgegory/data/i_category_facade.dart';
import 'package:bytes_delivery_app/features/catgegory/data/model/category_model.dart';
import 'package:bytes_delivery_app/general/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ICategoryFacade)
class ICategoryImpl implements ICategoryFacade {
  final Dio dio;
  static const String baseUrl = 'https://alpha.bytesdelivery.com/api/v3';

  ICategoryImpl({required this.dio});

  @override
  Future<Either<MainFailure, List<Category>>> fetchCategory(
    String value,
    String? categoryId,
    int page,
  ) async {
    try {
      final response = await dio.get(
        '$baseUrl/product/category-products/$value/${categoryId ?? 'null'}/$page',
      );

      log('Category API Response: ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final responseData = response.data as Map<String, dynamic>;
        
        if (responseData['success'] == true &&
            responseData['data'] != null &&
            responseData['data']['categories'] != null) {
          final categoriesJson = responseData['data']['categories'] as List<dynamic>;
          
          final categories = categoriesJson
              .map((category) => Category.fromJson(category as Map<String, dynamic>))
              .toList();

          log('Parsed ${categories.length} categories');
          return right(categories);
        } else {
          log('Invalid response format: missing categories data');
          return const Left(MainFailure.serverFailure(
            errorMessage: 'Invalid response format: missing categories data',
          ));
        }
      } else {
        log('Server error: ${response.statusCode}');
        return const Left(MainFailure.serverFailure(
          errorMessage: 'Server error occurred',
        ));
      }
    
    } catch (e) {
      log('Unexpected error: $e');
      return Left(MainFailure.serverFailure(
        errorMessage: 'An unexpected error occurred: $e',
      ));
    }
  }

  @override
  Future<Either<MainFailure, List<Product>>> fetchProduct(
    String value,
    String? categoryId,
    int page,
  ) async {
    try {
      final response = await dio.get(
        '$baseUrl/product/category-products/$value/${categoryId ?? 'null'}/$page',
      );

      log('Product API Response: ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final responseData = response.data as Map<String, dynamic>;
        
        if (responseData['success'] == true &&
            responseData['data'] != null &&
            responseData['data']['products'] != null) {
          final productsJson = responseData['data']['products'] as List<dynamic>;
          
          final products = productsJson
              .map((product) => Product.fromJson(product as Map<String, dynamic>))
              .toList();

          log('Parsed ${products.length} products');
          return right(products);
        } else {
          log('Invalid response format: missing products data');
          return const Left(MainFailure.serverFailure(
            errorMessage: 'Invalid response format: missing products data',
          ));
        }
      } else {
        log('Server error: ${response.statusCode}');
        return const Left(MainFailure.serverFailure(
          errorMessage: 'Server error occurred',
        ));
      }
    }  catch (e) {
      log('Unexpected error: $e');
      return Left(MainFailure.serverFailure(
        errorMessage: 'An unexpected error occurred: $e',
      ));
    }
  }
}
