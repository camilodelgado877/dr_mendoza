import 'package:dr_mendoza/screens/recipe_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../models/recipe.api.dart';
import '../models/recipe.dart';

class Cocina_page extends StatefulWidget {
  Cocina_page({super.key});
  Cocina_PageState createState() => Cocina_PageState();
}
class Cocina_PageState extends State<Cocina_page>{

  List<Recipe> recipes = [];
  bool _isLoading = true;

  @override
  void initState(){
    super.initState(); 
    getRecipes();
  }

  Future<void> getRecipes() async{
    recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

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
                          Navigator.pushNamed(context, 'Cocina_page');
                        },
                        child: const Text(
                          "Cocina",
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
            title: Row(children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10,),
              Text('Libro de cocina'),
            ] ,
          ),
          ),
          body: _isLoading ? Center(child: CircularProgressIndicator())
          : ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index){
              return RecipeCard(title: recipes[index].name, cookTime: recipes[index].totalTime, rating: recipes[index].rating.toString(), thumbnailUrl: recipes[index].images);
            },)
        )
      ],
    );
  }
}
