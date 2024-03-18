import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutflix/API/api.dart';
import 'package:flutflix/modelos/pelicula.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widgets/Tendencias.dart';
import 'Widgets/movies_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late Future<List<pelicula>> TrendingMovies;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    TrendingMovies = api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset('assets/rodriflix.png',
              fit: BoxFit.cover,
              height: 90,
              filterQuality: FilterQuality.high),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Peliculas en Tendencia',
                  style:
                      GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 24)),
                ),
                const SizedBox(
                    height: 20), // esto sirve como padding para que el texto
                SizedBox(
                  child: FutureBuilder(
                    future: TrendingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        
                        return  Tendencias(snapshot: snapshot,);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ), // este widget es una funcion para mostar el text y los contenedores de las peliculas en TENDENCIA
                const SizedBox(height: 10), // otro PADDING para crear espacios
                Text('Top 250',
                    style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(fontSize: 24))),
                const SizedBox(
                  height: 10,
                ),
                const MovieSlider(),
                const SizedBox(height: 10), // otro PADDING para crear espacios
                Text('En Cartelera',
                    style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(fontSize: 24))),
                const SizedBox(
                  height: 10,
                ),
                const MovieSlider(),
              ],
            ),
          ),
        ),
        drawer: const Drawer(
          child: SafeArea(
              child: ListTile(
            title: Text("Click"),
          )),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil")
        ]),
        backgroundColor: Color(0xFF1F1D2B));
  }
}
