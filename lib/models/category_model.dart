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
      CategoryModel(iconPath: 'assets/icons/ngo.png', name: 'Find NGOs'),
      CategoryModel(iconPath: 'assets/icons/money.png', name: 'Find Jobs'),
      CategoryModel(iconPath: 'assets/icons/games.png', name: 'Games'),
      CategoryModel(iconPath: 'assets/icons/book.png', name: 'Know More'),
    ]);

    return categories;
 }
}