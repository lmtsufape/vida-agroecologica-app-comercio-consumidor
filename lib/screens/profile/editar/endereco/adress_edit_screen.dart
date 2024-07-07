// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:ecommerceassim/shared/validation/validate_mixin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ecommerceassim/components/utils/vertical_spacer_box.dart';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:ecommerceassim/components/appBar/custom_app_bar.dart';
import 'package:ecommerceassim/components/buttons/primary_button.dart';
import 'package:ecommerceassim/components/forms/address_form_field.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';
import 'package:ecommerceassim/shared/core/models/bairro_model.dart';
import 'package:ecommerceassim/shared/core/models/cidade_model.dart';
import 'package:ecommerceassim/shared/core/repositories/sign_up_repository.dart';

class AdressEditScreen extends StatefulWidget {
  const AdressEditScreen({super.key});

  @override
  State<AdressEditScreen> createState() => _AdressEditScreenState();
}

class _AdressEditScreenState extends State<AdressEditScreen>
    with ValidationMixin {
  int? _selectedCityId;
  int? _selectedBairroId;
  List<CidadeModel> _cidades = [];
  List<BairroModel> _bairros = [];
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();
  String _addressId = "";
  String? errorMessage;
  bool _isEditing = false;

  final _formKey = GlobalKey<FormState>();

  SignUpRepository signUpRepository = SignUpRepository();
  final MaskTextInputFormatter _cepMaskFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (arguments != null) {
        _addressId = arguments['id'].toString();
        _ruaController.text = arguments['rua'] ?? '';
        _numeroController.text = arguments['numero'] ?? '';
        _cepController.text = arguments['cep'] ?? '';
        _complementoController.text = arguments['complemento'] ?? '';

        _selectedCityId = int.tryParse(arguments['cidadeId'].toString());
        _selectedBairroId = int.tryParse(arguments['bairroId'].toString());
      }

      await _loadData();
    });
  }

  Future<void> _loadData() async {
    List<CidadeModel> cidades = await signUpRepository.getCidades();
    setState(() {
      _cidades = cidades;
    });

    if (_selectedCityId != null && _selectedCityId != 0) {
      await _loadBairros(_selectedCityId!);
    }
  }

  Future<void> _loadBairros(int cidadeId) async {
    List<BairroModel> bairros =
        await signUpRepository.getBairrosByCidade(cidadeId);
    setState(() {
      _bairros = bairros;
      _selectedBairroId =
          _selectedBairroId ?? (bairros.isNotEmpty ? bairros.first.id : null);
    });
  }

  Future<void> _updateEndereco() async {
    if (!_isEditing) return;

    UserStorage userStorage = UserStorage();
    String userToken = await userStorage.getUserToken();

    final url = Uri.parse("$kBaseURL/users/enderecos/$_addressId");
    final response = await http.patch(
      url,
      body: json.encode({
        "rua": _ruaController.text,
        "cep": _cepController.text,
        "numero": _numeroController.text,
        "complemento": _complementoController.text,
        "bairro_id": _selectedBairroId,
      }),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken",
      },
    );

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, Screens.selectAdress);
    } else {
      setErrorMessage('Erro ao atualizar endereço.');
    }

    setState(() {
      _isEditing = false;
    });
  }

  void setErrorMessage(String value) {
    setState(() {
      errorMessage = value;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        errorMessage = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: Container(
        color: kOnSurfaceColor,
        width: size.width,
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VerticalSpacerBox(size: SpacerSize.small),
              const Row(
                children: [
                  Text(
                    'Editar endereço',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Cidade',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<int>(
                            value: _selectedCityId,
                            onChanged: _isEditing
                                ? (int? value) async {
                                    if (value != null) {
                                      setState(() {
                                        _selectedCityId = value;
                                        _selectedBairroId = null;
                                        _bairros = [];
                                      });
                                      await _loadBairros(value);
                                    }
                                  }
                                : null,
                            items: _cidades.map((cidade) {
                              return DropdownMenuItem<int>(
                                value: cidade.id!,
                                child: Text(
                                  cidade.nome ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal),
                                ),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[300],
                              contentPadding:
                                  const EdgeInsets.fromLTRB(13, 13, 13, 13),
                            ),
                            validator: (value) => isValidCidade(value),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Bairro',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<int>(
                            value: _selectedBairroId,
                            items: _bairros.map((bairro) {
                              return DropdownMenuItem<int>(
                                value: bairro.id!,
                                child: Text(
                                  bairro.nome ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal),
                                ),
                              );
                            }).toList(),
                            onChanged: _isEditing
                                ? (int? value) {
                                    setState(() {
                                      _selectedBairroId = value;
                                    });
                                  }
                                : null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[300],
                              contentPadding:
                                  const EdgeInsets.fromLTRB(13, 13, 13, 13),
                            ),
                            validator: (value) => isValidBairro(value),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rua',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AddressFormField(
                            controller: _ruaController,
                            label: 'Rua',
                            enabled: _isEditing,
                            keyboardType: TextInputType.text,
                            validateForm: (value) => isValidRua(value),
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Número',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AddressFormField(
                            controller: _numeroController,
                            label: 'Número',
                            enabled: _isEditing,
                            keyboardType: TextInputType.number,
                            validateForm: (value) => isValidNumero(value),
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'CEP',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextField(
                            controller: _cepController,
                            keyboardType: TextInputType.number,
                            enabled: _isEditing,
                            inputFormatters: [_cepMaskFormatter],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[300],
                              contentPadding:
                                  const EdgeInsets.fromLTRB(13, 13, 13, 13),
                            ),
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Complemento',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AddressFormField(
                            controller: _complementoController,
                            label: 'Complemento',
                            enabled: _isEditing,
                            keyboardType: TextInputType.text,
                            validateForm: (value) => isValidComplemento(value),
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.large),
                      PrimaryButton(
                        text: _isEditing ? 'Salvar' : 'Editar',
                        onPressed: _isEditing
                            ? () {
                                if (_formKey.currentState!.validate() == true) {
                                  _updateEndereco();
                                }
                              }
                            : _toggleEdit,
                        color: kDetailColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ruaController.dispose();
    _numeroController.dispose();
    _cepController.dispose();
    _complementoController.dispose();
    super.dispose();
  }
}
