import 'package:get/get.dart';
import 'package:vidaagroconsumidor/components/buttons/custom_search_field.dart';
import 'package:vidaagroconsumidor/components/spacer/verticalSpacer.dart';
import 'package:vidaagroconsumidor/screens/screens_index.dart';
import 'package:vidaagroconsumidor/shared/constants/style_constants.dart';
import 'package:vidaagroconsumidor/shared/core/controllers/banca_controller.dart';
import 'package:vidaagroconsumidor/shared/core/models/banca_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../assets/index.dart';
import '../../shared/constants/app_text_constants.dart';

class Bancas extends StatefulWidget {
  const Bancas({super.key});

  @override
  State<Bancas> createState() => _BancasState();
}

class _BancasState extends State<Bancas> {
  BancaController controller = Get.put(BancaController());

  @override
  void initState() {
    super.initState();
    controller.loadBancas();
    controller.getUserToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future:
            Provider.of<BancaController>(context, listen: false).loadBancas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kDetailColor),
              ),
            );
          }

          if (snapshot.hasError) {
            return _buildErrorWidget('Ocorreu um erro ao carregar as bancas.');
          }

          final bancaController = Provider.of<BancaController>(context);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              CustomSearchField(
                fillColor: kOnBackgroundColorText,
                iconColor: kDetailColor,
                hintText: 'Buscar por bancas',
                padding: const EdgeInsets.all(5.0),
                onSearch: (query) {
                  bancaController.searchBancas(query);
                },
                setLoading: (bool loading) {
                  // Implementar estado de carregamento se necessário
                },
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Bancas',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const VerticalSpacer(size: 5),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await bancaController.loadBancas();
                  },
                  child: bancaController.bancas.isEmpty
                      ? _buildEmptyListWidget()
                      : ListView.builder(
                          itemCount: bancaController.bancas.length,
                          itemBuilder: (context, index) {
                            BancaModel banca = bancaController.bancas[index]!;
                            return BancaCard(banca: banca);
                          },
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyListWidget() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.search_off, color: kDetailColor, size: 80),
              const SizedBox(height: 20),
              const Text(
                'Nenhuma banca foi encontrada.',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: kDetailColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Tente outro nome ou verifique a ortografia.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const VerticalSpacer(size: 220),
          const Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, color: kDetailColor, size: 35),
                SizedBox(width: 8),
                Text(
                  'Oops!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kDetailColor,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Ocorreu um erro.',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kDetailColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class BancaCard extends StatefulWidget {
  final BancaModel banca;

  const BancaCard({required this.banca, super.key});

  @override
  State<BancaCard> createState() => _BancaCardState();
}

class _BancaCardState extends State<BancaCard> {
  BancaController controller = Get.put(BancaController());

  @override
  void initState() {
    super.initState();
    controller.getUserToken();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Screens.menuProducts,
              arguments: {
                'id': widget.banca.id,
                'nome': widget.banca.nome,
                'horario_abertura': widget.banca.horarioAbertura,
                'horario_fechamento': widget.banca.horarioFechamento,
              },
            );
          },
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundImage: const AssetImage(Assets.logoVidaAgro),
                  foregroundImage: NetworkImage(
                    '$kBaseURL/bancas/${widget.banca.id}/imagem',
                    headers: {
                      "Authorization": "Bearer ${controller.userToken}"
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    widget.banca.nome,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
