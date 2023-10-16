// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:finplan/app/data/main_app_config.dart' as _i4;
import 'package:finplan/app/domain/app_config.dart' as _i3;
import 'package:finplan/feature/auth/data/firebase_auth_api.dart' as _i6;
import 'package:finplan/feature/auth/data/network_auth_repository.dart' as _i8;
import 'package:finplan/feature/auth/domain/auth_api.dart' as _i5;
import 'package:finplan/feature/auth/domain/auth_repository.dart' as _i7;
import 'package:finplan/feature/auth/domain/auth_state/auth_cubit.dart' as _i12;
import 'package:finplan/feature/operation/data/data_source/local_data_source.dart'
    as _i9;
import 'package:finplan/feature/operation/data/operation_repository_impl.dart'
    as _i11;
import 'package:finplan/feature/operation/domain/operation_repository.dart'
    as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';

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
    gh.singleton<_i3.AppConfig>(
      _i4.ProdAppConfig(),
      registerFor: {_prod},
    );
    gh.singleton<_i3.AppConfig>(
      _i4.DevAppConfig(),
      registerFor: {_dev},
    );
    gh.singleton<_i3.AppConfig>(
      _i4.TestAppConfig(),
      registerFor: {_test},
    );
    gh.singleton<_i5.AuthApi>(_i6.FirebaseAuthApi());
    gh.factory<_i7.AuthRepository>(
      () => _i8.NetworkAuthRepository(gh<_i5.AuthApi>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i9.LocalDataSource>(
      () => _i9.LocalDataSourceImpl(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i10.OperationRepository>(
      () => _i11.OperationRepositoryImpl(gh<_i9.LocalDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.singleton<_i12.AuthCubit>(_i12.AuthCubit(gh<_i7.AuthRepository>()));
    return this;
  }
}
