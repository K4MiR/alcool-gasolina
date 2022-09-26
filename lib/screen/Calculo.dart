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
  String _textoResutaldo = "";

  void _limparCampos() {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
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
                    'Saiba qual a melhor opção para abastecimento do seu veículo.',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 220,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Álcool, ex: 2.56",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  controller: _controllerAlcool,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                width: 220,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 4.56",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  controller: _controllerGasolina,
                  onSubmitted: (value) {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                  onPressed: _calcular,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('CALCULAR')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 400,
                child: Text(
                  textAlign: TextAlign.center,
                  _textoResutaldo,
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResutaldo =
            "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResutaldo = "Melhor abastecer com gasolina.";
        });
      } else {
        setState(() {
          _textoResutaldo = "Melhor abastecer com álcool.";
        });
      }
      _limparCampos();
    }
  }
}
