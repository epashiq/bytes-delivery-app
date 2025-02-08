import 'package:bytes_delivery_app/general/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt sl = GetIt.instance;

@InjectableInit(
  initializerName : 'init',
  preferRelativeImports : true,
  asExtension : false,
)

Future<void> configureDependency()async{
   init(sl,environment:Environment.prod);
}