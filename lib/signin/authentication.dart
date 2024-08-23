
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';





class AuthenticationService {
  final FirebaseAuth firebaseAuth;

  AuthenticationService(this.firebaseAuth);

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }


  // Future<void> signOut() async {
  //await _firebaseAuth.signOut();
  //}

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }



  Future<String?> signUp(String Username , String email,  String password ,String CIN , String adresse, String numero) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}




  /*

Future<User?> createAccount( String Username, String Email, String password, String CIN , String adresse)
async{
  FirebaseAuth _auth = FirebaseAuth.instance;

  //FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    User user = (await _auth.createUserWithEmailAndPassword(
        email: Email, password: password))
     .user ;

    if(user != null) {
      print("Accout created succesfull");
      return user ;
    } else{
      print("Account creation failed");
      return user;
    }


    //print("Account created Succesfull");

   // userCrendetial.user!.updateDisplayName(Username);
/*
    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      "name": Username,
      "email": Email,
      "status": "Unavalible",
      "uid": _auth.currentUser!.uid,
    });

    return userCrendetial.user;

 */
  } catch (e) {
    print(e);
    return null;
  }
}


   */






