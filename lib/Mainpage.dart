import 'dart:io';
import 'dart:math';

import 'package:e_commerce/ex.dart';
import 'package:e_commerce/profilepage.dart';
import 'package:e_commerce/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'Library.dart';
import 'catogories.dart';
import 'favorites.dart';
import 'options.dart';
import 'savedplaylist.dart';
import 'colors.dart';
import 'songslist.dart';
import 'Song.dart';
import 'package:provider/provider.dart';
import 'loginpage.dart';
import 'Extract.dart';


void main() {
  runApp(MaterialApp(
    home: Mainpagee(),
  ));
}
class Mainpagee extends StatefulWidget {
  static const String id = "mainpage_screen";

  @override
  State<Mainpagee> createState() => _MainpageeState();
}

class _MainpageeState extends State<Mainpagee> {
  var i=1;

  void changebanner() async {
    while(true){
      await new Future.delayed(Duration(seconds: 8));
      setState(() {
        i = Random().nextInt(7)+1;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changebanner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF1F2933),
      appBar: AppBar(
        backgroundColor:Color(0xFF323F4B),
        title: Text('MUSIC',
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFFF5F7FA),
          ),
        ),
        leading: IconButton(onPressed: (){Navigator.pushNamed(context, Options.id);},
          icon: Icon(
            Icons.menu,
            color: Color(0xFF9AA5B1),

          ),),
        actions: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/default_img.jpg'),
              ),

              border: Border.all(
                width: 4,
                color: Color(0xFF9AA5B1),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child:Column(
            children: [
              SizedBox(height: 25.0,),
              //search bar
              Container(
                child: Neumorphic(
                  margin: EdgeInsets.fromLTRB(30.0, 0  , 30, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText:'Search for ...',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF9AA5B1)),
                      ),
                      fillColor: Color(0xFF9AA5B1),
                      filled: true,
                      border: UnderlineInputBorder(),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xFFF5F7FA),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                    depth: -8,
                    lightSource: LightSource.topLeft,
                    color: Color(0xFF9AA5B1),
                  ),
                ),
              ),
              SizedBox(height: 25.0,),
              //top containers
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Stack(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset('images/banner $i.jpeg',
                              height:240.0 ,
                              width: 390.0,
                              fit: BoxFit.fill,

                            ),
                          ),


                        ),
                      ],
                    ),
                    SizedBox(width:15,),
                  ],
                ),
              ),
              //categories and view all buttons
              Row(
                children: [
                  SizedBox(height: 120.0,),
                  Container(
                    margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Icon(Icons.format_list_bulleted_sharp,
                      color: Color(0xFF9AA5B1),

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('Categories',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF5F7FA),

                      ),
                    ),
                  ),
                  SizedBox(width:60,),
                  Container(
                    child:Expanded(
                      child: RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Categories()));},
                        child: Text('View All',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF5F7FA),), ),
                        color: Color(0xFF52606D),
                        padding: EdgeInsets.only(top:10,bottom: 10),
                      ),
                    ),
                    padding: EdgeInsets.only(left: 40),
                  ),
                ],
              ),
              // geners
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 10,),
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Songlist()));},
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            height: 135.0,
                            width: 120.0,
                            child: Image.asset('images/default_img.jpg',height: 135.0,
                              width: 120.0,),
                          ),
                        ),
                        SizedBox(height: 10),
                        Positioned(
                          left: 25,
                          bottom: 0,
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lighttextboxcolor,
                            ),
                            padding: EdgeInsets.all(1),
                            child: Text('POP',

                              style: TextStyle(
                                color: lightfontcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Songlist()));
                            print(i);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 135.0,
                            width: 120.0,
                            child: Image.asset('images/default_img.jpg',height: 135.0,
                              width: 120.0,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Positioned(
                          left: 25,
                          bottom: 0,
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lighttextboxcolor,
                            ),
                            padding: EdgeInsets.all(1),
                            child: Text('PARTY',
                              style: TextStyle(
                                color: lightfontcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),


                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Songlist()));},
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 135.0,
                            width: 120.0,
                            child: Image.asset('images/default_img.jpg',height: 135.0,
                              width: 120.0,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Positioned(
                          left: 25,
                          bottom: 0,
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lighttextboxcolor,
                            ),
                            padding: EdgeInsets.all(1),
                            child: Text('DANCE',

                              style: TextStyle(
                                color: lightfontcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Songlist()));},
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 135.0,
                            width: 120.0,
                            child: Image.asset('images/default_img.jpg',height: 135.0,
                              width: 120.0,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Positioned(
                          left: 25,
                          bottom: 0,
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lighttextboxcolor,
                            ),
                            padding: EdgeInsets.all(1),
                            child: Text('HIP-HOP',

                              style: TextStyle(
                                color: lightfontcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Songlist()));},
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 135.0,
                            width: 120.0,
                            child: Image.asset('images/default_img.jpg',height: 135.0,
                              width: 120.0,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Positioned(
                          left: 25,
                          bottom: 0,
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lighttextboxcolor,
                            ),
                            padding: EdgeInsets.all(1),
                            child: Text('ROCK',
                              style: TextStyle(
                                color: lightfontcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Songlist()));},
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 135.0,
                            width: 120.0,
                            child: Image.asset('images/default_img.jpg',height: 135.0,
                              width: 120.0,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Positioned(
                          left: 25,
                          bottom: 0,
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lighttextboxcolor,
                            ),
                            padding: EdgeInsets.all(1),
                            child: Text('WORKOUT',
                              style: TextStyle(
                                color: lightfontcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ),
              SizedBox(height:25.0),
              Row(
                children: [
                  SizedBox(height: 120.0,),
                  Container(
                    margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Icon(Icons.format_list_bulleted_sharp,
                      color: Color(0xFF9AA5B1),

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('Songs',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF5F7FA),

                      ),
                    ),
                  ),
                  SizedBox(width:105,),
                  Container(
                    child:Expanded(
                      child: RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Categories()));},
                        child: Text('View All',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF5F7FA),), ),
                        color: Color(0xFF52606D),
                        padding: EdgeInsets.only(top:10,bottom: 10),
                      ),
                    ),
                    padding: EdgeInsets.only(left: 40),
                  ),
                ],
              ),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 10,),
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Songlist()));},
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            height: 135.0,
                            width: 120.0,
                            child: Image.asset('images/default_img.jpg',height: 135.0,
                              width: 120.0,),
                          ),
                        ),
                        SizedBox(height: 10),
                        Positioned(
                          left: 25,
                          bottom: 0,
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lighttextboxcolor,
                            ),
                            padding: EdgeInsets.all(1),
                            child: Text('SONG1',

                              style: TextStyle(
                                color: lightfontcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Songlist()));
                            print(i);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 135.0,
                            width: 120.0,
                            child: Image.asset('images/default_img.jpg',height: 135.0,
                              width: 120.0,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Positioned(
                          left: 25,
                          bottom: 0,
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lighttextboxcolor,
                            ),
                            padding: EdgeInsets.all(1),
                            child: Text('SONG2',
                              style: TextStyle(
                                color: lightfontcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),


                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Songlist()));},
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 135.0,
                            width: 120.0,
                            child: Image.asset('images/default_img.jpg',height: 135.0,
                              width: 120.0,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Positioned(
                          left: 25,
                          bottom: 0,
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lighttextboxcolor,
                            ),
                            padding: EdgeInsets.all(1),
                            child: Text('SONG3',

                              style: TextStyle(
                                color: lightfontcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Songlist()));},
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 135.0,
                            width: 120.0,
                            child: Image.asset('images/default_img.jpg',height: 135.0,
                              width: 120.0,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Positioned(
                          left: 25,
                          bottom: 0,
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lighttextboxcolor,
                            ),
                            padding: EdgeInsets.all(1),
                            child: Text('SONG4',

                              style: TextStyle(
                                color: lightfontcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Songlist()));},
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 135.0,
                            width: 120.0,
                            child: Image.asset('images/default_img.jpg',height: 135.0,
                              width: 120.0,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Positioned(
                          left: 25,
                          bottom: 0,
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lighttextboxcolor,
                            ),
                            padding: EdgeInsets.all(1),
                            child: Text('SONG5',
                              style: TextStyle(
                                color: lightfontcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Songlist()));},
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 135.0,
                            width: 120.0,
                            child: Image.asset('images/default_img.jpg',height: 135.0,
                              width: 120.0,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Positioned(
                          left: 25,
                          bottom: 0,
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lighttextboxcolor,
                            ),
                            padding: EdgeInsets.all(1),
                            child: Text('SONG6',
                              style: TextStyle(
                                color: lightfontcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ),
//playmusic bar(mad love)
              SizedBox(height: 100),


            ],
          ),
        ),
      ),

      bottomSheet: Container(
        color: playmusiccolor,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.0),
              height: 60.0,
              width: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/default_img.jpg',),
                ),
                border: Border.all(
                  width: 4,
                  color: Color(0xFF9AA5B1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: TextButton(
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Song()));},
                child: Text('Infinity',
                  style: TextStyle(

                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF5F7FA),
                  ),
                ),
              ),
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Icon(Icons.arrow_left,color: Color(0xFF9AA5B1),),
            ),
            ),
            Expanded(child:
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Icon(Icons.pause,color: Color(0xFF9AA5B1),),
            ),
            ),

            Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Icon(Icons.arrow_right,color: Color(0xFF9AA5B1),),
            ),
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Icon(Icons.close,color: Color(0xFF9AA5B1),),
            ),
            ),
          ],
        ),
      ),
      //bottom navigation bar
      bottomNavigationBar: Container(
        color: navigationbarcolor,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(

              icon: Icon(Icons.home, color: navigationbariconcolor),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Mainpagee()));

              },
            ),


            IconButton(

              icon: Icon(Icons.music_note, color: navigationbariconcolor),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Library()));

              },
            ),
            IconButton(

              icon: Icon(Icons.favorite, color: navigationbariconcolor),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Favorites()));

              },
            ),

            IconButton(

              icon: Icon(Icons.person, color: navigationbariconcolor),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profilepage()));

              },
            ),
          ],
        ),
      ),

    );

  }
}



