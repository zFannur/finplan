// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:finplan/app/data/app_categories_repository_impl.dart' as _i5;
import 'package:finplan/app/data/data_source/app_categories_local_data_source.dart'
    as _i3;
import 'package:finplan/app/data/main_app_config.dart' as _i7;
import 'package:finplan/app/domain/app_categories_repository.dart' as _i4;
import 'package:finplan/app/domain/app_config.dart' as _i6;
import 'package:finplan/app/domain/state/categories/categories_cubit.dart'
    as _i12;
import 'package:finplan/feature/auth/data/auth_repository_impl.dart' as _i11;
import 'package:finplan/feature/auth/data/firebase_auth_api.dart' as _i9;
import 'package:finplan/feature/auth/domain/auth_api.dart' as _i8;
import 'package:finplan/feature/auth/domain/auth_repository.dart' as _i10;
import 'package:finplan/feature/auth/domain/auth_state/auth_cubit.dart' as _i21;
import 'package:finplan/feature/finance/data/data_source/plan_local_data_source.dart'
    as _i17;
import 'package:finplan/feature/finance/data/plan_repository_impl.dart' as _i19;
import 'package:finplan/feature/finance/domain/plan_repository.dart' as _i18;
import 'package:finplan/feature/finance/domain/usecase/plan_usecase.dart'
    as _i20;
import 'package:finplan/feature/operation/data/data_source/opeartion_local_data_source.dart'
    as _i13;
import 'package:finplan/feature/operation/data/operation_repository_impl.dart'
    as _i15;
import 'package:finplan/feature/operation/domain/operation_repository.dart'
    as _i14;
import 'package:finplan/feature/operation/domain/usecase/operation_usecase.dart'
    as _i16;
import 'package:finplan/feature/operation/ui/bloc/operation_cubit/operation_cubit.dart'
    as _i22;
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
    gh.factory<_i3.AppCategoriesLocalDataSource>(
      () => _i3.AppCategoriesLocalDataSourceImpl(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i4.AppCategoriesRepository>(
      () => _i5.AppCategoriesRepositoryImpl(
          gh<_i3.AppCategoriesLocalDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.singleton<_i6.AppConfig>(
      _i7.ProdAppConfig(),
      registerFor: {_prod},
    );
    gh.singleton<_i6.AppConfig>(
      _i7.DevAppConfig(),
      registerFor: {_dev},
    );
    gh.singleton<_i6.AppConfig>(
      _i7.TestAppConfig(),
      registerFor: {_test},
    );
    gh.singleton<_i8.AuthApi>(_i9.FirebaseAuthApi());
    gh.factory<_i10.AuthRepository>(
      () => _i11.AuthRepositoryImpl(gh<_i8.AuthApi>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.singleton<_i12.CategoriesCubit>(
        _i12.CategoriesCubit(gh<_i4.AppCategoriesRepository>()));
    gh.factory<_i13.OperationLocalDataSource>(
      () => _i13.AOperationLocalDataSourceImpl(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i14.OperationRepository>(
      () => _i15.OperationRepositoryImpl(gh<_i13.OperationLocalDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i16.OperationUseCase>(
      () => _i16.OperationUseCaseImpl(gh<_i14.OperationRepository>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i17.PlanLocalDataSource>(
      () => _i17.PlanLocalDataSourceImpl(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i18.PlanRepository>(
      () => _i19.PlanRepositoryImpl(gh<_i17.PlanLocalDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i20.PlanUseCase>(
      () => _i20.PlanUseCaseImpl(gh<_i18.PlanRepository>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.singleton<_i21.AuthCubit>(_i21.AuthCubit(gh<_i10.AuthRepository>()));
    gh.singleton<_i22.OperationCubit>(
        _i22.OperationCubit(gh<_i16.OperationUseCase>()));
    return this;
  }
}
