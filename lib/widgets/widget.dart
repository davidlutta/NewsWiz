import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final AssetImage image;
  final Function myFunction;
  final String text;
  CategoryCard({@required this.image,@required this.myFunction,@required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 16.0,
          right: 5.0,
          left: 5.0,
        ),
        child: GestureDetector(
          onTap: (){
            myFunction();
          },
          child: Container(
            height: 150.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: image,
                    repeat: ImageRepeat.noRepeat,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.91), BlendMode.dstATop)
                ),
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}