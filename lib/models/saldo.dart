import 'package:flutter/cupertino.dart';

class Saldo extends ChangeNotifier{
  double valor;

  Saldo(
    this.valor,
  );

  void adiciona(valor){
    this.valor += valor;

    notifyListeners();
  }

  void subtrai(valor){
    this.valor -= valor;

    notifyListeners();
  }

  @override
  String toString() {
    final valorFormatter = valor.toStringAsFixed(2);
    return "R\$$valorFormatter";
  }
}
