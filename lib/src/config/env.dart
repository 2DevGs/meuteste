import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'BACKEND_BASE_URL')
  static const String backendBaseUrl = _Env.backendBaseUrl;
}
