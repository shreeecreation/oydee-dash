// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:oydeeedashboard/src/core/core.dart' as _i3;
import 'package:oydeeedashboard/src/core/di/register_modules.dart' as _i12;
import 'package:oydeeedashboard/src/core/network/auth_interceptor.dart' as _i7;
import 'package:oydeeedashboard/src/core/network/device_interceptor.dart'
    as _i4;
import 'package:oydeeedashboard/src/core/network/network_info.dart' as _i6;
import 'package:oydeeedashboard/src/core/network/token_service.dart' as _i5;
import 'package:oydeeedashboard/src/features/dashboard/bloc/get_feed_cubit.dart'
    as _i10;
import 'package:oydeeedashboard/src/features/dashboard/dashboard.dart' as _i11;
import 'package:oydeeedashboard/src/features/dashboard/domain/repository/dashboard_repository.dart'
    as _i9;

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
    gh.lazySingleton<_i6.NetworkInfo>(() => const _i6.NetworkInfoImpl());
    gh.lazySingleton<_i7.AuthInterceptor>(
        () => _i7.AuthInterceptor(gh<_i5.TokenService>()));
    gh.lazySingleton<_i8.Dio>(() => registerModules.dio(
          gh<_i4.DeviceInterceptor>(),
          gh<_i7.AuthInterceptor>(),
        ));
    gh.lazySingleton<_i9.FeedRemoteSource>(() => _i9.FeedRemoteSourceImpl(
          gh<_i8.Dio>(),
          gh<_i6.NetworkInfo>(),
        ));
    gh.factory<_i10.FeedCubit>(
        () => _i10.FeedCubit(gh<_i11.FeedRemoteSource>()));
    return this;
  }
}

class _$RegisterModules extends _i12.RegisterModules {}
