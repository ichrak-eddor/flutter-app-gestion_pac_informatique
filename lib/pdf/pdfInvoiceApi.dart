//import 'dart:html';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:gestion_pac_informatique/pdf/PdfApi.dart';
import 'package:gestion_pac_informatique/pdf/invoice.dart';
import 'PdfApi.dart';
import 'package:pdf/widgets.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';



class PdfInvoiceApi {
  static Future < File > generate(Invoice invoice) async{
    final pdf = Document();
    final imagePng = (await rootBundle.load('assets/loogoSante.png')).buffer.asUint8List();
    final imagePng2 = (await rootBundle.load('assets/bottom.png')).buffer.asUint8List();

    pdf.addPage(MultiPage(
      build: (context) => [
        pw.Image(pw.MemoryImage(imagePng)),
        pw.Divider(),
        buildTitle(invoice),
        buildInvoice(invoice),
        buildPag(invoice),
        buildSignature(invoice),
        buildDirection(invoice),


        pw.Divider(),
        pw.Image(pw.MemoryImage(imagePng2)),

      ]
    ));


    
return PdfApi.saveDocument(name: 'bon_de_sortie.pdf', pdf: pdf) ;



  }
   static pw.Widget buildTitle(Invoice invoice) => pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        '               Bon de Sortie N° ............. ',
        style: pw.TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Text("Directiondes Soins de Santé de Base."),
     pw.SizedBox(height: 0.3 * PdfPageFormat.cm),




      pw.Text("Région a livrer :  "),
      pw.SizedBox(height: 0.3 * PdfPageFormat.cm),

      pw.Text("Date:"),
      pw.SizedBox(height: 0.3 * PdfPageFormat.cm),
      ],
   );


      /*
      buildInvoiceInfo(invoice.info),

    ],
  );
  static pw.Widget buildInvoiceInfo(InvoiceInfo info) {

    final titles = <String>[
       'Region a livrer  ',
      ' Date',


    ];
    final data = <String>[
      info.location,
      info.date,


    ];

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 200);
      }),
    );


  }

       */




  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    pw.TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? pw.TextStyle(fontWeight: FontWeight.bold);

    return pw.Container(
      width: width,
      child: pw.Row(
        children: [
          pw.Expanded(child: pw.Text(title, style: style)),
          pw.Text(value, style: unite ? style : null),
        ],
      ),
    );
  }




  static pw.Widget buildInvoice(Invoice invoice) {
    final headers = [
      'ref',
      'Designation',
      'Quantity',
      'Numero de Serie',
      'Chargeur',

    ];
    final data = invoice.items.map((item) {


      return [
        '${item.Ref}',
        item.Designation,
        '${item.Quantite}',
        item.NumeroDeSerie,
        '${item.Chargeur} ',

      ];
    }).toList();

    return pw.Table.fromTextArray(
      headers: headers,
      data: data,
      //border: null,
      headerStyle: pw.TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: pw.BoxDecoration(color: PdfColors.indigo100),
      cellHeight: 30,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.centerRight,
        4: pw.Alignment.centerRight,
        5: pw.Alignment.centerRight,
      },
    );
  }

  static pw.Widget buildPag(Invoice invoice) => pw.Column(

    children: [
      pw.Text(
        ' Les équipements mentionnés dans le tableau ci-dessus sont livrés dans le cadre de la campagne de vaccination contre le COVID-19',
        //style: pw.TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      pw.SizedBox(height: 0.3 * PdfPageFormat.cm),

    // pw.Text("Le(s) soussigné(s) s engagent a traiter le matériel avec soin a veiller a ce qu il soit déposé en un lieu sur "),
      //pw.SizedBox(height: 0.1* PdfPageFormat.cm),
pw.Text(' Le(s) soussigné(s) s engagent a traiter le matériel avec soin a veiller a ce qu il soit déposé en un lieu sûr  et à le restituer dans son intégralité à la sous-direction des soins de santé de base de la région après achèvement de la campagne de vaccination. '),
      pw.SizedBox(height: 0.3 * PdfPageFormat.cm),

      pw.Text("Le(s) soussigné(s) assument toute responsabilité en cas de dommages ou de détérioration. "),
      pw.SizedBox(height: 0.3 * PdfPageFormat.cm),


    ],
  );

  static pw.Widget buildSignature(Invoice invoice)  {
    return pw.Container(
     // alignment: pw.Alignment.centerRight ,
      child: pw.Row(
        children : [
         pw.Expanded(
           flex: 5,
           child: pw.Column(
             crossAxisAlignment: pw.CrossAxisAlignment.start,
             children: [
               pw.Text('Centre Informatique  Ministère de la Santé',
           style: pw.TextStyle(fontSize:10, fontWeight: FontWeight.bold)),
               pw.Text('        Point Focal :',
                   style: pw.TextStyle(fontSize:10, fontWeight: FontWeight.bold)),
               pw.Text('	               Signature',
                   style: pw.TextStyle(fontSize:10, fontWeight: FontWeight.bold)),


             ]
           )
         ),
        pw.Spacer(flex: 1),


          pw.Expanded(
              flex: 4,
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Direction des Soins de Santé de Base',
                        style: pw.TextStyle(fontSize:10, fontWeight: FontWeight.bold)),
                    pw.Text('       Directrice :',
                        style: pw.TextStyle(fontSize:10, fontWeight: FontWeight.bold)),
                    pw.Text('            Signature',
                        style: pw.TextStyle(fontSize:10, fontWeight: FontWeight.bold)),


                  ]
              )
          ),

        ]
      )
    );


  }
  static pw.Widget buildDirection(Invoice invoice)  =>
  pw.Center(
     child:   pw.Column (
      //crossAxisAlignment: pw.CrossAxisAlignment.center,
    ////  children: [

         //  pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text('Direction Régionale de la Santé',
                      style: pw.TextStyle(fontSize:10, fontWeight: FontWeight.bold)),
                  pw.Text('Nom et prénom: ',
                      style: pw.TextStyle(fontSize:10, fontWeight: FontWeight.bold)),
                  pw.Text('CIN :',
                      style: pw.TextStyle(fontSize:10, fontWeight: FontWeight.bold)),
                  pw.Text('Signature',
                      style: pw.TextStyle(fontSize:10, fontWeight: FontWeight.bold)),



                ]
           // ),

    //  ]
      ));


}