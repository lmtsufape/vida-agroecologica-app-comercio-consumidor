import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:ecommerceassim/shared/core/models/pagamento_model.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';
import 'dart:io';

class PagamentoRepository {
  final Dio _dio = Dio();

  Future<void> uploadComprovante(PagamentoModel pagamento, int orderId) async {
    final userToken = await UserStorage().getUserToken();

    String url = '$kBaseURL/transacoes/$orderId/comprovante';
    FormData formData = FormData.fromMap({
      "comprovante": await MultipartFile.fromFile(pagamento.comprovante.path,
          filename: 'comprovante.jpg'),
    });

    try {
      Response response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $userToken',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      if (response.statusCode != 200) {
        throw Exception('Falha ao enviar comprovante');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }

  Future<Uint8List> getComprovanteBytes(int orderId) async {
    final userToken = await UserStorage().getUserToken();

    String url = '$kBaseURL/transacoes/$orderId/comprovante';

    try {
      Response response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $userToken',
          },
          responseType: ResponseType.bytes,
        ),
      );

      if (response.statusCode == 200) {
        return Uint8List.fromList(response.data);
      } else {
        throw Exception('Falha ao obter bytes do comprovante');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }

  Future<String> downloadComprovante(int orderId) async {
    final userToken = await UserStorage().getUserToken();

    String url = '$kBaseURL/transacoes/$orderId/comprovante';

    try {
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory == null) {
        final directory = await getExternalStorageDirectory();
        selectedDirectory = directory?.path ?? '';
      }

      Response response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $userToken',
          },
          responseType: ResponseType.bytes,
        ),
      );

      if (response.statusCode == 200) {
        // Detecta o tipo de conteúdo da resposta
        String? contentType = response.headers.value(Headers.contentTypeHeader);
        String fileExtension;

        if (contentType != null) {
          if (contentType == 'application/pdf') {
            fileExtension = 'pdf';
          } else if (contentType == 'image/jpeg') {
            fileExtension = 'jpg';
          } else if (contentType == 'image/png') {
            fileExtension = 'png';
          } else {
            throw Exception('Tipo de conteúdo não suportado: $contentType');
          }
        } else {
          throw Exception('Cabeçalho de tipo de conteúdo não encontrado');
        }

        final file =
            File('$selectedDirectory/comprovante_$orderId.$fileExtension');
        await file.writeAsBytes(response.data);
        return file.path;
      } else {
        throw Exception('Falha ao baixar comprovante');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }
}
