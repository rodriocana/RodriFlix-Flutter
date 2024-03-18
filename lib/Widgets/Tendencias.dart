import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutflix/constant.dart';
import 'package:flutter/material.dart';

class Tendencias extends StatelessWidget {
  const Tendencias({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
Widget build(BuildContext context) {
  return SizedBox(
    // En este contenedor que ocupa toda la pantalla de ancho es donde creo los minicontenedores para las películas
    width: double.infinity,
    child: CarouselSlider.builder(
      itemCount: 10,
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        viewportFraction: 0.51,
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true, // Esto sirve para centrar cada carátula de cada portada
        pageSnapping: true,
        autoPlayAnimationDuration: const Duration(seconds: 1),
      ),
      itemBuilder: (context, itemIndex, pageViewIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 1.2), // Margen opcional
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 25, 34, 65).withOpacity(0.4),
                spreadRadius: 0.4,
                blurRadius: 2,
                offset: Offset(9, -2), // Cambia el desplazamiento de la sombra según necesites
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            // Si quieres agregar un borde, descomenta las siguientes líneas y ajusta según tus necesidades
           border: Border.all(
             color: Color.fromARGB(255, 238, 131, 60),
             width: 3.5,
           ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16), // 13 va bien
            child: Image.network(
              '${constants.imagepath}${snapshot.data[itemIndex].posterPath}',
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    ),
  );
}

}
