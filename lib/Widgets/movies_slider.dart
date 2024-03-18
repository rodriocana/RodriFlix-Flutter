import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 230, width: double.infinity,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    physics: const BouncingScrollPhysics(),
    itemCount: 10,
    itemBuilder:(context, index) {
      return Padding(
        padding: const EdgeInsets.all(6.0),
        child: ClipRRect(
          borderRadius:BorderRadius.circular(12),
          child: Container(color: Colors.amber,
          height: 250,
          width: 150,
          ),
        ),
      );
    },
    )
    );
  }
}

