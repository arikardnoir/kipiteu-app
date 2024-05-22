// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:kipiteu_app/screens/home/account_screen.dart';
import 'package:kipiteu_app/screens/home/goals_screen.dart';
import 'package:kipiteu_app/screens/home/search_screen.dart';
import 'package:kipiteu_app/screens/preferences/preferences_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _slidePageController;
  int _currentSlide = 0;
  final List<String> _slideImages = [
    'assets/images/cards/food2.jpg',
    'assets/images/cards/food3.jpg',
    'assets/images/cards/food1.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _slidePageController = PageController();
  }

  @override
  void dispose() {
    _slidePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            _buildHomeScreen(),
            const SearchScreen(),
            const GoalsScreen(),
            const AccountScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              height: 80,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/icons/home_icons/bottom/home.png',
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Tab(
              height: 80,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/icons/home_icons/bottom/search.png',
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    'Procurar',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Tab(
              height: 80,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/icons/home_icons/bottom/prefs.png',
                      color: Colors.grey,
                    ),
                  ),
                  const Text('Metas',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
            Tab(
              height: 80,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/icons/home_icons/bottom/user.png',
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    'Eu',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeScreen() {
    final List<Map<String, String>> cardData = [
      {
        'title': 'Diabetes',
        'image': 'assets/icons/home_icons/center/diabetes.png',
      },
      {
        'title': 'Perder peso',
        'image': 'assets/icons/home_icons/center/lessweight.png',
      },
      {
        'title': 'Bebês',
        'image': 'assets/icons/home_icons/center/baby.png',
      },
      {
        'title': 'AVC',
        'image': 'assets/icons/home_icons/center/avc.png',
      },
      {
        'title': 'Sem glúten',
        'image': 'assets/icons/home_icons/center/gluten.png',
      },
      {
        'title': 'Ganhar peso',
        'image': 'assets/icons/home_icons/center/moreweight.png',
      },
      {
        'title': 'Vegetariano',
        'image': 'assets/icons/home_icons/center/vegan.png',
      },
      {
        'title': 'Cardíacos',
        'image': 'assets/icons/home_icons/center/heart.png',
      },
      {
        'title': 'Sem glúten',
        'image': 'assets/icons/home_icons/center/gluten.png',
      },
      {
        'title': 'Ganhar peso',
        'image': 'assets/icons/home_icons/center/moreweight.png',
      },
      {
        'title': 'Vegetariano',
        'image': 'assets/icons/home_icons/center/vegan.png',
      },
      {
        'title': 'Cardíacos',
        'image': 'assets/icons/home_icons/center/heart.png',
      },
      {
        'title': 'Sem glúten',
        'image': 'assets/icons/home_icons/center/gluten.png',
      },
      {
        'title': 'Ganhar peso',
        'image': 'assets/icons/home_icons/center/moreweight.png',
      },
      {
        'title': 'Vegetariano',
        'image': 'assets/icons/home_icons/center/vegan.png',
      },
      {
        'title': 'Cardíacos',
        'image': 'assets/icons/home_icons/center/heart.png',
      },
      {
        'title': 'Sem glúten',
        'image': 'assets/icons/home_icons/center/gluten.png',
      },
      {
        'title': 'Ganhar peso',
        'image': 'assets/icons/home_icons/center/moreweight.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    color: Colors.white,
                    icon: Image.asset(
                      'assets/icons/account_icons/ring.png',
                      width: 30,
                      height: 30,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 210,
            child: PageView.builder(
              itemCount: _slideImages.length,
              controller: _slidePageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentSlide = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      _slideImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          DotsIndicator(
            dotsCount: _slideImages.length,
            position: _currentSlide,
            decorator: DotsDecorator(
              color: Colors.grey,
              activeColor: Colors.redAccent,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              spacing: const EdgeInsets.symmetric(horizontal: 5.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Definindo 3 colunas
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1,
              ),
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // Adicione aqui o código para a ação desejada ao clicar no card
                      print("Card ${cardData[index]['title']} clicked!");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PreferencesScreen(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Image.asset(
                              cardData[index]['image']!,
                              fit: BoxFit.cover,
                              height:
                                  60, // Ajuste para reduzir o tamanho da imagem
                              width: 60,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              cardData[index]['title']!,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}






















           /* Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '23',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ), */