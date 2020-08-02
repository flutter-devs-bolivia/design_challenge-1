class Pelicula {
  String titulo;
  List<String> horarios;
  int duracion;
  String imagen;
  String tipo;

  Pelicula({this.titulo, this.duracion, this.horarios, this.imagen, this.tipo});
}

Pelicula ejemplo1 = Pelicula(
    tipo: 'Comedia',
    titulo: 'La bicicleta de los Huanca',
    imagen: "assets/5.jpg",
    duracion: 138,
    horarios: ["16:05", "18:45", "21:10"]);

Pelicula ejemplo2 = Pelicula(
    tipo: 'Comedia',
    titulo: 'Avengers - Infinity War',
    imagen: "assets/3.jpg",
    duracion: 138,
    horarios: ["16:05", "18:45", "21:10"]);

Pelicula ejemplo3 = Pelicula(
    tipo: 'Comedia',
    titulo: 'Moonlight',
    imagen: "assets/6.jpg",
    duracion: 138,
    horarios: ["16:05", "18:45", "21:10"]);

Pelicula ejemplo4 = Pelicula(
    tipo: 'Comedia',
    titulo: 'E.T',
    imagen: "assets/4.jpg",
    duracion: 138,
    horarios: ["16:05", "18:45", "21:10"]);

List<Pelicula> peliculas = [
  ejemplo1,
  ejemplo2,
  ejemplo3,
  ejemplo4,
  ejemplo1,
  ejemplo2,
  ejemplo3,
  ejemplo4
];
