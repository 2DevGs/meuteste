import 'package:teste_imobi_brasil/src/core/exceptions/service_exception.dart';
import 'package:teste_imobi_brasil/src/core/fp/either.dart';
import 'package:teste_imobi_brasil/src/core/fp/nil.dart';

abstract interface class UserRegisterService {
  Future<Either<ServiceException, Nil>> execute(
      ({String name, String email, String password}) userData);
}
