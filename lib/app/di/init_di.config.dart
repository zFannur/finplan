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
    as _i27;
import 'package:finplan/feature/auth/data/auth_repository_impl.dart' as _i11;
import 'package:finplan/feature/auth/data/firebase_auth_api.dart' as _i9;
import 'package:finplan/feature/auth/domain/auth_api.dart' as _i8;
import 'package:finplan/feature/auth/domain/auth_repository.dart' as _i10;
import 'package:finplan/feature/auth/domain/auth_state/auth_cubit.dart' as _i23;
import 'package:finplan/feature/experience/data/data_source/habit_local_data_source.dart'
    as _i12;
import 'package:finplan/feature/experience/data/habit_repository_impl.dart'
    as _i14;
import 'package:finplan/feature/experience/domain/habit_repository.dart'
    as _i13;
import 'package:finplan/feature/finance/data/data_source/plan_local_data_source.dart'
    as _i19;
import 'package:finplan/feature/finance/data/plan_repository_impl.dart' as _i21;
import 'package:finplan/feature/finance/domain/plan_repository.dart' as _i20;
import 'package:finplan/feature/finance/domain/usecase/plan_usecase.dart'
    as _i22;
import 'package:finplan/feature/finance/ui/bloc/plan_cubit/finance_plan_cubit.dart'
    as _i24;
import 'package:finplan/feature/operation/data/data_source/opeartion_local_data_source.dart'
    as _i15;
import 'package:finplan/feature/operation/data/operation_repository_impl.dart'
    as _i17;
import 'package:finplan/feature/operation/domain/operation_repository.dart'
    as _i16;
import 'package:finplan/feature/operation/domain/usecase/operation_usecase.dart'
    as _i18;
import 'package:finplan/feature/settings/domain/usecase/import_export_usecase.dart'
    as _i25;
import 'package:finplan/feature/settings/ui/bloc/settings_cubit.dart' as _i26;
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
    gh.factory<_i12.HabitLocalDataSource>(
      () => _i12.HabitLocalDataSourceImpl(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i13.HabitRepository>(
      () => _i14.HabitRepositoryImpl(gh<_i12.HabitLocalDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i15.OperationLocalDataSource>(
      () => _i15.AOperationLocalDataSourceImpl(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i16.OperationRepository>(
      () => _i17.OperationRepositoryImpl(gh<_i15.OperationLocalDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i18.OperationUseCase>(
      () => _i18.OperationUseCaseImpl(gh<_i16.OperationRepository>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i19.PlanLocalDataSource>(
      () => _i19.PlanLocalDataSourceImpl(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i20.PlanRepository>(
      () => _i21.PlanRepositoryImpl(gh<_i19.PlanLocalDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i22.PlanUseCase>(
      () => _i22.PlanUseCaseImpl(gh<_i20.PlanRepository>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.singleton<_i23.AuthCubit>(_i23.AuthCubit(gh<_i10.AuthRepository>()));
    gh.singleton<_i24.FinancePlanCubit>(_i24.FinancePlanCubit(
      gh<_i22.PlanUseCase>(),
      gh<_i18.OperationUseCase>(),
    ));
    gh.factory<_i25.ImportExportUseCase>(
      () => _i25.ImportExportUseCase(gh<_i18.OperationUseCase>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.singleton<_i26.SettingsCubit>(_i26.SettingsCubit(
      gh<_i25.ImportExportUseCase>(),
      gh<_i18.OperationUseCase>(),
    ));
    gh.singleton<_i27.CategoriesCubit>(_i27.CategoriesCubit(
      gh<_i4.AppCategoriesRepository>(),
      gh<_i18.OperationUseCase>(),
      gh<_i22.PlanUseCase>(),
      gh<_i24.FinancePlanCubit>(),
    ));
    return this;
  }
}
