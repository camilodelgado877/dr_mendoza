import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/fondo.jpg'),
                  fit: BoxFit.cover)),
        ),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                          Navigator.pushNamed(context, 'metas_page');
                        },
                        child: const Text(
                          "Metas",
                          style: TextStyle(fontSize: 20),
                        )
                        ),
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
            title: const Text('Dra. Mendoza'),
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.45,
                ),
                SizedBox(
                  width: size.width * 0.7,
                  child: const Text(
                    'MAPU',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 100,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
