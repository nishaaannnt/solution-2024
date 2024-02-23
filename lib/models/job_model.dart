class JobModel {
  String imagePath;
  String title;
  String description;

  JobModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
  static List<JobModel> getJobs() {
    List<JobModel> jobs = [];

    jobs.add(
      JobModel(
        imagePath: 'assets/icons/community.png',
        title: 'Office Clerk',
        description: 'AB Solutions, Mumbai',
      ),
    );
    jobs.add(
      JobModel(
        imagePath: 'assets/icons/call.png',
        title: 'Accounting',
        description: 'HHM, Pune',
      ),
    );
    jobs.add(
      JobModel(
        imagePath: 'assets/icons/money.png',
        title: 'IT support',
        description: 'Schweikart, Bangalore',
      ),
    );
    jobs.add(
      JobModel(
        imagePath: 'assets/icons/connect.png',
        title: 'Cashier',
        description: 'Mesa Verde, Chennai',
      ),
    );
    return jobs;
  }
}
