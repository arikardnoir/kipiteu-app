// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:kipiteu_app/models/category_model.dart';
import 'package:kipiteu_app/screens/account/account_screen.dart';
import 'package:kipiteu_app/screens/home/goals_screen.dart';
import 'package:kipiteu_app/screens/preferences/preferences_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late PageController _slidePageController;
  late TabController _tabController;

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _slidePageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildHomeScreen(),
            const GoalsScreen(),
            const AccountScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              height: 50, // Adjusted height
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: Image.asset(
                      'assets/icons/home_icons/bottom/home.png',
                      color:
                          _tabController.index == 0 ? Colors.red : Colors.grey,
                    ),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          _tabController.index == 0 ? Colors.red : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Tab(
              height: 50, // Adjusted height
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: Image.asset(
                      'assets/icons/home_icons/bottom/prefs.png',
                      color:
                          _tabController.index == 1 ? Colors.red : Colors.grey,
                    ),
                  ),
                  Text(
                    'Metas',
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          _tabController.index == 1 ? Colors.red : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Tab(
              height: 50, // Adjusted height
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: Image.asset(
                      'assets/icons/home_icons/bottom/user.png',
                      color:
                          _tabController.index == 2 ? Colors.red : Colors.grey,
                    ),
                  ),
                  Text(
                    'Eu',
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          _tabController.index == 2 ? Colors.red : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              // Rebuild to change the icon color
            });
          },
        ),
      ),
    );
  }

  Widget _buildHomeScreen() {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Card(
                color: Colors.white,
                elevation: 6,
                child: TextField(
                  controller: searchController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    hintText: '  Procurar...',
                    contentPadding: const EdgeInsets.all(9),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(31),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 270,
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
          const Row(children: [
            SizedBox(
              width: 17,
            ),
            Text(
              'Encontre a categoria que precisas!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ]),
          const SizedBox(
            height: 4,
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
                      color: const Color.fromARGB(255, 231, 229, 229),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 18,
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
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
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


/* 

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Home')),
          Center(child: Text('Metas')),
          Center(child: Text('Eu')),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        indicatorColor: Colors.white,
        tabs: [
          Tab(
            height: 50, // Adjusted height
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset(
                    'assets/icons/home_icons/bottom/home.png',
                    color: _tabController.index == 0 ? Colors.red : Colors.grey,
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
            height: 50, // Adjusted height
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset(
                    'assets/icons/home_icons/bottom/prefs.png',
                    color: _tabController.index == 1 ? Colors.red : Colors.grey,
                  ),
                ),
                const Text(
                  'Metas',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Tab(
            height: 50, // Adjusted height
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset(
                    'assets/icons/home_icons/bottom/user.png',
                    color: _tabController.index == 2 ? Colors.red : Colors.grey,
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
        onTap: (index) {
          setState(() {
            // Rebuild to change the icon color
          });
        },
      ),
    );
  }
}
 */