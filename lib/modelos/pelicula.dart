// ignore_for_file: public_member_api_docs, sort_constructors_first
/*class pelicula {

String title;
String backdrop_path;
String overview;
double vote_average;
String poster_path;


  pelicula({
    required this.title,
    required this.backdrop_path,
    required this.overview,
    required this.vote_average,
    required this.poster_path,
  });

  factory pelicula.fromJson(Map<String, dynamic> json){
    return pelicula(title: json["title"] ?? "Titulo por defecto", backdrop_path: json["backdrop_path"],    // ?? sirve por si no coge ningun dato de la api poner un valor por defecto
    overview: json["overview"], vote_average: json["vote_average"], 
    poster_path: json["poster_path"],
    );
  }


}*/


class pelicula {
    bool adult;
    String backdropPath;
    int id;
    String title;
    String originalLanguage;
    String originalTitle;
    String overview;
    String posterPath;
    List<int> genreIds;
    double popularity;
    DateTime releaseDate;
    bool video;
    double voteAverage;
    int voteCount;

    pelicula({
        required this.adult,
        required this.backdropPath,
        required this.id,
        required this.title,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.posterPath,
       required this.genreIds,
        required this.popularity,
        required this.releaseDate,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory pelicula.fromJson(Map<String, dynamic> json) => pelicula(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}


