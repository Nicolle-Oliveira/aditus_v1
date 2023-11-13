// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aditus_v1/pages/chat/contacts_list.dart';
import 'package:aditus_v1/pages/home_page_s.dart';
import 'package:aditus_v1/pages/perfil_page.dart';
import 'package:flutter/material.dart';

import '../pages/configuration_page.dart';

class NavBarRootsS extends StatefulWidget {
  const NavBarRootsS({super.key});

  @override
  State<NavBarRootsS> createState() => _NavBarRootsSState();
}

class _NavBarRootsSState extends State<NavBarRootsS> {
  int _selectedIndex = 1;
  final _screens = [
    //Perfil Page
    PerfilPage(),
    //Home Page
    HomePageS(),
    //Chat Page
    ContactsList(),
    //Config Page
    ConfigPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 252, 252),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 251, 252, 252),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(255, 89, 96, 205),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Mensagem',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Configurações',
            ),
          ],
        ),
      ),
    );
  }
}
