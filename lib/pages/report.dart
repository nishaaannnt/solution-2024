import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  final List<int> answers;
  const Report({super.key, required this.answers});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final int score = 68;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Report',
          ),
        centerTitle: true,
        backgroundColor: Colors.purple.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Possiblity of ASD : $score%',
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 25.0),
              Image.asset(
                'assets/icons/report.jpg', // Ensure this path is correct
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Error loading image'); // Handle error gracefully
                },
              ),
              const SizedBox(height: 20.0),

              // Depression section (blue box)
              _buildInfoBox(
                color: Colors.purple.shade200,
                title: 'Depression:',
                content: '''
People with autism are four times more likely to experience depression than those who are neurotypical. One of the strongest predictors of depression is loneliness. Since individuals high in the autism spectrum are more at risk of isolating themselves, they may have more depression triggers.'''
              ),

              // Fixations section (yellow box)
              _buildInfoBox(
                title: 'Fixations:',
                content: '''
Many people with autism spectrum disorders have difficulties in dealing with change. As a consequence, they often have routines that they feel that they need to follow. Adhering to these rituals and routines tends to make them feel more in control of their environment. They also usually have special interests that they feel they must tend to, which they experience as fundamental to their well-being.''',
                color: Colors.white,
              ),

              // Abnormal/Flat Speech section (green box)
              _buildInfoBox(
                title: 'Abnormal/Flat Speech:',
                content: '''
Individuals with autism generally speak differently from most people. They may talk in a flat or exaggerated way or speak in clipped bursts. This relates to the general difficulties people with autism spectrum disorders experience in understanding metaphors, social cues, and the subtexts of certain words.''',
                color: Colors.purple.shade200,
              ),
              _buildInfoBox(
                title: 'Noise Sensitivity:',
                content: '''
 One common symptom experienced by people with autism spectrum disorders is intense sensitivity to sound. Autism spectrum individuals may be easily overwhelmed by noises as well as other environmental stimuli such as abnormal temperatures or lights.''',
                color: Colors.white,
              ),
              _buildInfoBox(
                title: 'Social Difficulty:',
                content: '''
Many individuals on the autism spectrum feel challenged when it comes to making or engaging friends and may be overwhelmed by uncertain social situations. This disposition is often related to their difficulties with reading non-verbal communication, or, conversely, to their own adherence to fixed routines or tendency towards flat speech.''',
                color: Colors.purple.shade200,
              ),
              _buildInfoBox(
                title: 'Anxiety',
                content: '''
Individuals with autism often develop irrational fears or phobias, social anxiety, and separation anxiety. They may struggle with intense levels of stress due to their sensory sensitivities and/or difficulties adapting to changes in their routines. Individuals high in Social Anxiety may also develop a fear of negative reactions from their peers.''',
                color: Colors.white,
              ),
              _buildInfoBox(
                title: 'Abnormal Posture',
                content: '''
Individuals on the autism spectrum often struggle with a reduced perception of their bodily movements. As a result, they may have difficulties with their motor coordination or postural orientation. These tendencies may further exacerbate their social isolation.''',
                color: Colors.purple.shade200,
              ),
              _buildInfoBox(
                title: 'Poor Eye Contact:',
                content: '''
 One of the hallmarks of autism is the tendency to avoid eye contact. Individuals on the autism spectrum often find that maintaining eye contact causes them stress. Due to the overwhelming sensory input many experience, many individuals with autism would rather look at something else, such as static objects or another person’s shoes.''',
                color: Colors.white,
              ),
              _buildInfoBox(
                title: 'Tics and Fidgets:',
                content: '''
Individuals with autism may experience motoric and somatic tics such as head movements, excessive blinking, or twitching. They may also struggle with vocal tics, such as repeating words or phrases. Finally, some find it challenging to keep still, and they constantly feel the urge to fidget.''',
                color: Colors.purple.shade200,
              ),
              _buildInfoBox(
                title: 'Aggression:',
                content: '''
Some individuals with autism may be prone to aggression in the form of hitting objects or things, destroying property, and/or throwing temper tantrums. This is especially likely to occur for those individuals with autism who cannot speak well, as this is another way of communicating their needs.''',
                color: Colors.white,
              ),

              // Add similar _buildInfoBox calls for Noise Sensitivity and other sections with different colors
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox({required String title, required String content, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        surfaceTintColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7.0),
              Text(
                content,
                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
