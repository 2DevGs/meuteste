import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:teste_imobi_brasil/src/core/exceptions/auth_exception.dart';
import 'package:teste_imobi_brasil/src/core/exceptions/repository_exception.dart';
import 'package:teste_imobi_brasil/src/core/fp/either.dart';
import 'package:teste_imobi_brasil/src/core/fp/nil.dart';
import 'package:teste_imobi_brasil/src/core/restClient/rest_client.dart';
import 'package:teste_imobi_brasil/src/model/user_model.dart';
import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;

  UserRepositoryImpl({required this.restClient});

  @override
  Future<Either<AuthException, String>> login(
      String email, String password) async {
    try {
      final Response(:data) = await restClient.unAuth.post('/auth', data: {
        'email': email,
        'password': password,
      });
      return Success(data['access_token']);
    } on DioException catch (e, s) {
      if (e.response != null) {
        final Response(:statusCode) = e.response!;
        if (statusCode == HttpStatus.forbidden) {
          log('Login ou senha inválidos', error: e, stackTrace: s);
          return Failure(AuthUnauthorizedException());
        }
      }
      log('Erro ao realizar login', error: e, stackTrace: s);
      return Failure(AuthError(message: 'Eroo ao realizar login'));
    }
  }

  @override
  Future<Either<RepositoryException, UserModel>> me() async {
    try {
      final Response(:data) = await restClient.auth.get('/me');
      return Success(UserModel.fromMap(data));
    } on DioException catch (e, s) {
      log('Erro ao buscar usuário logado', error: e, stackTrace: s);
      return Failure(
          RepositoryException(message: 'Erro ao buscar usuário logado'));
    }
  }

  @override
  Future<Either<RepositoryException, Nil>> registerUser(
      ({String email, String name, String password}) userData) async {
    try {
      await restClient.unAuth.post('/users', data: {
        'name': userData.name,
        'email': userData.email,
        'password': userData.password,
      });
      return Success(nil);
    } on DioException catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao registrar usuário'));
    }
  }
}
