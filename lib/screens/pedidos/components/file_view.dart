import 'dart:typed_data';
import 'package:ecommerceassim/components/appBar/custom_app_bar.dart';
import 'package:ecommerceassim/shared/components/bottomNavigation/BottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class FileViewScreen extends StatelessWidget {
  final Uint8List comprovanteBytes;
  final String comprovanteType;

  const FileViewScreen({
    required this.comprovanteBytes,
    required this.comprovanteType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      bottomNavigationBar: BottomNavigation(
        paginaSelecionada: 2,
      ),
      body: comprovanteType == 'pdf'
          ? PDFView(
              pdfData: comprovanteBytes,
            )
          : Center(
              child: Image.memory(comprovanteBytes),
            ),
    );
  }
}
