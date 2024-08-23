import 'package:flutter/material.dart';
import 'package:gestion_pac_informatique/home/home.dart';
import 'package:gestion_pac_informatique/signin/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'authentication.dart';






class SignUpPage extends StatefulWidget {

const SignUpPage({Key? key}) : super(key: key);


@override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
 // final GlobalKey<FormState> _key = GlobalKey<FormState>();
  // final AuthenticationService _authenticationService = AuthenticationService();

//  final _key = GlobalKey<FormState>();

  TextEditingController _Username = new TextEditingController();

  TextEditingController _Email = new TextEditingController();

  TextEditingController _Password = new TextEditingController();

  TextEditingController _CIN = new TextEditingController();

  TextEditingController _numeroTel = new TextEditingController();

  TextEditingController _adresse = new TextEditingController();

  bool isLoading = false;

/*
  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'name'),
      validator: (value){
        if (value!.isEmpty){
          return ' Name is Required';
        }else
          return null;

      },
    );
  }

 */


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    final _key = GlobalKey<FormState>();
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
        body:
        isLoading ? Center(
          child: Container(
            height: size.height / 20,
            width: size.height / 20,
            child: CircularProgressIndicator(),
          ),
        )
             : SingleChildScrollView(

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
                            color: Colors.grey[700]),)


                    ],
                  ),


                     Column(



                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Username",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87
                          ),

                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(

/*
                          validator: ( value){
                            if ( value.isEmpty){
                              return 'cannt be empty' ;
                            }else
                              return null;
                          },

 */


                          controller: _Username,






                          obscureText: false,
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
                    ),



                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                        ),

                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: _Email,
                        obscureText: false,
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
                  ),
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                        ),

                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: _Password,
                        obscureText: true,
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
                  ),

                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Confirme password",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                        ),

                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(

                        obscureText: true,
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
                  ),

                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "CIN",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                        ),

                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: _CIN,
                        obscureText: false,
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
                  ),
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Numero de telephone",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                        ),

                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: _numeroTel,
                        obscureText: false,
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
                  ),
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Adresse",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                        ),

                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: _adresse,
                        obscureText: false,
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
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                        FirebaseFirestore.instance
                            .collection("accounts")
                            .add({
                          "Username": _Username.text,
                          "Email": _Email.text,
                          "password": _Password.text,
                          "CIN": _CIN.text,
                          "numero de telephone": _numeroTel.text,
                          "adresse": _adresse.text,


                        });

                        context.read<AuthenticationService>().signUp(

                            _Username.text,
                            _Email.text,
                            _Password.text,
                            _CIN.text,
                            _adresse.text,
                            _numeroTel.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));

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
                        child: Text("login",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => LoginPage()));
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