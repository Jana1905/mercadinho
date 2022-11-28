import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/cart/cart_tab.dart';
import 'package:greengrocer/src/pages/home/home_tab.dart';
import 'package:greengrocer/src/pages/orders/orders_tab.dart';
import 'package:greengrocer/src/pages/profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController(); // controlador da page view

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView( // visualização paginada
        physics: const NeverScrollableScrollPhysics(), // travar a tela puxando do lado
        controller: pageController, 
        children: const [ // todas as telas do aplicativo
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar( 
        currentIndex: currentIndex, // valor defullt é zero
        onTap: (index) {
          setState(() { // mudar um estado da aplicação quando clicar em um botão
            currentIndex = index;
            pageController.jumpToPage(index); // fazer um pulo até a pagina em questão
            // pageController.animateToPage(
            //   index,
            //   duration: const Duration(milliseconds: 500),
            //   curve: Curves.easeInOutQuart,
            // );
          });
        },
        type: BottomNavigationBarType.fixed, // documentação do bottomnavig quando tem mais de 3 icones usar o type
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white, // icone seleciona fica branco 
        unselectedItemColor: Colors.white.withAlpha(100), // não selecionado branco mais claro
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'perfil',
          ),
        ],
      ),
    );
  }
}
