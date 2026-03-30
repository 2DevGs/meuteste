import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:teste_imobi_brasil/src/core/exceptions/repository_exception.dart';
import 'package:teste_imobi_brasil/src/core/fp/either.dart';
import 'package:teste_imobi_brasil/src/core/restClient/rest_client.dart';
import 'package:teste_imobi_brasil/src/model/imovel_model.dart';
import './imovel_repository.dart';

class ImovelRepositoryImpl implements ImovelRepository {
  final RestClient restClient;

  ImovelRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, ImovelModel>> getImovelById(
      int imovelId) async {
    try {
      final Response(:data) = await restClient.auth.get('/imoveis/$imovelId');
      return Success(ImovelModel.fromMap(data));
    } on DioException catch (e, s) {
      log('Erro ao buscar imóveis', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao buscar imóveis'));
    }
  }

  @override
  Future<Either<RepositoryException, List<ImovelModel>>> getImoveis() async {
    try {
      final Response(:data) = await restClient.auth.get('/imoveis');
      final imoveis =
          (data as List).map((i) => ImovelModel.fromMap(i)).toList();
      return Success(imoveis);
    } on DioException catch (e, s) {
      log('Erro ao buscar imóveis', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao buscar imóveis'));
    } on ArgumentError catch (e, s) {
      log('Erro ao converter imóveis', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao converter imóveis'));
    }
  }

  @override
  Future<Either<RepositoryException, ImovelModel>> registerImovel(
      ({
        String titulo,
        String descricao,
        String tipo,
        double preco,
        String cidade,
        String bairro,
        int quartos,
        int banheiros,
        int vagas,
        double area,
        String foto,
      }) imovelData) async {
    try {
      final Response(:data) = await restClient.auth.post('/imoveis', data: {
        'titulo': imovelData.titulo,
        'descricao': imovelData.descricao,
        'tipo': imovelData.tipo,
        'preco': imovelData.preco,
        'cidade': imovelData.cidade,
        'bairro': imovelData.bairro,
        'quartos': imovelData.quartos,
        'banheiros': imovelData.banheiros,
        'vagas': imovelData.vagas,
        'area': imovelData.area,
        'foto': imovelData.foto,
      });
      return Success(ImovelModel.fromMap(data));
    } on DioException catch (e, s) {
      log('Erro ao registrar imóvel', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao registrar imóvel'));
    }
  }
}
