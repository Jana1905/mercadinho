import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget { 
  // ctrl + ponto inverte a classe
  //Variavéis  - converteu a classe para ter um estado, não pode ser stateless
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;

  const CustomTextField({ // classe pode ser constante
    Key? key,
    required this.icon, // para deixar de ser opcional use required
    required this.label, // para deixar de ser opcional use required
    this.isSecret = false,
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
  }) : super(key: key);
  // Shift + alt + F - Formatar e ficar mais legível (bonitinho rs)

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() { //metódo da classe stateful initstate inicia antes do widget
    super.initState();

    isObscure = widget.isSecret; // acessar a classe de cima (widget.isSecret)
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15), // espaçamento somente em um lado (embaixo)
      child: TextFormField(
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure, // quando digitar sumir e ficar secreto
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon), // recebendo por parametro
          suffixIcon: widget.isSecret // suffixIcon é o olhinho na senha
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure; // negação para receber valor inverso
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off), //condicional ternária
                ) // ? é o true
              : null, // : é o else
          labelText: widget.label,
          isDense: true, // mais denso, mais baixo não tem tanto espaço nas linhas
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            //bordas arredondadas nos campos
          ),
        ),
      ),
    );
  }
}
