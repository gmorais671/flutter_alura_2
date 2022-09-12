import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/editor.dart';
import '../../models/saldo.dart';

const _tituloAppBar = 'Depósito';
const _dicaCampoValor = '0.00';
const _rotuloCampoValor = 'Valor';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
  FormularioDeposito({Key? key}) : super(key: key);

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              _controladorCampoValor,
              _dicaCampoValor,
              _rotuloCampoValor,
              Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaDeposito(context),
            ),
          ],
        ),
      ),
    );
  }

  _criaDeposito(context) {
    final double? valor = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _validaDeposito(valor);

    if(depositoValido) {
      _atualizaSaldo(context, valor);

      Navigator.pop(context);
    }
  }

  _validaDeposito(valor){
    final _campoPreenchido = valor != null;

    return _campoPreenchido;
  }

  _atualizaSaldo(context, valor) {
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }
}
