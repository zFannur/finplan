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
    as _i25;
import 'package:finplan/feature/auth/data/auth_repository_impl.dart' as _i11;
import 'package:finplan/feature/auth/data/firebase_auth_api.dart' as _i9;
import 'package:finplan/feature/auth/domain/auth_api.dart' as _i8;
import 'package:finplan/feature/auth/domain/auth_repository.dart' as _i10;
import 'package:finplan/feature/auth/domain/auth_state/auth_cubit.dart' as _i20;
import 'package:finplan/feature/finance/data/data_source/plan_local_data_source.dart'
    as _i16;
import 'package:finplan/feature/finance/data/plan_repository_impl.dart' as _i18;
import 'package:finplan/feature/finance/domain/plan_repository.dart' as _i17;
import 'package:finplan/feature/finance/domain/usecase/plan_usecase.dart'
    as _i19;
import 'package:finplan/feature/finance/ui/bloc/plan_cubit/finance_plan_cubit.dart'
    as _i21;
import 'package:finplan/feature/operation/data/data_source/opeartion_local_data_source.dart'
    as _i12;
import 'package:finplan/feature/operation/data/operation_repository_impl.dart'
    as _i14;
import 'package:finplan/feature/operation/domain/operation_repository.dart'
    as _i13;
import 'package:finplan/feature/operation/domain/usecase/operation_usecase.dart'
    as _i15;
import 'package:finplan/feature/operation/ui/bloc/operation_cubit/operation_cubit.dart'
    as _i23;
import 'package:finplan/feature/settings/domain/usecase/import_export_usecase.dart'
    as _i22;
import 'package:finplan/feature/settings/ui/bloc/settings_cubit.dart' as _i24;
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
    gh.factory<_i12.OperationLocalDataSource>(
      () => _i12.AOperationLocalDataSourceImpl(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i13.OperationRepository>(
      () => _i14.OperationRepositoryImpl(gh<_i12.OperationLocalDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i15.OperationUseCase>(
      () => _i15.OperationUseCaseImpl(gh<_i13.OperationRepository>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i16.PlanLocalDataSource>(
      () => _i16.PlanLocalDataSourceImpl(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i17.PlanRepository>(
      () => _i18.PlanRepositoryImpl(gh<_i16.PlanLocalDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i19.PlanUseCase>(
      () => _i19.PlanUseCaseImpl(gh<_i17.PlanRepository>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.singleton<_i20.AuthCubit>(_i20.AuthCubit(gh<_i10.AuthRepository>()));
    gh.singleton<_i21.FinancePlanCubit>(_i21.FinancePlanCubit(
      gh<_i19.PlanUseCase>(),
      gh<_i15.OperationUseCase>(),
    ));
    gh.factory<_i22.ImportExportUseCase>(
      () => _i22.ImportExportUseCase(gh<_i15.OperationUseCase>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.singleton<_i23.OperationCubit>(
        _i23.OperationCubit(gh<_i15.OperationUseCase>()));
    gh.singleton<_i24.SettingsCubit>(_i24.SettingsCubit(
      gh<_i22.ImportExportUseCase>(),
      gh<_i15.OperationUseCase>(),
    ));
    gh.singleton<_i25.CategoriesCubit>(_i25.CategoriesCubit(
      gh<_i4.AppCategoriesRepository>(),
      gh<_i15.OperationUseCase>(),
      gh<_i19.PlanUseCase>(),
      gh<_i21.FinancePlanCubit>(),
    ));
    return this;
  }
}
