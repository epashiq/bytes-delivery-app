import 'package:bytes_delivery_app/features/catgegory/data/model/category_model.dart';
import 'package:bytes_delivery_app/general/failures/main_failures.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoryFacade {
  Future<Either<MainFailure,List<Category>>> fetchCategory(String value, String? categoryId, int page)async{
    throw UnimplementedError('fetchCategory() not implemented');
  }
  Future<Either<MainFailure,List<Product>>> fetchProduct(String value, String? categoryId, int page)async{
    throw UnimplementedError('fetchProduct() not implemented');
  }
 
}