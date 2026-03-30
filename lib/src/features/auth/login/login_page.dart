import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste_imobi_brasil/src/core/ui/helpers/form_helper.dart';
import 'package:teste_imobi_brasil/src/core/ui/helpers/messages.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/colors_constants.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/resource.dart';
import 'package:teste_imobi_brasil/src/features/auth/login/login_state.dart';
import 'package:teste_imobi_brasil/src/features/auth/login/login_viewmodel.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> with Messages {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginViewmodel(:login) = ref.watch(loginViewmodelProvider.notifier);
    ref.listen(
      loginViewmodelProvider,
      (_, state) {
        switch (state) {
          case LoginState(status: LoginStateStatus.initial):
            break;
          case LoginState(status: LoginStateStatus.success):
            showSuccessSnackBar('Login realizado com sucesso.');
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/home',
              (route) => false,
            );
            break;
          case LoginState(status: LoginStateStatus.error):
            showErrorSnackBar(
                'Erro ao realizar login, email ou senha inválidos!');
        }
      },
    );

    return Scaffold(
      backgroundColor: ColorsConstants.primaria,
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.black.withAlpha(600),
          child: Padding(
            padding: const EdgeInsets.all(45),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              R.ASSETS_IMAGES_ICONE_ORIGINAL_IMOBIBRASIL_PNG),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: _emailEC,
                            onTapOutside: (_) => unfocus(context),
                            validator: Validatorless.multiple([
                              Validatorless.required('E-mail obrigatório'),
                              Validatorless.email('E-mail inválido'),
                            ]),
                            decoration: const InputDecoration(
                              label: Text('E-mail'),
                              hintText: 'E-mail',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle: TextStyle(color: Colors.black),
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: _passwordEC,
                            onTapOutside: (_) => unfocus(context),
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigatória'),
                              Validatorless.min(6, 'Senha inválida'),
                            ]),
                            obscureText: true,
                            decoration: const InputDecoration(
                              label: Text('Senha'),
                              hintText: 'Senha',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle: TextStyle(color: Colors.black),
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size.fromHeight(56),
                            ),
                            onPressed: () {
                              switch (_formKey.currentState?.validate()) {
                                case (false || null):
                                  showErrorSnackBar(
                                      'Campos inválidos, verifique se as informações estão válidas!');
                                  break;
                                case true:
                                  login(_emailEC.text, _passwordEC.text);
                              }
                            },
                            child: const Text('Acessar'),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/auth/register/user');
                          },
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
