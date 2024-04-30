// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;
import 'package:oydeeedashboard/src/core/core.dart' as _i3;
import 'package:oydeeedashboard/src/core/di/register_modules.dart' as _i10;
import 'package:oydeeedashboard/src/core/network/auth_interceptor.dart' as _i6;
import 'package:oydeeedashboard/src/core/network/device_interceptor.dart'
    as _i4;
import 'package:oydeeedashboard/src/core/network/network_info.dart' as _i7;
import 'package:oydeeedashboard/src/core/network/token_service.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.singleton<_i3.AppRouter>(() => registerModules.router);
    gh.lazySingleton<_i4.DeviceInterceptor>(() => _i4.DeviceInterceptor());
    gh.lazySingleton<_i5.TokenService>(() => _i5.TokenService());
    gh.lazySingleton<_i6.AuthInterceptor>(
        () => _i6.AuthInterceptor(gh<_i5.TokenService>()));
    gh.lazySingleton<_i7.NetworkInfo>(
        () => _i7.NetworkInfoImpl(gh<_i8.InternetConnectionChecker>()));
    gh.lazySingleton<_i9.Dio>(() => registerModules.dio(
          gh<_i4.DeviceInterceptor>(),
          gh<_i6.AuthInterceptor>(),
        ));
    return this;
  }
}

class _$RegisterModules extends _i10.RegisterModules {}
