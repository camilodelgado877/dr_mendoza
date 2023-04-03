import 'package:cloud_firestore/cloud_firestore.dart';

import 'nota.dart';

class UserServices{
  Future<List<Nota>> getNotas() async{
    List<Nota> misNotas = [];
    try{
      QuerySnapshot notas = await (FirebaseFirestore.instance.collection('Notas')).get();
      if (notas.docs.length !=0){
        for(var cursor in notas.docs){
          Nota nuevaNota = Nota(titulo: cursor.get('titulo'), contenido: cursor.get('contenido'));
          misNotas.add(nuevaNota);
        }
        
      }
    }catch(e){
      return misNotas;
    }
    return misNotas;
  }
}