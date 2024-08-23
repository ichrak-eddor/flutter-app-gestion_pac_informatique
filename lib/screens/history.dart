import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestion_pac_informatique/home/home.dart';
import 'package:gestion_pac_informatique/pdf/PdfApi.dart';
import 'package:gestion_pac_informatique/pdf/invoice.dart';
import 'package:gestion_pac_informatique/pages/pdf.dart';
import 'package:gestion_pac_informatique/pdf/pdfInvoiceApi.dart';
import 'package:open_file/open_file.dart';
import 'AddPage.dart';





class MenuPage extends StatefulWidget {
// String  modele, numeroSerie;

 //MenuPage({required this.modele,required this.numeroSerie});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  static final String title = 'Invoice';
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


      ),
      /*

      body: Container(
       /* child: ListView(
          children: [
           ListTile(
             title: Text('Tablett'),
             subtitle: Text('modele: ${modele}'),

           ),
          ],
        ),

        */





        child: Center(
          child: CupertinoButton(
            borderRadius: BorderRadius.circular(24),
            color: Colors.red,
            child: Text(' save pdf'),


            onPressed: () async {
              final invoice = Invoice(


                items: [
                  InvoiceItem(
                    Ref: 02,
                //  Designation:,
                    Designation: 'Vega Tab 77',
                    Quantite: 04,
                    NumeroDeSerie: '${numeroSerie}',
                    Chargeur: 04,

                  ),
                  InvoiceItem(
                    Ref: 01,
                    Designation: 'Orange Tab 7 4G',
                    Quantite: 04,
                    NumeroDeSerie: 'OTAB466777',
                    Chargeur: 04,

                  ),
                  InvoiceItem(
                    Ref: 01,
                    Designation: 'SmartTab',
                    Quantite: 04,
                    NumeroDeSerie: 'OTAB466777',
                    Chargeur: 04,


                  ),
                  InvoiceItem(
                    Ref: 01,
                    Designation: 'lenovo Tab',
                    Quantite: 04,
                    NumeroDeSerie: 'OTAB466777',
                    Chargeur: 04,

                  ),

                ],
              );

              final file = await PdfInvoiceApi.generate(invoice);

              PdfApi.openFile(file);
            },
          ),
        ),




      ),

       */




    );
  }



}