import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/transferencia.dart';
import '../../models/transferencias.dart';
import 'lista.dart';

const _titulo = 'Últimas transferências';
const _textoBotaoListaTransferencias = 'Verificar todas as transferências';

class UltimasTransferencias extends StatelessWidget {
  const UltimasTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          _titulo,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(
          builder: (context, transferencias, child) {
            final _tamanhoLista = transferencias.transferencias.length;
            int tamanho = 2;
            final _listaInvertida =
                transferencias.transferencias.reversed.toList();

            if(_tamanhoLista == 0) {
              return SemTransferencias();
            }

            if (_tamanhoLista < 2) {
              tamanho = _tamanhoLista;
            }

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: tamanho,
              shrinkWrap: true,
              itemBuilder: (context, indice) {
                final transferencia = _listaInvertida[indice];
                return ItemTransferencia(transferencia);
              },
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ListaTransferencias();
            }));
          },
          child: const Text(_textoBotaoListaTransferencias),
        ),
      ],
    );
  }
}

class SemTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Você ainda não cadastrou nenhuma transferência',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
