// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:vidaagroconsumidor/screens/screens_index.dart';
import 'package:vidaagroconsumidor/shared/components/bottomNavigation/bottom_navigation.dart';
import 'package:vidaagroconsumidor/shared/validation/validate_mixin.dart';
import 'package:flutter/material.dart';
import 'package:vidaagroconsumidor/components/buttons/primary_button.dart';
import 'package:vidaagroconsumidor/components/forms/custom_text_form_field.dart';
import 'package:vidaagroconsumidor/shared/constants/app_text_constants.dart';
import 'package:vidaagroconsumidor/shared/constants/style_constants.dart';
import 'package:vidaagroconsumidor/components/appBar/custom_app_bar.dart';
import 'package:vidaagroconsumidor/shared/core/user_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen>
    with ValidationMixin {
  final UserStorage userStorage = UserStorage();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  var phoneFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  bool isEditing = false;
  int selectedIndex = 3;
  bool isLoading = false;

  String originalName = '';
  String originalPhone = '';

  @override
  void initState() {
    super.initState();
    loadUserDetails();
  }

  void loadUserDetails() async {
    setState(() {
      isLoading = true;
    });

    try {
      final String userId = await userStorage.getUserId();
      final String token = await userStorage.getUserToken();
      final Uri url = Uri.parse('$kBaseURL/users/$userId');

      print('Fetching user details from: $url');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final user = data['user'];
        final contact = user['contato'];

        setState(() {
          originalName = user['name'];
          originalPhone = contact['telefone'];
          nameController.text = originalName;
          phoneController.text = originalPhone;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao carregar dados do usuário'),
            backgroundColor: Colors.red,
          ),
        );
        print('Failed to load user details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao conectar com o servidor'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error fetching user details: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> saveUserProfile(String newName, String newPhone) async {
  setState(() {
    isLoading = true;
  });

  final String oldName = nameController.text;
  final String oldPhone = phoneController.text;

  try {
    final String userId = await userStorage.getUserId();
    final String token = await userStorage.getUserToken();
    final Uri url = Uri.parse('$kBaseURL/users/$userId');

    // Buscando o email atual do usuário antes de atualizar
    final userResponse = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (userResponse.statusCode == 200) {
      final userData = json.decode(userResponse.body);
      final currentEmail = userData['user']['email'];

      final response = await http.patch(
        url,
        body: json.encode({
          'name': newName,
          'email': currentEmail, // Mantendo o email atual
          'ativo': true, // Campo obrigatório
          'telefone': newPhone, // Enviando telefone diretamente
          'roles': [5]
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        await userStorage.saveUserCredentials(
          id: userId,
          token: token,
          nome: newName,
        );

        setState(() {
          originalName = newName;
          originalPhone = newPhone;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Perfil atualizado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacementNamed(context, Screens.profile);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao atualizar o perfil: ${response.body}'),
            backgroundColor: Colors.red,
          ),
        );
        revertChanges(oldName, oldPhone);
      }
    } else {
      throw Exception('Erro ao buscar dados do usuário');
    }
  } catch (e) {
    print('Error saving user profile: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Erro ao conectar com o servidor. Tente novamente.'),
        backgroundColor: Colors.red,
      ),
    );
    revertChanges(oldName, oldPhone);
  } finally {
    setState(() {
      isLoading = false;
    });
  }
}

  void revertChanges(String oldName, String oldPhone) {
    setState(() {
      nameController.text = oldName;
      phoneController.text = oldPhone;
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: BottomNavigation(paginaSelecionada: 3),
      body: Material(
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey.shade300,
                          child: const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Nome*',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          enabled: isEditing,
                          validateForm: (value) => isValidName(value),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Telefone*',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          maskFormatter: phoneFormatter,
                          enabled: isEditing,
                          validateForm: (value) => isValidPhone(value),
                        ),
                      ],
                    ),
                  ),
                  if (!isEditing)
                    PrimaryButton(
                      onPressed: () {
                        setState(() {
                          isEditing = true;
                        });
                      },
                      text: 'Editar Perfil',
                      color: kDetailColor,
                    ),
                  if (isEditing)
                    PrimaryButton(
                      onPressed: () {
                        saveUserProfile(nameController.text, phoneController.text);
                      },
                      text: 'Salvar',
                      color: kDetailColor,
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            if (isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}