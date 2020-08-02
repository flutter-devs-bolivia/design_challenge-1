import 'package:design_challege_1/modelos/pelicula.dart';
import 'package:design_challege_1/paginas/seleccion_asiento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetallesPelicula extends StatefulWidget {
  final Pelicula pelicula;

  DetallesPelicula({this.pelicula});

  @override
  _DetallesPeliculaState createState() => _DetallesPeliculaState();
}

class _DetallesPeliculaState extends State<DetallesPelicula> {
  bool sinopsisActiva;

  Widget sinopsis() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Sinopsis',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(height: 8.0),
          Container(
            child: Text(
              "Todo inicia con la llegada de Jimmy a Pucarani (que en realidad era un proveedor de droga, que se hace pasar como Campeón Mundial de Ciclismo), que arriba a la localidad con el objetivo de entregar droga a otro contacto. En lo que busca a su contacto Ricardo (Oscar Bernal) y a su novia Katty (Viviana Chacón), se extravía en la localidad por lo que, busca a alguien que lo lleve al pueblo y en eso, se encuentra a Gumercindo (Hugo Fernández), un chofer de camioneta que suele ser ladino en la población.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300),
              maxLines: sinopsisActiva ? 20 : 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8.0),
          GestureDetector(
            onTap: () {
              setState(() {
                sinopsisActiva = !sinopsisActiva;
              });
            },
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                sinopsisActiva ? "Ver menos" : 'Ver mas...',
                style: TextStyle(color: Color(0xFFBF9C5A)),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    sinopsisActiva = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF011126),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            PeliculaCard(pelicula: widget.pelicula),
            sinopsis(),
            Reserva(pelicula: widget.pelicula),
            SizedBox(
              height: 24.0,
            )
          ],
        ),
      ),
    );
  }
}

class Reserva extends StatefulWidget {
  final Pelicula pelicula;

  Reserva({this.pelicula});

  @override
  _ReservaState createState() => _ReservaState();
}

class _ReservaState extends State<Reserva> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Reserva ahora:',
              style: TextStyle(color: Colors.white, fontSize: 24)),
          SizedBox(height: 16.0),
          Text('Día',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300)),
          SizedBox(height: 20.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[for (int i = 0; i < 5; i++) SeleccionDia()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text('Hora',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              for (int i = 0; i < 3; i++)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => SeleccionAsiento(
                                pelicula: widget.pelicula,
                                hora: widget.pelicula.horarios[i])));
                  },
                  child: Text(widget.pelicula.horarios[i],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300)),
                )
            ],
          )
        ],
      ),
    );
  }
}

class SeleccionDia extends StatefulWidget {
  bool seleccionado;
  Function(bool) onTap;

  SeleccionDia({this.seleccionado = false, this.onTap});

  @override
  _SeleccionDiaState createState() => _SeleccionDiaState();
}

class _SeleccionDiaState extends State<SeleccionDia> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.seleccionado = !widget.seleccionado;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 16.0),
        height: 100.0,
        width: 75.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Agosto",
                style: TextStyle(
                    color:
                        widget.seleccionado ? Colors.white : Color(0xff8C8C8C),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
            Text("6",
                style: TextStyle(
                    color: widget.seleccionado
                        ? Color(0xFF7D7E81)
                        : Color(0xff8C8C8C),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            Text("J",
                style: TextStyle(
                    color:
                        widget.seleccionado ? Colors.white : Color(0xff8C8C8C),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold))
          ],
        ),
        decoration: BoxDecoration(
            color: widget.seleccionado ? Color(0xffbf9c5a) : Color(0xFF011126),
            borderRadius: BorderRadius.circular(20),
            boxShadow: widget.seleccionado
                ? [
                    BoxShadow(
                        color: Color(0xFFFAD81A),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                        offset: Offset(0.0, 2.0))
                  ]
                : []),
      ),
    );
  }
}

class PeliculaCard extends StatelessWidget {
  final Pelicula pelicula;

  PeliculaCard({this.pelicula});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
                  Text(pelicula.tipo,
                      style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  SizedBox(height: 8.0),
                  Text("Duracion: ${pelicula.duracion} minutos",
                      style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Color(0xFFFAD81A),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Color(0xffBF9C5A),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Icon(Icons.play_arrow, color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
