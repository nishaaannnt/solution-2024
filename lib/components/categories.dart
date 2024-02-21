import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution/models/category_model.dart';

class Categories extends StatelessWidget {

  final List<CategoryModel> list;

  const Categories({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            height: 150,
            child: ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      width: 115,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: list[index].boxColor.withOpacity(0.75),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // circle
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(list[index].iconPath),
                            ),
                          ),
                          Text(
                            list[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ));
                }))
      ],
    );
  }
}