import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommercebonito/components/buttons/custom_search_field.dart';
import 'package:ecommercebonito/components/spacer/verticalSpacer.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:ecommercebonito/shared/core/controllers/banca_controller.dart';
import 'package:ecommercebonito/shared/core/models/banca_model.dart';

class Bancas extends StatelessWidget {
  const Bancas({super.key});

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
                child: bancaController.bancas.isEmpty
                    ? _buildEmptyListWidget()
                    : ListView.builder(
                        itemCount: bancaController.bancas.length,
                        itemBuilder: (context, index) {
                          BancaModel banca = bancaController.bancas[index];
                          return BancaCard(banca: banca);
                        },
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

class BancaCard extends StatelessWidget {
  final BancaModel banca;
  const BancaCard({required this.banca, Key? key}) : super(key: key);

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
                'id': banca.id,
                'nome': banca.nome,
                'horario_abertura': banca.horarioAbertura,
                'horario_fechamento': banca.horarioFechamento,
              },
            );
          },
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25.0,
                  backgroundImage:
                      AssetImage("lib/assets/images/banca-fruta.jpg"),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    banca.nome,
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
