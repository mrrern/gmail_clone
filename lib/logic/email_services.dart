import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gmail_clone/routes/imports.dart';

class EmailServices {

  Future<List<EmailModel>> getEmails() async{
    final response = await rootBundle.loadString('asset/data.json');
    final data = await  json.decode(response) as List;
    return data.map((json) => EmailModel.fromJson(json)).toList() ;
  }

}

// provider es para utilizar el servicio
final queMeDijiste = Provider<EmailServices>((ref) => EmailServices(),);

// provder para leer los datos
final leemeLosDatos = FutureProvider<List<EmailModel>>((ref) {
return ref.watch(queMeDijiste).getEmails();
});