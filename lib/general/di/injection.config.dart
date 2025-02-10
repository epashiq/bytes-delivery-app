// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/catgegory/data/i_category_facade.dart' as _i319;
import '../../features/catgegory/repo/i_category_impl.dart' as _i1011;
import 'injectable_module.dart' as _i109;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i361.Dio>(() => injectableModule.dio());
  gh.lazySingleton<_i319.ICategoryFacade>(
      () => _i1011.ICategoryImpl(dio: gh<_i361.Dio>()));
  return getIt;
}

class _$InjectableModule extends _i109.InjectableModule {}
