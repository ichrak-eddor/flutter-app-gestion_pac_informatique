import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestion_pac_informatique/home/detailPages/Detail.dart';
import 'package:gestion_pac_informatique/home/detailPages/DetailPc.dart';
import 'package:gestion_pac_informatique/home/detailPages/DetailSim.dart';
import 'package:gestion_pac_informatique/home/title.dart';
import 'package:gestion_pac_informatique/home/map.dart';
import 'package:gestion_pac_informatique/pages/materiaux.dart';
import 'package:gestion_pac_informatique/screens/AddPage.dart';
import 'package:gestion_pac_informatique/screens/Addpage2.dart';
import 'package:gestion_pac_informatique/screens/addproduct.dart';
import 'package:gestion_pac_informatique/screens/history.dart';
import 'package:gestion_pac_informatique/signin/authentication.dart';
import 'package:gestion_pac_informatique/signin/login.dart';
import 'package:provider/provider.dart';
import 'package:gestion_pac_informatique/main.dart';


//import 'package:flutter_svg/flutter_svg.dart';

import 'SearchBox.dart';
import 'detailPages/DetailModem.dart';
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(


        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.red,


        title: Text(' Home Page',
          style: TextStyle(
              color: Colors.black),),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuPage()));

          }, icon: Icon(Icons.menu),

            color: Colors.black,),

        ],
      ),
      body: Body(),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MapPage()));
        },
        backgroundColor: Colors.red,

        child: Icon(Icons.add_location),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.red,
        boxShadow: [
          BoxShadow(
          offset: Offset(0, -10),
          blurRadius: 35,
          color: Colors.red.withOpacity(0.38),
        ),
        ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddProduct()));
            },
                icon: Icon(Icons.add_circle_outline,color: Colors.white)),
            IconButton(onPressed: (){
              context.read<AuthenticationService>().signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));


            },
                icon: Icon(Icons.login,color: Colors.white)),
            IconButton(onPressed: (){
             // Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));


            },
                icon: Icon(Icons.account_circle_outlined,color: Colors.white,)),
          ],
        ),
      ),


    );
  }
}



  class Body extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;

      return SingleChildScrollView(

        child: Column(

            children: <Widget>[
            SearchBox(size: size),
              Titledk( title: "materieaux",),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
              child: Row(

                children: <Widget>[


                Tab(image: "assets/tablette.jpg",
              title: "tablettte",
              model:"4G" ,
                //press: () {

                 // Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail()));
                //},
                  press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail()));
                  },
                ),
                  Tab(image: "assets/pc.jpg",
                    title: "pc",
                    model:"bureau" ,
                    press: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPc()));

                    },
                  ),

                  Tab(image: "assets/flybox.png",
                    title: "modem",
                    model:"xxxxx" ,
                    press: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailMod()));


                    },
                  ),

                  Tab(image: "assets/sim.jpg",
                    title: "Cart Sim",
                    model:"xxxxx" ,
                    press: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailSim()));

                    },
                  ),



                 ]    )),
              Titledk(title: "centre de vaccination"),

             SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
              child :Row (
                  children: <Widget>[
                  CentreVaccination(image: "assets/menzah.jpg",press: (){},
              ),
                    CentreVaccination(image: "assets/menzah.jpg",press: (){},
                    ),
        ]
              )


             ), ], ),

      );


    }
  }





class CentreVaccination extends StatelessWidget {


  const CentreVaccination ({
    Key? key, required this.image, required this.press,
   // required this.size
  }) : super(key: key) ;
  //final Size size;
  final String image;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      GestureDetector(

        onTap: press,
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
            top: 20 / 2,
            bottom: 20 / 2,
          ),
          width: size.width * 0.8,
          height: 185,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image))
          ),
        ),
      );
  }}






class Tab extends StatelessWidget {
  const Tab({
    Key? key,
    required this.image,
    required this.title,
    required this.model,
  //  required this.DateSortie,
    required this.press,

  }) : super(key: key);

 final String image, title, model;
// final int DateSortie;
 final void Function () press;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Container(

        margin: EdgeInsets.only(
          left: 20,
          top: 20 / 2,
          bottom: 20 * 2.5,

        ),
        width: size.width * 0.4,
        child: Column(
          children: <Widget>[
            Image.asset(image),
            GestureDetector(
              onTap: press,
               child: Container(
                padding: EdgeInsets.all(20 / 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.red.withOpacity(0.23),

                    ),
                  ],

                ),
                child: Row(
                  children: <Widget>[
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme
                              .of(context)
                              .textTheme
                              .button,

                        ),
                        TextSpan(
                          text: "$model",
                          style: TextStyle(
                              color: Color(0xFFE5404E).withOpacity(0.5)
                          ),
                        ),

                      ],

                    ),
                    ),
                    Spacer(),
                    Text(
                      ' ',
                      style: Theme
                          .of(context)
                          .textTheme
                          .button!
                          .copyWith(color: Color(0xFFE5404E)),

                    )
                  ],
                ),


              ),
            )
          ],
        ),
      );
  }

}






