import 'package:bytes_delivery_app/features/catgegory/data/i_category_facade.dart';
import 'package:bytes_delivery_app/features/catgegory/data/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final ICategoryFacade iCategoryFacade;
  CategoryProvider({required this.iCategoryFacade});

  List<Category> _categories = [];
  List<Product> _products = [];
  bool _isLoading = false;
  String? _selectedCategoryId;
  int _currentPage = 1;
  bool _hasMorePages = true;
  String? _error;

  // Getters
  List<Category> get categories => _categories;
  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get selectedCategoryId => _selectedCategoryId;
  int get currentPage => _currentPage;
  bool get hasMorePages => _hasMorePages;
  String? get error => _error;

  // Initialize with categories and products
  Future<void> initialize(String value) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Fetch categories first
      final categoryResult = await iCategoryFacade.fetchCategory(value, null, 1);

      await categoryResult.fold(
        (failure) async {
          _error = failure.errorMessage;
          _isLoading = false;
          notifyListeners();
        },
        (categories) async {
          _categories = categories;
          
          if (categories.isNotEmpty) {
            Category selectedCategory = categories.firstWhere(
              (category) => category.isSelected,
              orElse: () => categories.first,
            );
            
            _selectedCategoryId = selectedCategory.id;
            
            final productResult = await iCategoryFacade.fetchProduct(
              value,
              selectedCategory.id,
              1,
            );

            productResult.fold(
              (failure) {
                _error = failure.errorMessage;
                _isLoading = false;
              },
              (products) {
                _products = products;
                _currentPage = 1;
                _hasMorePages = products.isNotEmpty;
                _isLoading = false;
              },
            );
          } else {
            _isLoading = false;
          }
          notifyListeners();
        },
      );
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> selectCategory(String value, String categoryId) async {
    if (_selectedCategoryId == categoryId) return;
    
    _isLoading = true;
    _selectedCategoryId = categoryId;
    _currentPage = 1;
    _hasMorePages = true;
    _products = []; 
    notifyListeners();
    
    _categories = _categories.map((category) {
      return category.copyWith(
        isSelected: category.id == categoryId,
      );
    }).toList();
    
    final result = await iCategoryFacade.fetchProduct(value, categoryId, 1);
    
    result.fold(
      (failure) {
        _error = failure.errorMessage;
        _isLoading = false;
      },
      (products) {
        _products = products;
        _currentPage = 1;
        _hasMorePages = products.isNotEmpty;
        _isLoading = false;
      },
    );
    notifyListeners();
  }

  Future<void> loadMore(String value) async {
    if (_isLoading || !_hasMorePages || _selectedCategoryId == null) return;
    
    _isLoading = true;
    notifyListeners();
    
    final result = await iCategoryFacade.fetchProduct(
      value, 
      _selectedCategoryId!, 
      _currentPage + 1,
    );
    
    result.fold(
      (failure) {
        _error = failure.errorMessage;
        _isLoading = false;
      },
      (newProducts) {
        _products = [..._products, ...newProducts];
        _currentPage += 1;
        _hasMorePages = newProducts.isNotEmpty;
        _isLoading = false;
      },
    );
    notifyListeners();
  }
}


