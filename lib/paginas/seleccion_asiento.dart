import 'package:design_challege_1/modelos/pelicula.dart';
import 'package:design_challege_1/paginas/detalles_ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeleccionAsiento extends StatelessWidget {
  final Pelicula pelicula;
  final String hora;

  SeleccionAsiento({this.pelicula, this.hora});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF011126),
      appBar: AppBar(
        title: Text(pelicula.titulo),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _Body(pelicula: pelicula, hora: hora),
    );
  }
}

class _Body extends StatelessWidget {
  final Pelicula pelicula;
  final String hora;

  _Body({this.pelicula, this.hora});

  Widget detalles() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(pelicula.tipo,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300)),
          Text("Fecha: Jueves 6 de Agosto\t\tHrs:${hora}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300))
        ],
      );

  Widget DetallesSeleccionAsiento() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Color(0xff7D7E81)),
              ),
              SizedBox(height: 8.0),
              Text('Ocupado',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300))
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white),
              ),
              SizedBox(height: 8.0),
              Text('Disponible',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300))
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Color(0xffF2D22E)),
              ),
              SizedBox(height: 8.0),
              Text('Seleccionado',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300))
            ],
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: detalles(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: DetallesSeleccionAsiento(),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.0),
              height: 20.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Color(0xffF2D22E)),
            ),
            SizedBox(height: 16.0),
            Text('PANTALLA',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Asientos(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Fila 5 - Asiento 15',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300)),
                Text('Bs. 45',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300)),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Fila 5 - Asiento 15',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300)),
                Text('Bs. 45',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300)),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(32.0),
              child: CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 96.0, vertical: 16.0),
                child: Text('Comprar'),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              DetallesTicket(hora: hora, pelicula: pelicula)));
                },
                color: Color(0xFFBF9C5A),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Asientos extends StatelessWidget {
  Widget parAsientos() => Row(
        children: <Widget>[
          Asiento(),
          SizedBox(width: 4.0),
          Asiento(),
        ],
      );

  Widget columnaAsientos() => SizedBox(
        height: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            parAsientos(),
            parAsientos(),
            parAsientos(),
            parAsientos(),
            parAsientos(),
            parAsientos()
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        columnaAsientos(),
        columnaAsientos(),
        columnaAsientos(),
        columnaAsientos(),
        columnaAsientos(),
        columnaAsientos(),
        columnaAsientos()
      ],
    );
  }
}

class Asiento extends StatefulWidget {
  @override
  _AsientoState createState() => _AsientoState();
}

class _AsientoState extends State<Asiento> {
  TipoAsiento seleccionado;

  @override
  void initState() {
    super.initState();
    seleccionado = TipoAsiento.Disponible;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (seleccionado == TipoAsiento.Disponible) {
            seleccionado = TipoAsiento.Seleccionado;
          } else {
            seleccionado = TipoAsiento.Disponible;
          }
        });
      },
      child: Container(
        width: 12.0,
        height: 12.0,
        decoration: BoxDecoration(
            color: seleccionado == TipoAsiento.Seleccionado
                ? Color(0xFFF2D22E)
                : Colors.white,
            borderRadius: BorderRadius.circular(12.0)),
      ),
    );
  }
}

enum TipoAsiento { Ocupado, Disponible, Seleccionado }
