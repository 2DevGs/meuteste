import 'package:teste_imobi_brasil/src/core/exceptions/auth_exception.dart';
import 'package:teste_imobi_brasil/src/core/exceptions/repository_exception.dart';
import 'package:teste_imobi_brasil/src/core/fp/either.dart';
import 'package:teste_imobi_brasil/src/core/fp/nil.dart';
import 'package:teste_imobi_brasil/src/model/user_model.dart';

abstract interface class UserRepository {
  Future<Either<AuthException, String>> login(String email, String password);

  Future<Either<RepositoryException, UserModel>> me();

  Future<Either<RepositoryException, Nil>> registerUser(
    ({String name, String email, String password}) userData,
  );
}
