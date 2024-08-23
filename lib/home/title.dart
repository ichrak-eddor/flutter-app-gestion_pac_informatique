import 'package:flutter/material.dart';

class Titledk extends StatelessWidget {
  const Titledk({
    Key? key,
    required this.title,
  }): super(key: key);
final String title;


  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(

          children: <Widget> [
            CustomLine(text: title),
            Spacer(),

            FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.red,
                onPressed:(){},
                child: Text("More", style: TextStyle(color: Colors.white),))


          ],
        ),
      );

  }
}



class  CustomLine extends StatelessWidget {
  const CustomLine ({
    Key? key,
    required this.text
  }) : super(key: key) ;
  final String text;

  @override
  Widget build(BuildContext context){
    return

      Container(
        height: 24,
        child: Stack(
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.only(left: 20.0 /4),
              child: Text(
                text,
                //"les centres de vaccination",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(


                    margin: EdgeInsets.only(right: 20.0/4),
                    child: Container(
                      height: 7,
                      color: Colors.black.withOpacity(0.2),)
                )

            )
          ],
        ),

      );

  }
}
