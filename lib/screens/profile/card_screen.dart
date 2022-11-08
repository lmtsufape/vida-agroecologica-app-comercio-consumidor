import 'package:ecommercebonito/components/forms/auth_form_field.dart';
import 'package:ecommercebonito/components/forms/auth_form_field3.dart';
import 'package:ecommercebonito/components/utils/horizontal_spacer_box.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/shared/constants/app_number_constants.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';

import '../../components/buttons/primary_button.dart';
import '../../components/forms/auth_form_field2.dart';
import '../../components/utils/vertical_spacer_box.dart';
import '../../shared/constants/app_enums.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? mes = 'Selecione';
    String? ano = 'Selecione';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ecommerce Bonito',
          style: TextStyle(color: kOnSurfaceColor),
        ),
        centerTitle: true,
        backgroundColor: kDetailColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: kOnSurfaceColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Screens.profile);
            },
          ), //IconButton
        ],
        //IconButton
      ),
      body: Container(
          color: kOnSurfaceColor,
          width: size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const VerticalSpacerBox(size: SpacerSize.small),
              Row(
                children: const [
                  Text(
                    'Adicione um novo cartão',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                          'Nome do cartão',
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
                          'Número do cartão',
                        ),
                        Spacer(),
                        Text(
                          'CVV',
                        ),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    Row(
                      children: [
                        AuthFormField3(
                            label: '',
                            isPassword: false,
                            inputType: TextInputType.streetAddress,
                            onChanged: (String value) {}),
                        const HorizontalSpacerBox(size: SpacerSize.small),
                        AuthFormField2(
                            label: '',
                            isPassword: false,
                            inputType: TextInputType.streetAddress,
                            onChanged: (String value) {}),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    Row(
                      children: const [
                        Text(
                          'Data de expiração',
                        ),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    DropdownButtonFormField(
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: kText),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: kDetailColor,
                            ),
                          ),
                          alignLabelWithHint: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Mês',
                          hintStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: kText),
                        ),
                        value: mes,
                        items: const [
                          DropdownMenuItem(
                              value: 'Selecione', child: Text('01')),
                          DropdownMenuItem(value: '02', child: Text('02')),
                          DropdownMenuItem(value: '03', child: Text('03')),
                          DropdownMenuItem(
                              // ignore: sort_child_properties_last
                              value: '04',
                              child: Text('04')),
                          DropdownMenuItem(value: '05', child: Text('05')),
                          DropdownMenuItem(value: '06', child: Text('06')),
                          DropdownMenuItem(value: '07', child: Text('07')),
                          DropdownMenuItem(value: '08', child: Text('08')),
                          DropdownMenuItem(value: '09', child: Text('09')),
                          DropdownMenuItem(
                              // ignore: sort_child_properties_last
                              value: '10',
                              child: Text('10')),
                          DropdownMenuItem(value: '11', child: Text('11')),
                          DropdownMenuItem(value: '12', child: Text('12')),
                        ],
                        onChanged: (String? value) {
                          mes = value;

                          // _controller.setCategoria(value);
                        }),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    DropdownButtonFormField(
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: kText),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: kDetailColor,
                            ),
                          ),
                          alignLabelWithHint: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Ano',
                          hintStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: kText),
                        ),
                        value: ano,
                        items: const [
                          DropdownMenuItem(
                              value: 'Selecione', child: Text('2022')),
                          DropdownMenuItem(value: '2022', child: Text('2022')),
                          DropdownMenuItem(value: '2023', child: Text('2023')),
                          DropdownMenuItem(
                              // ignore: sort_child_properties_last
                              value: '2024',
                              child: Text('2024')),
                          DropdownMenuItem(value: '2025', child: Text('2025')),
                          DropdownMenuItem(value: '2026', child: Text('2026')),
                          DropdownMenuItem(value: '2027', child: Text('2027')),
                          DropdownMenuItem(value: '2028', child: Text('2028')),
                          DropdownMenuItem(value: '2029', child: Text('2029')),
                          DropdownMenuItem(
                              // ignore: sort_child_properties_last
                              value: '2030',
                              child: Text('2030')),
                        ],
                        onChanged: (String? value) {
                          ano = value;

                          // _controller.setCategoria(value);
                        }),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    PrimaryButton(
                      text: 'Salvar',
                      onPressed: () {
                        Navigator.pushNamed(context, Screens.selectAdress);
                      },
                      color: kButtom,
                    ),
                  ])))
            ],
          )),
    );
  }
}
