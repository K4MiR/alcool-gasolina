import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calcular extends StatefulWidget {
  const Calcular({Key? key}) : super(key: key);

  @override
  State<Calcular> createState() => _CalcularState();
}

class _CalcularState extends State<Calcular> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Center(
                child: Image.asset(
                  'assets/image/logo.png',
                  width: 300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 400,
                child: Text(
                    textAlign: TextAlign.center,
                    'Saiba qual a melhor opção para abastecimento do seu carro.',
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Álcool, ex: 2.56",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  controller: _controllerAlcool,
                  onSubmitted: (value) {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 4.56",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  controller: _controllerGasolina,
                  onSubmitted: (value) {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(onPressed: () {},
                  child: Text('Calcular')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Resultado',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
