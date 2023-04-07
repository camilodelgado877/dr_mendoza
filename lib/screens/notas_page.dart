import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dr_mendoza/services/appstate.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dr_mendoza/models/nota.dart';

import '../models/UserServices.dart';

class homeNotas extends StatefulWidget{
  const homeNotas({Key? key}) : super(key: key);

  @override
  State<homeNotas> createState() => notas_page();
}
class notas_page extends  State<homeNotas>{
  List <Nota> misNotas =[];
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();
  final firebase=FirebaseFirestore.instance;

   validarDatos() async{
    try{
      CollectionReference ref= FirebaseFirestore.instance.collection('Notas');
      QuerySnapshot notas = await ref.get();


      if(notas.docs.length !=0){
        for(var cursor in notas.docs){
          misNotas.add(Nota(titulo:cursor.get('titulo'), contenido: cursor.get('contenido')));
        }

      }else{
        print('no hay documentos en la colección');
      }

    }catch(e){
      print('Error....'+e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
            drawer: Drawer(
              child: Container(
                color: Color.fromARGB(31, 202, 80, 80),
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(top: 50, bottom: 50),
                      child: Image.asset("assets/icon/perfil.png"),
                    ),
                    const Text(
                      "Dra. María Paula Mendoza",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 80),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      color: Colors.grey[100],
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'pageHorario');
                          },
                          child: const Text(
                            "Horario",
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      color: Colors.grey[100],
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'notas_page');
                          },
                          child: const Text(
                            "Notas",
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      color: Colors.grey[100],
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'Cocina_page');
                          },
                          child: const Text(
                            "Cocina",
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      color: Colors.grey[100],
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'mensajes_page');
                          },
                          child: const Text(
                            "Mensajes",
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              title: const Text('Notas'),
              actions: [IconButton(onPressed: (){ setState(() {
                
              });}, icon: const Icon(Icons.refresh),),],
            ),
            backgroundColor: Colors.white,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return ModalNuevaNota();
                    });
              },
              child: const Icon(Icons.add),
            ),
            body: FutureBuilder(
              future: UserServices().getNotas(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                List misNotas = snapshot.data ??[];
                return ListView(
                  children: [
                    for(Nota nota in misNotas)
                      ListTile(
                        title: Text(nota.titulo),
                        subtitle: Text(nota.contenido),
                      )
                  ],
                );
              },)
            )
      ],
    );
  }
}

class ModalNuevaNota extends StatefulWidget {
  const ModalNuevaNota({
    Key? key,
  }) : super(key: key);
  

  @override
  State<ModalNuevaNota> createState() => _ModalNuevaNotaState();
}

class _ModalNuevaNotaState extends State<ModalNuevaNota> {
  final TextEditingController _tituloController = TextEditingController();

  final TextEditingController _contenidoController = TextEditingController();
  late CollectionReference notesRef;
  final firebase=FirebaseFirestore.instance;
  registroNotas() async{
    try{
      await firebase.collection('Notas').doc().set(
        {
          'titulo': _tituloController.text,
          'contenido': _contenidoController.text,

        }
      );
    }catch (e){
      print("error"+e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: Form(
        child: SingleChildScrollView(
            child: Column(
          children: [
            TextFormField(
              controller: _tituloController,
              decoration: const InputDecoration(labelText: 'Titulo de la nota'),
            ),
            TextFormField(
              controller: _contenidoController,
              decoration: const InputDecoration(labelText: 'Contenido'),
              maxLines: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    registroNotas();
                    ScaffoldMessenger.of(context).showSnackBar(
                      
                        SnackBar(content: Text('Nota Agregada correctamente')));
                  },
                  child: const Text('Aceptar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }

  @override
  void dispose() {
    _contenidoController.dispose();
    _tituloController.dispose();
    super.dispose();
  }

}
