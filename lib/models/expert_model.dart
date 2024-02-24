class ExpertModel {
  String imagePath;
  String title;
  String description;

  ExpertModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
  static List<ExpertModel> getcontact() {
    List<ExpertModel> contact = [];

    contact.add(
      ExpertModel(
        imagePath: 'assets/icons/boy.svg',
        title: 'Om Chaurasiya',
        description: 'AB Solutions, Mumbai',
      ),
    );
     contact.add(
      ExpertModel(
        imagePath: 'assets/icons/girl.svg',
        title: 'Allena Morty',
        description: 'Schweikart, Bangalore',
      ),
    );
    contact.add(
      ExpertModel(
        imagePath: 'assets/icons/boy.svg',
        title: 'Rachit Pandey',
        description: 'HHM, Pune',
      ),
    );
    contact.add(
      ExpertModel(
        imagePath: 'assets/icons/boy.svg',
        title: 'Shreeyash Iyer',
        description: 'Mesa Verde, Chennai',
      ),
    );
    return contact;
  }
}
