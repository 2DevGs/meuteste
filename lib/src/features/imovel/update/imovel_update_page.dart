import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste_imobi_brasil/src/core/ui/helpers/form_helper.dart';
import 'package:teste_imobi_brasil/src/core/ui/helpers/messages.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/colors_constants.dart';
import 'package:validatorless/validatorless.dart';

class ImovelUpdatePage extends ConsumerStatefulWidget {
  const ImovelUpdatePage({super.key});

  @override
  ConsumerState<ImovelUpdatePage> createState() => _ImovelUpdatePageState();
}

class _ImovelUpdatePageState extends ConsumerState<ImovelUpdatePage>
    with Messages {
  final _formKey = GlobalKey<FormState>();
  final _tituloEC = TextEditingController();
  final _descricaoEC = TextEditingController();
  final _tipoEC = TextEditingController();
  final _precoEC = TextEditingController();
  final _cidadeEC = TextEditingController();
  final _bairroEC = TextEditingController();
  final _quartosEC = TextEditingController();
  final _banheirosEC = TextEditingController();
  final _vagasEC = TextEditingController();
  final _areaEC = TextEditingController();
  final _fotoEC = TextEditingController();

  @override
  void dispose() {
    _tituloEC.dispose();
    _descricaoEC.dispose();
    _tipoEC.dispose();
    _precoEC.dispose();
    _cidadeEC.dispose();
    _bairroEC.dispose();
    _quartosEC.dispose();
    _banheirosEC.dispose();
    _vagasEC.dispose();
    _areaEC.dispose();
    _fotoEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.fundo,
      appBar: AppBar(
        title: const Text('Editar imóvel'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 19,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  controller: _tituloEC,
                  validator: Validatorless.required('Titulo obrigatório'),
                  decoration: const InputDecoration(
                    label: Text('Nome do imóvel(Apartamento, casa, etc..)'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  validator: Validatorless.required('Descrição obrigatória'),
                  controller: _descricaoEC,
                  decoration: const InputDecoration(
                    label: Text('Descrição'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  validator:
                      Validatorless.required('Informar tipo obrigatório'),
                  controller: _tipoEC,
                  onChanged: (value) {
                    final lower = value.toLowerCase();
                    if (value != lower) {
                      _tipoEC.value = _tipoEC.value.copyWith(
                        text: lower,
                        selection:
                            TextSelection.collapsed(offset: lower.length),
                      );
                    }
                  },
                  decoration: const InputDecoration(
                    label: Text('Tipo(Aluguel ou venda)'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  validator:
                      Validatorless.required('Informar preço obrigatório'),
                  controller: _precoEC,
                  decoration: const InputDecoration(
                    label: Text('Preço'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  validator: Validatorless.required(
                      'Informar cidade/logradouro obrigatório'),
                  controller: _cidadeEC,
                  decoration: const InputDecoration(
                    label: Text('Cidade'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  validator:
                      Validatorless.required('Informar bairro obrigatório'),
                  controller: _bairroEC,
                  decoration: const InputDecoration(
                    label: Text('Bairro'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  validator: Validatorless.multiple([
                    Validatorless.required(
                        'Informar nº de quartos obrigatório'),
                    Validatorless.number(
                        'Este campo deve ser preenchido apenas com números!'),
                  ]),
                  controller: _quartosEC,
                  decoration: const InputDecoration(
                    label: Text('Nº Quartos'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  validator: Validatorless.multiple([
                    Validatorless.required(
                        'Informar nº de banheiros obrigatório'),
                    Validatorless.number(
                        'Este campo deve ser preenchido apenas com números!'),
                  ]),
                  controller: _banheirosEC,
                  decoration: const InputDecoration(
                    label: Text('Nº Banheiros'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  validator: Validatorless.multiple([
                    Validatorless.required('Informar nº de vagas obrigatório'),
                    Validatorless.number(
                        'Este campo deve ser preenchido apenas com números!'),
                  ]),
                  controller: _vagasEC,
                  decoration: const InputDecoration(
                    label: Text('Nº Vagas'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  validator: Validatorless.multiple([
                    Validatorless.required('Informar área obrigatória'),
                    Validatorless.number(
                        'Este campo deve ser preenchido apenas com números!'),
                  ]),
                  controller: _areaEC,
                  decoration: const InputDecoration(
                    label: Text('Area(em m²)'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onTapOutside: (_) => unfocus(context),
                  validator:
                      Validatorless.required('Link de imagem obrigatório'),
                  controller: _fotoEC,
                  decoration: const InputDecoration(
                    label: Text('Link de imagem'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size.fromHeight(56),
                    ),
                    onPressed: () {
                      switch (_formKey.currentState?.validate()) {
                        case (false || null):
                          showErrorSnackBar(
                              'Campos inválidos, verifique se todos os campos estão preenchidos!');
                          break;
                        case true:

                          //convertendo instancia de preço para double
                          final text1 = _precoEC.text.trim();
                          int intValue = int.parse(text1);
                          double precoConvertido = intValue.toDouble();

                          //convertendo intancia de area para double
                          final text2 = _areaEC.text.trim();
                          int intValue2 = int.parse(text2);
                          double areaConvertida = intValue2.toDouble();

                          //converções em int
                          int quartos = int.parse(_quartosEC.text);
                          int banheiros = int.parse(_quartosEC.text);
                          int vagas = int.parse(_quartosEC.text);
                      }
                    },
                    child: const Text('Cadastrar imóvel'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
