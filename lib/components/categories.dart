import 'package:flutter/material.dart';
import 'package:solution/models/category_model.dart';

class Categories extends StatelessWidget {
  final List<CategoryModel> list;

  const Categories({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Explore More',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 5),

        Container(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: List.generate(list.length, (index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 4,
                    surfaceTintColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          list[index].iconPath,
                          height: 90,
                          width: 90,
                        ),
                        const SizedBox(height: 5),
                        Expanded(
                          child: Text(
                            list[index].name,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
