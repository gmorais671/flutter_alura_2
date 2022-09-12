import 'package:bytebank_app2/components/editor.dart';
import 'package:bytebank_app2/models/transferencia.dart';
import 'package:bytebank_app2/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/saldo.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                _controladorCampoNumeroConta,
                _dicaCampoNumeroConta,
                _rotuloCampoNumeroConta,
                Icons.monetization_on,
              ),
              Editor(
                _controladorCampoValor,
                _dicaCampoValor,
                _rotuloCampoValor,
                Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () => _criaTransferencia(context),
              ),
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    final _transferenciaValida = _validaTransferencia(context, numeroConta, valor);

    if (_transferenciaValida) {
      final novaTransferencia = Transferencia(valor!, numeroConta!);
      _atualizaEstados(context, novaTransferencia, valor);

      Navigator.pop(context);
    }
  }

  _validaTransferencia(context, numeroConta, valor){
    final _tranferenciaValida = numeroConta != null && valor != null;
    final _saldoSuficiente = valor <= Provider.of<Saldo>(context, listen: false,).valor;

    return _tranferenciaValida && _saldoSuficiente;
  }

  _atualizaEstados(context, novaTransferencia, valor){
    Provider.of<Transferencias>(context, listen: false,).adiciona(novaTransferencia);
    Provider.of<Saldo>(context, listen: false,).subtrai(valor);
  }
}
