class CategoryModel 
{
  String name;
  String iconPath;

  CategoryModel({
    required this.iconPath,
    required this.name,
  });
 
 static List<CategoryModel> getCategories()
 {
    List<CategoryModel> categories = [];

    categories.addAll([
      CategoryModel(iconPath: 'assets/icons/connect.png', name: 'Take a Test'),
      CategoryModel(iconPath: 'assets/icons/call.png', name: 'Contact an Expert'),
      CategoryModel(iconPath: 'assets/icons/community.png', name: 'Join the Community'),
      CategoryModel(iconPath: 'assets/icons/school.png', name: 'Special Schools'),
    ]);

    return categories;
 }
}