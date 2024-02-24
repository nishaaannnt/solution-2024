class QWidget
{
  int id;
  String question;
  bool isYes;
  bool isNo;

  QWidget({
    required this.id,
    required this.question,
    required this.isYes,
    required this.isNo
  });

  static List<QWidget> getAll()
  {
    List<QWidget> questions = [];
    List<String> qdata = ['Does your child look at you when you call his/her name?',
    'Is it easy for you to get eye contact with your child?',
    'Does your child point to indicate that s/he wants something? (e.g. a toy that is out of reach)',
    'Does your child point to share interest with you? (e.g. poin9ng at an interesing sight)',
    'Does your child pretend? (e.g. care for dolls, talk on a toy phone)',
    'Does your child follow where you’re looking?',
    'If you or someone else in the family is visibly upset, does your child show signs of wanting to comfort them? (e.g. stroking hair, hugging them)',
    "Did your child's first words follow a typical developmental pattern? ",
    'Does your child use simple gestures? (e.g. wave goodbye) ',
    'Does your child stare at nothing with no apparent purpose? '
    ];

    for(int i=0; i<10; i++)
    {
      questions.add(
        QWidget(
          id: i+1,
          question: qdata[i],
          isYes: false,
          isNo: false
        )
      );
    }

    return questions;
  }
}