part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.loaded(
    List<dynamic> list,
  ) = _CategoriesStateLoaded;

  const factory CategoriesState.allLoaded({
    List<dynamic>? category,
    List<dynamic>? underCategory,
  }) = _CategoriesStateAllLoaded;

  const factory CategoriesState.loading() = _CategoriesStateLoading;

  const factory CategoriesState.error(dynamic error) = _CategoriesStateError;

  factory CategoriesState.fromJson(Map<String, dynamic> json) =>
      _$CategoriesStateFromJson(json);
}
