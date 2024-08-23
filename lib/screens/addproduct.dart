import 'package:flutter/material.dart';
import 'package:gestion_pac_informatique/home/home.dart';
import 'package:gestion_pac_informatique/screens/AddPage.dart';
import 'package:gestion_pac_informatique/screens/addpage3.dart';

import 'Addpage2.dart';
import 'CarteSim.dart';
import 'history.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(


        ////elevation: 0,
        // brightness: Brightness.light,
        backgroundColor: Colors.red,
        title: Text('            Add Product',
          style: TextStyle(
              color: Colors.black),),
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Icon(Icons.arrow_back_ios
            ,
            size: 20,
            color: Colors.black,),


        ),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuPage()));
          }, icon: Icon(Icons.menu),

            color: Colors.black,),

        ],
      ),
      body:  Column(
        children: [
          RaisedButton(
            onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPage()));
            },
            color: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
             child: Center(child: Text('choose a tablet'),),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPage2()));
            },
            color: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Center(child: Text('choose a computer'),),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPage3()));
            },
            color: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Center(child: Text('choose a flybox'),),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CarteSim()));
            },
            color: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Center(child: Text('choisir une carte sim'),),
          ),
        ],
      ),
    );
  }
}
