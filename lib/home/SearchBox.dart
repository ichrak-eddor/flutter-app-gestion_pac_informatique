import 'package:flutter/material.dart';
import 'home.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.size,
  }) : super(key: key) ;
  final Size size;

   @override
  Widget build(BuildContext context){
    return
      Container(
        margin:EdgeInsets.only(bottom: 20 *2.5) ,

        height: size.height * 0.2,
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.2 - 27,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),

                ),
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    ' ',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline5!
                        .copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold
                    ),
                  ),
                  Spacer(),
                  //Image.asset("assets/icon.png")
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Colors.red.withOpacity(0.59),
                      ),
                    ],
                  ),
                  child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                  color: Colors.red.withOpacity(0.5)
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              icon: Icon(Icons.search,
                                size: 20,
                                color: Colors.black12,),
                              // suffixIcon:

                              //SvgPicture.asset("assets/search.svg"),

                            ),

                          ),
                        ),
                      ]
                  ),
                )
            ),
          ],
        ),
      );
    // ],

    //),
    // );
  }
}

