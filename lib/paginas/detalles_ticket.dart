import 'package:design_challege_1/modelos/pelicula.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetallesTicket extends StatelessWidget {
  final Pelicula pelicula;
  final String hora;

  DetallesTicket({this.pelicula, this.hora});

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
      body: Stack(
        children: <Widget>[
          TicketCanvas(pelicula: pelicula, hora: hora),
          Transform.translate(
            offset: Offset(80.0, -24.0),
            child: Container(
              height: 180.0,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      image: AssetImage(pelicula.imagen), fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }
}

class TicketCanvas extends StatelessWidget {
  final Pelicula pelicula;
  final String hora;

  TicketCanvas({this.pelicula, this.hora});

  Widget textos(String titulo, String subtitulo) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: <Widget>[
            Text(titulo + ":"),
            SizedBox(width: 4.0),
            Text(
              subtitulo,
              style: TextStyle(color: Color(0xFF8EBABF)),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 48.0),
      child: CustomPaint(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 180.0),
                Text(pelicula.titulo,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(pelicula.tipo),
                ),
                textos("Cine", "Monje Campero"),
                textos("Fecha", "Jueves 4 de agosto de 2020"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    textos("Sala", "2"),
                    textos("Hora", hora),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    textos("Fila", "5"),
                    textos("Precio", "45 Bs"),
                  ],
                ),
                textos("Ticket ID", "PVR 4930 AYUSH 67271"),
                Expanded(child: Container()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    margin: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/qr.png'))),
                  ),
                )
              ],
            ),
          ),
        ),
        size: size,
        painter: TicketPainter(),
      ),
    );
  }
}

class TicketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //paint ticket
    final paint = Paint()..color = Colors.white;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            topRight: Radius.circular(64.0),
            topLeft: Radius.circular(64.0),
            bottomRight: Radius.circular(64.0),
            bottomLeft: Radius.circular(64.0)),
        paint);

    //paint circulos
    //circulo 1
    final paintCirculo1 = Paint()..color = Color(0xFF011126);
    final startPosition1 = Offset(0.0, (size.height / 5) - 25.0);
    final endPosition1 = Offset(0.0, (size.height / 5) + 25.0);
    final pathCirculo1 = Path()
      ..moveTo(startPosition1.dx, startPosition1.dy)
      ..quadraticBezierTo(startPosition1.dx + 45.0, startPosition1.dy + 25,
          endPosition1.dx, endPosition1.dy)
      ..close();

    canvas.drawPath(pathCirculo1, paintCirculo1);

    //circulo 2
    final paintCirculo2 = Paint()..color = Color(0xFF011126);
    final startPosition2 = Offset(size.width, (size.height / 5) - 25.0);
    final endPosition2 = Offset(size.width, (size.height / 5) + 25.0);
    final pathCirculo2 = Path()
      ..moveTo(startPosition2.dx, startPosition2.dy)
      ..quadraticBezierTo(startPosition2.dx - 45.0, startPosition2.dy + 25,
          endPosition2.dx, endPosition2.dy)
      ..close();

    canvas.drawPath(pathCirculo2, paintCirculo2);

    //circulo 3
    final paintCirculo3 = Paint()..color = Color(0xFF011126);
    final startPosition3 = Offset(0.0, (3 * (size.height / 5)) - 25.0);
    final endPosition3 = Offset(0.0, (3 * (size.height / 5)) + 25.0);
    final pathCirculo3 = Path()
      ..moveTo(startPosition3.dx, startPosition3.dy)
      ..quadraticBezierTo(startPosition3.dx + 45.0, startPosition3.dy + 25,
          endPosition3.dx, endPosition3.dy)
      ..close();

    canvas.drawPath(pathCirculo3, paintCirculo3);

    //circulo 4
    final paintCirculo4 = Paint()..color = Color(0xFF011126);
    final startPosition4 = Offset(size.width, (3 * (size.height / 5)) - 25.0);
    final endPosition4 = Offset(size.width, (3 * (size.height / 5)) + 25.0);
    final pathCirculo4 = Path()
      ..moveTo(startPosition4.dx, startPosition4.dy)
      ..quadraticBezierTo(startPosition4.dx - 45.0, startPosition4.dy + 25,
          endPosition4.dx, endPosition4.dy)
      ..close();

    canvas.drawPath(pathCirculo4, paintCirculo4);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
