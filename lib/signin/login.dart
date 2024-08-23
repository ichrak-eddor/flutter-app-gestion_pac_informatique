import 'package:flutter/material.dart';
import 'package:gestion_pac_informatique/main.dart';
import 'package:provider/provider.dart';
import 'authentication.dart';
import 'package:gestion_pac_informatique/signin/sign%20up.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:gestion_pac_informatique/home/home.dart';
//import 'package:gestion_pac_informatique/main.dart';
import 'package:gestion_pac_informatique/screens/welcome.dart';





  
  
  
  
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _key = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
           // Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()) );
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body : isLoading?  Center(
        child: Container(
          height: size.height / 20,
          width: size.height / 20,
          child: CircularProgressIndicator(),
        ),
      )
          : Container(
           height: MediaQuery.of(context).size.height,
            width: double.infinity,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Login",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("Login to your account",
                      style: TextStyle(
                          fontSize: 15,
                          color:Colors.grey[700]),)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Email"),
                      inputFil(label: "Password", obscureText: true)

                    ],
                  ),
                ),
                Padding(padding:
                EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
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

                         context.read<AuthenticationService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),


                        );



                        /*
                        final String email = emailController.text.trim();
                      final String password = passwordController.text.trim();

                       if(email.isEmpty){
                      print("Email is Empty");
                        } else {
                     if(password.isEmpty){
                     print("Password is Empty");
                        } else {
                      context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                       password: passwordController.text.trim());

                       }
                      }

                         */
                   },
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));

                      color: Color(0xfff53645),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Text(
                        "Login", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,

                      ),
                      ),

                    ),
                  ),
                ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
               FlatButton(
                // padding: EdgeInsets.all(0.0),
                 child: Text("Forgot password?",
                 style: TextStyle(fontWeight: FontWeight.w300)),
                 onPressed: () {

//                Navigator.pushReplacementNamed(context, '/reset-password');
                   },
                ),
               FlatButton(
                 //padding: EdgeInsets.only(left: 0.0),
                child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.w600)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                  },
                   ),
               ],
               )







              ],
            ))
          ],
        ),
      ),
    );
  }
}




// we will be creating a widget for text field
//String  _email,  _password;
//final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

Widget inputFile({label, obscureText = false})

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

        controller: emailController,
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
                borderSide: BorderSide(color: Colors.red)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}



Widget inputFil({label, obscureText = false})
{
  final _formKey = GlobalKey<FormState>();
  //final GlobalKey<FormState> _Key = new GlobalKey<FormState>();
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,

     // crossAxisAlignment: CrossAxisAlignment.start,
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
          controller: passwordController,
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
                  borderSide: BorderSide(color: Colors.red)
              )
          ),
          /*
          validator: (value){
            if (value.isEmpty) {
              return 'verifier votre emeil';
            }
          },

           */
        ),



        SizedBox(height: 10,)
      ],

  );
}



/*
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());}

class App  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,)
      ],
      child: MaterialApp(

        home: AuthenticationWrapper(),
      ),
    );
  }

}

 */

/*   ),)
                  ],
                ),

                  */

/* Container(
                  padding: EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(""),
                        fit: BoxFit.fitHeight
                    ),

                  ),
                )

                */


/*
class AuthenticationWrapper extends StatelessWidget {
/*  const AuthenticationWrapper({
    Key? key,

}) : super(key: key)

 */
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return LoginPage();
  }
}

 */