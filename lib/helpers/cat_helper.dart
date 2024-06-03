import 'package:flutter_application_task13/models/category_m.dart';

class CategoriesHelpers{
  List<Category> parseCategories(List<Map<String, dynamic>> categoriesList){
    final categories = <Category>[];
    categoriesList.forEach((categoryMap) {
      final cat = Category.fromJson(categoryMap);
      categories.add(cat);
     });
     return categories;
  }
}