## _Teste Imobi Brasil_
_by: Gustavo Serrano_


Teste Técnico — Desenvolvedor Flutter Pleno

Neste projeto utilizei o Riverpod por ter mais familiaridade com ele, desta forma pude me sentir mais confortavel para atingir novos limites.
Também fiz o uso de alguns packages para melhorar a UI/UX, tais como: 

- SharedPreferences: storage local da DIO_AUTH_KEY.
- Envied: Manter em segurança qualquer chave externa com a utilização do '.env'.
- Loading_Animation_widget: Oferecer um loader personalizado e mais agradável.
- Cached_network_image: Após carregar a imagem uma vez ela fica em cache para acelerar futuras requisições do usuário.
- Flutter_asset_generator: Utilizado como um atalho para a classe de modelo dos assets fornecidos para o teste.


## Android Configs

```dart
Open android/settings.gradle
android {
        ndkVersion = "25.1.8937393"
        }

Open android/gradle/wrapper/gradle-wrapper.properties and change:

distributionUrl=https\://services.gradle.org/distributions/gradle-8.4-all.zip

Open android/settings.gradle and change:

    id "com.android.application" version "8.3.1" apply false
```



Após oconfigurar seu Android, basta criar um arquivo .env na raiz do projeto com a seguinte configuração: 

- BACKEND_BASE_URL=YOUR_KEY

Substitua 'YOUR_KEY' por seu ip interno ou externo para fazer acesso.



| dependencies | Version |
| ------ | ------ |
| Flutter | 3.24.4 |
| Dart | 3.5.4 |
| riverpod_annotation | ^2.6.1 |
| envied | ^1.2.1 |
| retrofit | ^4.5.0 |
| logger | ^2.7.0 |
| json_annotation | ^4.9.0 |
| dio | ^5.9.2 |
| loading_animation_widget | ^1.3.0 |
| cached_network_image | ^3.4.1 |
| asyncstate | ^2.1.0 |
| shared_preferences | ^2.5.3 |
| validatorless | ^1.2.5 |

| devDependencies | Version |
| ------ | ------ |
| riverpod_generator | ^2.6.3 |
| custom_lint | ^0.7.0 |
| riverpod_lint | ^2.6.3 |
| build_runner | ^2.4.13 |
| envied_generator | ^1.1.1 |
| retrofit_generator | ^9.1.5 |
| json_serializable | ^6.9.0 |