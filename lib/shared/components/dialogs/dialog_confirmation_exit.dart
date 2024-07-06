// ignore_for_file: deprecated_member_use

import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';

class ExitAlert extends StatefulWidget {
  const ExitAlert({super.key, required this.child});

  final Widget child;

  @override
  State<ExitAlert> createState() => _ExitAlertState();
}

class _ExitAlertState extends State<ExitAlert> {
  Future<bool> _onWillPop() async {
    //Método de saída do usuário ( Alert )
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            // Alert Dialog irá ser a caixa de aviso caso o usuário queira sair
            title: const Text('Confirmação de Saída'),
            content: const Text(
                'Tem certeza que quer sair do aplicativo?'), // Conteúdo da caixa de diálogo
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor:
                      kDetailColor, //define a cor do background do botão
                ),
                onPressed: () => Navigator.of(context).pop(
                    false), //caso o usuário pressionar "Não" retorna um valor falso para o sistema e cancelará a operação
                child: const Text(
                  'Não',
                  style: TextStyle(
                    color: Colors.white, // cor do texto do botão
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kDetailColor,
                ),
                onPressed: () => Navigator.of(context).pop(
                    true), //caso o usuário pressionar "Sim" retorna um valor verdadeiro para o sistema e sairá do app
                child: const Text(
                  'Sim',
                  style: TextStyle(
                    color: Colors.white, // Cor do texto do botão
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    // Usar o WillPopScope para interceptar o evento de navegação para trás
    return WillPopScope(
      onWillPop:
          _onWillPop, //variável que recebe o valor booleano para sair ou não do app ( True / False)
      child: widget.child,
    );
  }
}
