import '';


class Invoice {

//  final InvoiceInfo info;
  final List<InvoiceItem> items;

  const Invoice({

   // required this.info,
    required this.items,
  });
}
/*
class InvoiceInfo {
  final  location;
 // final String number;
  final  date;


  const InvoiceInfo({
    required this.location,
   // required this.number,
    required this.date,

  });
}

 */



  class InvoiceItem {
  final int Ref ;
  final String Designation;
  final int Quantite;
  final String NumeroDeSerie;
  final int Chargeur;




  const InvoiceItem({

    required this.Ref,
  required this.Designation,
  required this.NumeroDeSerie,
  required this.Quantite,
  required this.Chargeur,

  });
  }