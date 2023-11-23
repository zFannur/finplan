abstract class AppCategoriesRepository {
  Future<List<String>> get(String key);
  Future<void> delete(String category, String key);
  Future<void> add(String category, String key);
  Future<void> addList(List<String> selectedCategories, String key);
  Future<void> edit(String category, String key);
}