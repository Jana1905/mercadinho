import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/common_widgets/app_name_widget.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/pages/auth/sign_up_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor, // cores referenciadas
      body: SingleChildScrollView( 
        // rolar a tela quando o teclado subir, a tela rola se o tamanho ultrapassar
        // aplica o scroll automatico
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // nome do aplicativo e animação no centro
                  children: [
                    // Nome do app
                    const AppNameWidget(
                      greenTitleColor: Colors.white,
                      textSize: 40,
                    ),

                    // Categorias
                    SizedBox(
                      height: 30, 
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        child: AnimatedTextKit( // animatedTextKit animação do texto - Plugin - pub.dev
                          pause: Duration.zero, // para categoria não demorar para aparecer a outra
                          repeatForever: true, // animação para repetir
                          animatedTexts: [ 
                            FadeAnimatedText('Frutas'), // todas as classes de animação tem no material pub.dev
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticíneos'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),//Column uma coisa em cima da outra
              ),// expanded expande seu filho ao máximo possivel dentro do widgets
              // flexíveis como a column

              // Formulário
              Container( // crescer até quando ele puder compor os seus filhos
                padding: const EdgeInsets.symmetric(
                  //symetric espaçamentos
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),// 45 é o tamanho da circunferencia
                  ),//Bordas arredondadas no eixo vertical
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, 
                  // alinhamento do eixo cruzado - stretch esticar o máximo possivel seus filhos
                  children: [
                    // Email
                    const CustomTextField(
                      // para duplicar shift alt + baixo
                      icon: Icons.email,
                      label: 'Email',
                    ),

                    // Senha
                    const CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true, // deixar a senha secreta
                    ),

                    // Botão de entrar
                    SizedBox( // possibilidade de altura / ou largura
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder( // shape mexer no corpo na forma do botão
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (c) {
                                // trocar a tela de signin pela tela base
                            return const BaseScreen();
                          }));
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 18, // tamanho do entrar escrito dentro do botão
                          ),
                        ),
                      ),
                    ),

                    // Esqueceu a senha
                    Align(
                      alignment: Alignment.centerRight, // colocar o botão esqueceu senha no centro mas na direita
                      child: TextButton( // botão que é um texto
                        onPressed: () {},
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: CustomColors.customContrastColor,
                          ),
                        ),
                      ),
                    ),

                    // Divisor
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row( // row colocar uma coisa do lado da outra
                        children: [
                          Expanded(
                            child: Divider( // divider é o divisor 
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('Ou'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2, // thickness é a espessura do divisor
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Botão de novo usuário
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom( // botão de bordas
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          side: const BorderSide(
                            width: 2, // largura das bordas
                            color: Colors.green,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push( // navagar até a tela de sign up
                            MaterialPageRoute(
                              builder: (c) { // (contexto chamamos de C)
                                return SignUpScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Criar conta',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
