import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_pac_informatique/home/home.dart';
import 'package:gestion_pac_informatique/pdf/PdfApi.dart';
import 'package:gestion_pac_informatique/pdf/invoice.dart';
import 'package:gestion_pac_informatique/pdf/pdfInvoiceApi.dart';
import 'package:gestion_pac_informatique/screens/addproduct.dart';
import 'package:gestion_pac_informatique/screens/history.dart';
import 'package:gestion_pac_informatique/screens/roundbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';




class AddPage2 extends StatefulWidget {
  const AddPage2({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage2> {

  TextEditingController _numeroSerie = new TextEditingController();
  TextEditingController _modele = new TextEditingController();


  DateTime? _dateTime;

  static const menuItems =<String>[
    'xxx1',
    'xxx2',
    'xxx3',
    'xxx4',

  ];

  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  )
      .toList();
  String? _btn1SelectedVal ;
  String? _btn2SelectedVal;
  String? _btn3SelectedVal;
  static const location =<String>[
    'Centre de vaccination de tunis',
    'Centre de vaccination de ariana',
    'Centre de vaccination de manouba',
    'Centre de vaccination de bizerte',
    'Centre de vaccination de ben arous',
    'Centre de vaccination de beja',
    'Centre de vaccination de jandouba',
    'Centre de vaccination de nabeul',
    'Centre de vaccination de Zaghouan',
    'Centre de vaccination de seliana',
    'Centre de vaccination de le kef',
    'Centre de vaccination de sousse',
    'Centre de vaccination de monastir',
    'Centre de vaccination de mahdia',
    'Centre de vaccination de kairouan',
    'Centre de vaccination de sfax',
    'Centre de vaccination de kasserine',
    'Centre de vaccination de sidi bou zid',
    'Centre de vaccination de Gafsa',
    'Centre de vaccination de Gabes',
    'Centre de vaccination de tozeur',
    'Centre de vaccination de kbili',
    'Centre de vaccination de medenine',
    'Centre de vaccination de tataouine',




  ];


  final List<DropdownMenuItem<String>> locationmenu = location
      .map(
        (String value) => DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  )
      .toList();



  int _counter = 0;

  increment(){
    setState(() {
      _counter++;
    });

  }
  decrement(){
    setState(() {
      _counter--;
    });
  }



  //final items= ['modele xxx1', 'xxx2', 'xxx3'];
  //String? value;
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(


        ////elevation: 0,
        // brightness: Brightness.light,
        backgroundColor: Colors.red,
        title: Text('            ordinateur',
          style: TextStyle(
              color: Colors.black),),
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddProduct()));
          },
          icon: Icon(Icons.arrow_back_ios
            ,
            size: 20,
            color: Colors.black,),


        ),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          }, icon: Icon(Icons.menu),

            color: Colors.black,),

        ],
      ),


      body: SingleChildScrollView(
       child :Container(
         padding: EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height - 20,
          width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // ignore: unnecessary_null_comparison
            Text(_dateTime == null ? 'nothing has been picked yet'
                : _dateTime.toString()),
            Expanded(
                flex: 3,
                child: Container(
                    alignment: Alignment.center,
                    child: Image(
                      height: 200,
                      alignment: Alignment.center,
                      image: AssetImage('assets/pc.jpg'),




                    )
                )),



            //  Expanded(
            //  flex: 1,


            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: const BorderRadius.all(Radius.circular(60)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  RoundIconBtn(

                    iconData: Icons.remove,
                    color: Colors.black38,
                    press: decrement,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40 / 4),
                    child: Text(
                      "$_counter",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                  ),
                  RoundIconBtn(
                    iconData: Icons.add,
                    color: Colors.black38,
                    press: increment,
                  ),
                ],

              ),
            ),

            //),



            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                color: Color(0xFFFDF0F0),
                child: Column(
                  children: <Widget>[

                    /*
                    ListTile(
                      title: const Text('mdele'),
                      trailing: DropdownButton<String>(
                        value: _btn1SelectedVal,
                        onChanged: (String? newValue) {
                          setState(() {
                            _btn1SelectedVal = newValue;
                          });
                        },
                        items: this._dropDownMenuItems,
                      ),
                    ),






                    ListTile(
                      title: const Text('reference'),
                      trailing: DropdownButton<String>(
                        value:  _btn2SelectedVal,
                        onChanged: (String? newValue) {
                          setState(() {
                            _btn2SelectedVal = newValue!;
                          });
                        },
                        items: this._dropDownMenuItems,
                      ),
                    ),
                     */


                    TextField(
                      controller: _numeroSerie,
                      decoration: InputDecoration(
                          hintText: "numéro de série",
                          labelText: "   reference",
                          labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder()
                      ),
                    ),







                    TextField(
                      controller: _modele,
                      decoration: InputDecoration(
                          hintText: "mdele",
                          labelText: "  modele",
                          labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder()
                      ),
                    ),

                    ListTile(
                      title: const Text('location'),
                      trailing: DropdownButton<String>(
                        value:  _btn3SelectedVal,
                        onChanged: (String? newValue) {
                          setState(() {
                            _btn3SelectedVal = newValue!;
                          });
                        },
                        items: this.locationmenu,
                      ),
                    ),


                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                      onPressed:(){
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2222),
                        ).then((date) {
                          setState(() {
                            _dateTime = date!;
                          });
                        }

                        );
                      },
                      child: const Text('Date Picker Dialog'),
                    )

                  ],),
              ),),


            Expanded(
              flex: 2,
              child: Container(
                  color: Color(0xFFFDF0F0),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {

                      FirebaseFirestore.instance
                          .collection("ordinateur")
                          .add({
                        "reference": _numeroSerie.text,
                        "modele" : _modele.text,
                        "date":_dateTime,
                        "location":_btn3SelectedVal,
                        "nombre de produit":_counter}) ;
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                      final invoice = Invoice(


                        items: [
                          InvoiceItem(
                            Ref: 1,
                            //  Designation:,
                            Designation:_modele.text,
                            Quantite: _counter,
                            NumeroDeSerie: _numeroSerie.text,
                            Chargeur: 04,

                          ),
                        ],








                      );

                      final file = await PdfInvoiceApi.generate(invoice);

                      PdfApi.openFile(file);
                    },
                    color: Color(0xfff53645),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),

                    ),
                    child: Text(
                      "Add", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,

                    ),
                    ),
                  )),

            ),],
        ),
      ),



      )  );









  }
}