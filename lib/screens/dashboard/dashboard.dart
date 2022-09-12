import 'package:bytebank_app2/screens/dashboard/saldo_card.dart';
import 'package:bytebank_app2/screens/deposito/formulario.dart';
import 'package:bytebank_app2/screens/transferencia/formulario.dart';
import 'package:bytebank_app2/screens/transferencia/lista.dart';
import 'package:bytebank_app2/screens/transferencia/ultimas.dart';
import 'package:flutter/material.dart';

const _textoBotaoDeposito = 'Realizar depósito';
const _textoBotaoTransferencias = 'Transferências';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard  :)',
        ),
      ),
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SaldoCard(),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return FormularioDeposito();
                    }));
                  },
                  child: const Text(_textoBotaoDeposito),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return FormularioTransferencia();
                    }));
                  },
                  child: const Text(_textoBotaoTransferencias),
                ),
              ],
            ),
            UltimasTransferencias(),
          ],
        ),
      ),
    );
  }
}
