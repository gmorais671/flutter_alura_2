class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(
    this.valor,
    this.numeroConta,
  );

  @override
  String toStringValor(){
    return 'R\$ $valor';
  }

  @override
  String toStringConta(){
    return 'Acc.: $numeroConta';
  }
}
