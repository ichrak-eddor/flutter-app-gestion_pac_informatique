import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_pac_informatique/home/home.dart';
import 'package:gestion_pac_informatique/screens/addpage3.dart';
import 'package:gestion_pac_informatique/screens/history.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailMod extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),

        title: Text('                Detail Page',
          style: TextStyle(
              color: Colors.black),),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuPage()));

          }, icon: Icon(Icons.menu),

            color: Colors.black,),

        ],
      ),

      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height *  .5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/modem.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height *  .6 ,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      offset:  Offset(0, -4),
                      blurRadius: 8,
                    )
                  ]
              ),
              child: Column(
                children: [
                  Text("Modeme",
                    style: GoogleFonts.ptSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black

                    ),),
                  Text("modele disponible: ",style: TextStyle(fontSize: 15),),

                  Container(
                      child: CupertinoButton(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.red,
                          child: Text(' Add'),


                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPage3()));

                          }
                      ) )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
