import 'package:ecommercebonito/components/buttons/primary_button.dart';
import 'package:ecommercebonito/components/forms/auth_form_field.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/shared/constants/app_number_constants.dart';
import 'package:flutter/material.dart';

import '../../components/utils/vertical_spacer_box.dart';
import '../../shared/constants/app_enums.dart';

class AdressScreen extends StatelessWidget {
  const AdressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ecommerce Bonito',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Screens.profile);
            },
          ), //IconButton
        ],
        //IconButton
      ),
      body: Container(
          width: size.width,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const VerticalSpacerBox(size: SpacerSize.small),
                Row(
                  children: const [
                    Text(
                      'Adicione um novo endereço',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const VerticalSpacerBox(size: SpacerSize.large),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                        child: Column(children: [
                      Row(
                        children: const [
                          Text(
                            'Nome',
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      AuthFormField(
                          label: '',
                          isPassword: false,
                          inputType: TextInputType.streetAddress,
                          onChanged: (String value) {}),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Row(
                        children: const [
                          Text(
                            'Rua',
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      AuthFormField(
                          label: '',
                          isPassword: false,
                          inputType: TextInputType.streetAddress,
                          onChanged: (String value) {}),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Row(
                        children: const [
                          Text(
                            'Número',
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      AuthFormField(
                          label: '',
                          isPassword: false,
                          inputType: TextInputType.streetAddress,
                          onChanged: (String value) {}),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Row(
                        children: const [
                          Text(
                            'Cidade',
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      AuthFormField(
                          label: '',
                          isPassword: false,
                          inputType: TextInputType.text,
                          onChanged: (String value) {}),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Row(
                        children: const [
                          Text(
                            'Estado',
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      AuthFormField(
                          label: '',
                          isPassword: false,
                          inputType: TextInputType.streetAddress,
                          onChanged: (String value) {}),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Row(
                        children: const [
                          Text(
                            'Complemento',
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      AuthFormField(
                          label: '',
                          isPassword: false,
                          inputType: TextInputType.text,
                          onChanged: (String value) {}),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Row(
                        children: const [
                          Text(
                            'CEP',
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      AuthFormField(
                          label: '',
                          isPassword: false,
                          inputType: TextInputType.number,
                          onChanged: (String value) {}),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Container(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: PrimaryButton(
                          text: 'Salvar',
                          onPressed: () {},
                          color: Colors.green,
                        ),
                      ),
                    ])))
              ],
            ),
          )),
    );
  }
}
