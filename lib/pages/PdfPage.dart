/*

// sign up page
import 'package:flutter/material.dart';
import 'package:gestion_pac_informatique/home/home.dart';
import 'package:gestion_pac_informatique/signin/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';



class SignUp extends StatelessWidget {


  TextEditingController _Username = new TextEditingController();
  TextEditingController _Email = new TextEditingController();
  TextEditingController _Password = new TextEditingController();
  TextEditingController _CIN = new TextEditingController();
  TextEditingController _numeroTel = new TextEditingController();
  TextEditingController _adresse = new TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          //height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),),
                  SizedBox(height: 20,),
                  Text("Create an account, It's free ",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)


                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "Username"),
                  inputFile1(label: "Email"),
                  inputFile2(label: "Password", obscureText: true),
                  inputFile4(label: "Confirm Password ", obscureText: true),
                  inputFile3(label: "CIN"),
                  inputFile5(label: "numéro de téléphone"),
                  inputFile6(label: "adresse"),

                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),



                    )

                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                    FirebaseFirestore.instance
                        .collection("accounts")
                        .add({
                      "Username":_Username,
                      "Email":_Email,
                      "password":_Password,
                      "CIN":_CIN,
                      "numero de telephone":_numeroTel,
                      "adresse":_adresse,

                    } );
                  },
                  color: Color(0xfff53645),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: Text(
                    "Sign up", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,

                  ),
                  ),

                ),



              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  /* Text(" Login", style:TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18

                  ),
                  ),
                  */
                  FlatButton(
                    //padding: EdgeInsets.only(left: 0.0),
                    child: Text("login", style: TextStyle(fontWeight: FontWeight.w600)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    },
                  ),
                ],
              )



            ],

          ),


        ),

      ),

    );
  }
}



// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})

{
  TextEditingController _Username = new TextEditingController();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller:  _Username ,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blueGrey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}


Widget inputFile1({label, obscureText = false})
{
  TextEditingController _Email = new TextEditingController();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: _Email ,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blueGrey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}




Widget inputFile2({label, obscureText = false})
{
  TextEditingController _Password = new TextEditingController();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: _Password ,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blueGrey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}



Widget inputFile3({label, obscureText = false})
{
  TextEditingController _CIN = new TextEditingController();


  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: _CIN ,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blueGrey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}



Widget inputFile5({label, obscureText = false})
{

  TextEditingController _numeroTel = new TextEditingController();


  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: _numeroTel ,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blueGrey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}



Widget inputFile6({label, obscureText = false})
{

  TextEditingController _adresse = new TextEditingController();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: _adresse ,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blueGrey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}



Widget inputFile4({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(

        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blueGrey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}

 */

