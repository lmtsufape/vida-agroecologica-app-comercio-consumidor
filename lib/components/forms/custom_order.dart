import 'package:vidaagroconsumidor/components/spacer/verticalSpacer.dart';
import 'package:vidaagroconsumidor/shared/constants/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:vidaagroconsumidor/components/utils/horizontal_spacer_box.dart';
import 'package:vidaagroconsumidor/components/utils/vertical_spacer_box.dart';
import 'package:vidaagroconsumidor/shared/constants/style_constants.dart';
import 'package:vidaagroconsumidor/shared/core/controllers/pedidos_controller.dart';
import 'package:vidaagroconsumidor/shared/core/models/produtos_pedidos_model.dart';

import '../../screens/pedidos/components/itens_list.dart';

class OrderCard extends StatefulWidget {
  final String orderNumber;
  final String sellerName;
  final double itemsTotal;
/*   final double shippingHandling; */
  final String date;
  final String status;
  final VoidCallback onTap;
  final int pedidoId;
  final List<ProdutoPedidoModel> itens;

  const OrderCard({
    super.key,
    required this.orderNumber,
    required this.sellerName,
    required this.itemsTotal,
    /*  required this.shippingHandling, */
    required this.date,
    required this.status,
    required this.onTap,
    required this.pedidoId,
    required this.itens,
  });

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  String formatPrice(double price) {
    return price.toStringAsFixed(2).replaceAll('.', ',');
  }

  String get formattedItemsTotal => formatPrice(widget.itemsTotal);

/*   String get formattedShippingHandling => formatPrice(shippingHandling);
 */
  String get formattedOrderTotal =>
      formatPrice(widget.itemsTotal /*  + shippingHandling */);

  Map<String, dynamic> _getStatusAttributes(String status) {
    switch (status) {
      // Em andamento
      case 'pagamento pendente':
        return {
          'color': kAlertColor,
          'icon': Icons.hourglass_bottom,
          'description': "Pagamento Pendente"
        };
      case 'aguardando retirada':
        return {
          'color': kAlertColor,
          'icon': Icons.hourglass_bottom,
          'description': "Aguardando Retirada"
        };
      case 'aguardando confirmação':
        return {
          'color': kAlertColor,
          'icon': Icons.hourglass_bottom,
          'description': "Aguardando Confirmação"
        };
      case 'aguardando envio':
        return {
          'color': kAlertColor,
          'icon': Icons.hourglass_bottom,
          'description': "Aguardando Envio"
        };
      // Finalizado
      case 'pedido entregue':
        return {
          'color': kDetailColor,
          'icon': Icons.check_circle,
          'description': 'Pedido Entregue'
        };
      case 'pedido enviado':
        return {
          'color': kSuccessColor,
          'icon': Icons.check_circle,
          'description': 'Pedido Enviado'
        };
      case 'pedido realizado':
        return {
          'color': kSuccessColor,
          'icon': Icons.check_box_rounded,
          'description': 'Pedido Realizado'
        };
      case 'comprovante anexado':
        return {
          'color': kSuccessColor,
          'icon': Icons.check_box_rounded,
          'description': 'Comprovante Anexado'
        };
      // Cancelado
      case 'pedido cancelado':
        return {
          'color': kErrorColor,
          'icon': Icons.cancel,
          'description': 'Pedido Cancelado'
        };
      case 'pedido recusado':
        return {
          'color': kErrorColor,
          'icon': Icons.cancel,
          'description': 'Pedido Recusado'
        };
      case 'pagamento expirado':
        return {
          'color': kErrorColor,
          'icon': Icons.cancel,
          'description': 'Pagamento Expirado'
        };

      case 'comprovante recusado':
        return {
          'color': kErrorColor,
          'icon': Icons.cancel,
          'description': 'Comprovante Recusado'
        };

      default:
        return {
          'color': Colors.grey,
          'icon': Icons.help_outline,
          'description': "Indisponível"
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusAttributes = _getStatusAttributes(widget.status);
    final statusColor = statusAttributes['color'] as Color;
    final statusIcon = statusAttributes['icon'] as IconData;
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pedido ${widget.orderNumber}',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: Colors.transparent,
                  height: size.height * 0.005,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: widget.onTap,
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
              color: kOnSurfaceColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: kTextButtonColor.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: const Offset(0, 0),
                ),
              ],
              border: Border(
                left: BorderSide(
                  color: kTextButtonColor.withOpacity(0.5),
                  width: 1,
                ),
                right: BorderSide(
                  color: kTextButtonColor.withOpacity(0.5),
                  width: 1,
                ),
              ),
            ),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.5),
                  child: Row(
                    children: [
                      const HorizontalSpacerBox(size: SpacerSize.large),
                      Text(
                        widget.sellerName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          /*  showDialog(
                            context: context,
                            builder: (context) => const DeletedOrderDialog(),
                          ); */
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: kTextButtonColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: kTextButtonColor,
                  height: 20,
                  thickness: 1,
/*                   indent: 5,
 */
                ),
                const VerticalSpacerBox(size: SpacerSize.small),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HorizontalSpacerBox(size: SpacerSize.large),
                      const Text(
                        'Itens:',
                        style: TextStyle(fontSize: 17),
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      SizedBox(
                        //height: size.height * widget.itens.length * 0.05,
                        child: ItensPedidoWidget(pedidoId: widget.pedidoId, itensPurchase: widget.itens),
                      ),
                    ],
                  ),
                ),
                const VerticalSpacerBox(size: SpacerSize.small),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  child: Row(
                    children: [
                      const HorizontalSpacerBox(size: SpacerSize.large),
                      const Text(
                        'Valor',
                        style: TextStyle(fontSize: 17),
                      ),
                      const Spacer(),
                      Text(
                        formattedItemsTotal,
                        style: const TextStyle(
                            fontSize: 21, color: kTextButtonColor),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  child: Row(
                    children: [
                      /*  const HorizontalSpacerBox(size: SpacerSize.large),
                      const Text(
                        'Frete',
                        style: TextStyle(fontSize: 17),
                      ),
                      const Spacer(),
                      Text(
                        formattedShippingHandling,
                        style: const TextStyle(
                            fontSize: 21, color: kTextButtonColor),
                      ), */
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  child: Row(
                    children: [
                      const HorizontalSpacerBox(size: SpacerSize.large),
                      const Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        formattedOrderTotal,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const VerticalSpacer(size: 60),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.date,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 4,
                          children: [
                            Text(
                              statusAttributes['description'],
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                            Icon(
                              statusIcon,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: size.height * 0.01,
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.transparent,
          height: size.height * 0.03,
        ),
      ],
    );
  }
}
