import 'package:design_challege_1/modelos/pelicula.dart';
import 'package:design_challege_1/paginas/detalles_pelicula.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff011126),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Cine Flutter',
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
        bottom: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(CupertinoIcons.search,
                    color: Colors.white, size: 28.0),
                onPressed: null)
          ],
          title: Container(
              margin: EdgeInsets.only(top: 16.0),
              width: 300.0,
              height: 1,
              color: Colors.white),
        ),
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, picker) {
            return PeliculaCard(
              pelicula: peliculas[picker],
            );
          }),
    );
  }
}

class PeliculaCard extends StatelessWidget {
  final Pelicula pelicula;

  PeliculaCard({this.pelicula});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => DetallesPelicula(pelicula: pelicula)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        height: 200.0,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Container(
              height: 200.0,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(pelicula.imagen), fit: BoxFit.cover)),
            ),
            SizedBox(width: 8.0),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    pelicula.titulo,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Horarios:",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0)),
                      for (int i = 0; i < pelicula.horarios.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            pelicula.horarios[i],
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        )
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text("Duracion: ${pelicula.duracion} minutos",
                      style: TextStyle(color: Colors.white, fontSize: 16.0)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
