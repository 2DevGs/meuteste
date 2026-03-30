import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste_imobi_brasil/src/core/ui/helpers/form_helper.dart';
import 'package:teste_imobi_brasil/src/core/ui/helpers/messages.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/colors_constants.dart';
import 'package:teste_imobi_brasil/src/features/auth/register/user/user_register_viewmodel.dart';
import 'package:validatorless/validatorless.dart';

class UserRegisterPage extends ConsumerStatefulWidget {
  const UserRegisterPage({super.key});

  @override
  ConsumerState<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends ConsumerState<UserRegisterPage>
    with Messages {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userRegisterVM = ref.watch(userRegisterViewmodelProvider.notifier);
    ref.listen(
      userRegisterViewmodelProvider,
      (_, state) {
        switch (state) {
          case UserRegisterStateStatus.initial:
            break;
          case UserRegisterStateStatus.success:
            showSuccessSnackBar('Registro realizado com sucesso.');
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/home',
              (route) => false,
            );
          case UserRegisterStateStatus.error:
            showErrorSnackBar('Erro ao registrar usuário!');
        }
      },
    );
    return Scaffold(
      backgroundColor: ColorsConstants.fundo,
      appBar: AppBar(
        title: const Text('Criar conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  controller: _nameEC,
                  validator: Validatorless.required('Nome obrigatório.'),
                  decoration: const InputDecoration(
                    label: Text('Nome'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  controller: _emailEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('E-mail obrigatório.'),
                    Validatorless.email('E-mail inválido.'),
                  ]),
                  decoration: const InputDecoration(
                    label: Text('E-mail'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  controller: _passwordEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha obrigatória.'),
                    Validatorless.min(
                        6, 'Senha deve conter no minimo 6 caracteres.'),
                  ]),
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text('Senha'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha obrigatória.'),
                    Validatorless.min(
                        6, 'Senha deve conter no minimo 6 caracteres.'),
                    Validatorless.compare(_passwordEC,
                        'As senhas não correspondem, digite novamente.')
                  ]),
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text('Confirmar senha'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(56)),
                  onPressed: () {
                    switch (_formKey.currentState?.validate()) {
                      case null || false:
                        showErrorSnackBar(
                            'Campos inválidos, por favor confira as informações!');
                      case true:
                        userRegisterVM.register(
                          name: _nameEC.text,
                          email: _emailEC.text,
                          password: _passwordEC.text,
                        );
                    }
                  },
                  child: const Text('Criar Conta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
