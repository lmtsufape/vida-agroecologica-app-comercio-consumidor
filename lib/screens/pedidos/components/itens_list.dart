import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidaagroconsumidor/shared/core/models/produtos_pedidos_model.dart';
import '../../../shared/core/controllers/pedidos_controller.dart';

class ItensPedidoWidget extends StatelessWidget {
  final int pedidoId;
  final List<ProdutoPedidoModel> itensPurchase;

  ItensPedidoWidget(
      {super.key,
      required this.pedidoId,
      required this.itensPurchase});

  @override
  Widget build(BuildContext context) {
    var itens = itensPurchase;
    Size size = MediaQuery.of(context).size;
    // Depuração: veja os itens no console
    debugPrint("Pedido ID: $pedidoId - Itens encontrados: ${itens.length}");

    return itens.isEmpty
        ? const Center(
            child: Text('Nenhum item encontrado'),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: itens.length,
            itemBuilder: (context, index) {
              var item = itens[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${item.quantidade} ${item.tipoUnidade} x ${item.titulo}',
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(fontSize: size.height * 0.02),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: size.height * 0.01,
                  ),
                ],
              );
            },
          );
  }
}
