// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ecommerceassim/shared/core/models/pagamento_model.dart';
import 'package:ecommerceassim/shared/core/repositories/pagamento_repository.dart';

class PagamentoController with ChangeNotifier {
  final PagamentoRepository _repository;
  File? _comprovante;
  String? _comprovanteType;
  String? _pdfPath;
  String? _downloadPath;
  Uint8List? _comprovanteBytes;

  PagamentoController(this._repository);

  File? get comprovante => _comprovante;
  String? get comprovanteType => _comprovanteType;
  String? get pdfPath => _pdfPath;
  String? get downloadPath => _downloadPath;
  Uint8List? get comprovanteBytes => _comprovanteBytes;

  Future<void> pickComprovante() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      );

      if (result != null && result.files.single.path != null) {
        _comprovante = File(result.files.single.path!);
        _comprovanteType = result.files.single.extension;
        _pdfPath = (_comprovanteType == 'pdf') ? _comprovante!.path : null;
        notifyListeners();
      } else {
        debugPrint('Nenhum arquivo selecionado');
      }
    } catch (e) {
      debugPrint('Erro ao selecionar arquivo: $e');
    }
  }

  Future<void> loadPDF(String? path) async {
    try {
      if (path != null && path.isNotEmpty) {
        await Future.delayed(const Duration(milliseconds: 500));
      }
    } catch (e) {
      debugPrint('Erro ao carregar PDF: $e');
      throw Exception('Erro ao carregar PDF');
    }
  }

  Future<void> uploadComprovante(int orderId, BuildContext context) async {
    if (_comprovante == null) {
      debugPrint('Nenhum comprovante selecionado');
      return;
    }

    final pagamento = PagamentoModel(comprovante: _comprovante!);

    try {
      await _repository.uploadComprovante(pagamento, orderId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Comprovante enviado com sucesso!')),
      );
      Navigator.pushNamed(context, Screens.purchases);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  Future<void> downloadComprovante(int orderId) async {
    try {
      _downloadPath = await _repository.downloadComprovante(orderId);
      _comprovanteType = _downloadPath!.split('.').last;
      _pdfPath = (_comprovanteType == 'pdf') ? _downloadPath : null;
      notifyListeners();
    } catch (e) {
      debugPrint('Erro ao baixar comprovante: $e');
    }
  }

  Future<void> fetchComprovanteBytes(int orderId) async {
    try {
      _comprovanteBytes = await _repository.getComprovanteBytes(orderId);
      _comprovanteType = detectFileType(_comprovanteBytes!);
      notifyListeners();
    } catch (e) {
      debugPrint('Erro ao obter bytes do comprovante: $e');
    }
  }

  String detectFileType(Uint8List bytes) {
    final pdfHeader = [0x25, 0x50, 0x44, 0x46];
    final jpgHeader = [0xFF, 0xD8, 0xFF];
    final pngHeader = [0x89, 0x50, 0x4E, 0x47];

    bool matchesHeader(Uint8List bytes, List<int> header) {
      for (int i = 0; i < header.length; i++) {
        if (bytes[i] != header[i]) {
          return false;
        }
      }
      return true;
    }

    if (bytes.length >= 4 && matchesHeader(bytes, pdfHeader)) {
      return 'pdf';
    } else if (bytes.length >= 3 && matchesHeader(bytes, jpgHeader)) {
      return 'jpg';
    } else if (bytes.length >= 4 && matchesHeader(bytes, pngHeader)) {
      return 'png';
    } else {
      return 'unknown';
    }
  }
}
