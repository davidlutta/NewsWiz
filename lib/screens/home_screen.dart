import 'package:flutter/material.dart';
import 'package:newswiz/constants.dart';
import 'package:newswiz/screens/news_screen.dart';
import 'package:newswiz/widgets/widget.dart';
const PATH = 'images/';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Categories',
                  style: kDisplayTextStyle2,
                ),
              ),
              CategoryCard(
                image: AssetImage('${PATH}politicsBack.jpg'),
                myFunction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsScreen(category: 'politics',)));
                },
                text: 'Politics',
              ),
              CategoryCard(
                image: AssetImage('${PATH}businessBack.jpg'),
                myFunction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsScreen(category: 'business',)));
                },
                text: 'Business',
              ),
              CategoryCard(
                image: AssetImage('${PATH}healthBack.jpg'),
                myFunction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsScreen(category: 'health',)));
                },
                text: 'Health',
              ),
              CategoryCard(
                image: AssetImage('${PATH}entertainmentBack.jpg'),
                myFunction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsScreen(category: 'showbiz',)));
                },
                text: 'Entertainment',
              ),
              CategoryCard(
                image: AssetImage('${PATH}scienceBack.jpg'),
                myFunction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsScreen(category: 'science',)));
                },
                text: 'Science',
              ),
              CategoryCard(
                image: AssetImage('${PATH}techBack.jpg'),
                myFunction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsScreen(category: 'technology',)));
                },
                text: 'Technology',
              ),
              CategoryCard(
                image: AssetImage('${PATH}sportsBack.jpg'),
                myFunction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsScreen(category: 'sports',)));
                },
                text: 'Sports',
              ),
              const SizedBox(height: 10.0,)
            ],
          ),
        ),
      ),
    );
  }
}


