import 'package:dio/dio.dart';
import 'package:vidaagroconsumidor/shared/constants/app_text_constants.dart';
import 'package:vidaagroconsumidor/shared/core/models/pedidos_model.dart';
import 'package:vidaagroconsumidor/shared/core/user_storage.dart';

class PedidosRepository {
 late String userToken;
 late String userId;
 final Dio _dio;

 PedidosRepository(this._dio) {
   _dio.interceptors.add(LogInterceptor(
     requestBody: true,
     responseBody: true,
     logPrint: (obj) => print('🔄 Dio Log: $obj'),
   ));
 }

 Future<List<PedidoModel>> getOrders() async {
   UserStorage userStorage = UserStorage();
   userToken = await userStorage.getUserToken();
   userId = await userStorage.getUserId();

   print('🔑 Token: $userToken');
   print('👤 UserID: $userId');

   try {
     print('📡 Iniciando requisição para: $kBaseURL/transacoes/$userId/compras');
     var response = await _dio.get('$kBaseURL/transacoes/$userId/compras',
         options: Options(
           headers: {
             "Content-Type": "application/json",
             "Accept": "application/json",
             'Cache-Control': 'no-cache',
             "Authorization": "Bearer $userToken"
           },
         ));

     print('📥 Status Code: ${response.statusCode}');

     if (response.statusCode == 200) {
       print('✅ Requisição bem sucedida');
       
       if (response.data['compras'] != null) {
         final jsonData = Map<String, dynamic>.from(response.data);
         final ordersJson = List.from(jsonData['compras'])
             .map((item) => Map<String, dynamic>.from(item))
             .toList();

         print('📦 Número de pedidos encontrados: ${ordersJson.length}');

         List<PedidoModel> orders = [];
         for (var orderJson in ordersJson) {
           print('🏪 Buscando nome da banca para pedido ID: ${orderJson['id']}');
           var order = PedidoModel.fromJson(orderJson);
           order.bancaNome = await fetchBancaName(order.bancaId!);
           orders.add(order);
         }

         orders.sort((a, b) => b.dataPedido!.compareTo(a.dataPedido!));
         print('📊 Total de pedidos processados: ${orders.length}');

         return orders;
       } else {
         print('⚠️ Nenhum dado de compra disponível');
         return [];
       }
     } else {
       throw Exception(
           'Falha em carregar os pedidos. Status code: ${response.statusCode}');
     }
   } catch (error) {
     print('❌ Erro na requisição: $error');
     rethrow;
   }
 }

 Future<String> fetchBancaName(int bancaId) async {
   try {
     print('🏪 Buscando informações da banca ID: $bancaId');
     var response = await _dio.get('$kBaseURL/bancas',
         options: Options(
           headers: {
             "Content-Type": "application/json",
             "Accept": "application/json",
             'Cache-Control': 'no-cache',
             "Authorization": "Bearer $userToken"
           },
         ));
     
     if (response.statusCode == 200) {
       print('✅ Dados da banca recebidos com sucesso');
       var bancasData = List<Map<String, dynamic>>.from(response.data['bancas']);
       var banca = bancasData.firstWhere((b) => b['id'] == bancaId,
           orElse: () => <String, dynamic>{});
       
       String bancaNome = banca.isNotEmpty ? banca['nome'] : 'Banca Desconhecida';
       print('📍 Nome da banca encontrado: $bancaNome');
       return bancaNome;
     } else {
       print('⚠️ Falha em carregar as bancas. Código do Status: ${response.statusCode}');
       return 'Banca Desconhecida';
     }
   } catch (error) {
     print('❌ Erro em buscar o nome da banca: $error');
     return 'Banca Desconhecida';
   }
 }
}