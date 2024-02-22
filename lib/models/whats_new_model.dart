class WhatsNew {
  String content;
  String iconPath;
  String url;

  WhatsNew({
    required this.content,
    required this.iconPath,
    required this.url
  });

  static List < WhatsNew > getInfo() {
    List < WhatsNew > info = [];
    List < String > content = ['Putting Your Toddler in Front of the TV? You Might Hurt Their Ability to ...',
    'Enlarged Spaces in Infant Brains Linked to Higher Risk of Autism, Sleep Problems ...',
    'Protein-Protein Interaction Discovery Unveils Down Syndrome Molecular...',
    'The Pedigree of Brain Cells..'];
    List < String > icons = ['assets/icons/news.jpg',
    'assets/icons/news2.jpg',
    'assets/icons/news3.jpg',
    'assets/icons/news4.jpg'];
    List < String > urls = ['https://www.sciencedaily.com/releases/2024/01/240108125727.htm',
    'https://www.sciencedaily.com/releases/2024/01/240102142019.htm',
    'https://www.sciencedaily.com/releases/2023/12/231219124438.htm',
    'https://www.sciencedaily.com/releases/2023/12/231213112446.htm'];

    for(int i = 0; i < content.length; i++)
    {
      info.add(
        WhatsNew(content: content[i], iconPath: icons[i], url: urls[i])
      );
    }
    return info;
  }
}