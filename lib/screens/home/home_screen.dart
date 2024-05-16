import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  //int cardsPerRow = 5;

  List<String> newRealeases = [
    'assets/images/releases/release1.jpg',
    'assets/images/releases/release2.jpg',
    'assets/images/releases/release3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              height: kToolbarHeight, // Use the same height as the AppBar
              color: Colors.transparent,
              child: Row(
                children: [
                  const Spacer(),
                  const Spacer(), // Pushes the logo to the center
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/home_icons/logo.png',
                      height: 40,
                      width: 160,
                    ),
                  ),
                  const Spacer(), // Pushes the notifications icon to the right
                  IconButton(
                    onPressed: () {
                      // Add the action for the notifications icon here
                    },
                    icon: const Icon(Icons.notifications),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          indicator: null,
          tabs: [
            _buildTab('assets/icons/home_icons/bottom/home.png', 'Home', 0),
            _buildTab('assets/icons/home_icons/bottom/search.png', 'Buscar', 1),
            _buildTab(
                'assets/icons/home_icons/bottom/recipes.png', 'Receitas', 2),
            _buildTab(
                'assets/icons/home_icons/bottom/profile.png', 'Perfil', 3),
          ],
        ),
      ),
    );
  }

  Tab _buildTab(String imagePath, String label, int index) {
    bool isSelected = index == _currentIndex;
    return Tab(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: isSelected ? Colors.white : Colors.transparent,
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(8.0),
            child: isSelected
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      imagePath,
                      width: 60,
                      height: 60,
                      color: Colors.black,
                    ),
                  )
                : Image.asset(
                    imagePath,
                    width: 60,
                    height: 60,
                    color: const Color.fromARGB(255, 88, 88, 88),
                  ),
          ),
          const SizedBox(height: 4), // Espaçamento entre o ícone e o texto
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}























  /* Tab _buildTab(String imagePath, int index) {
    bool isSelected = index == _currentIndex;
    return Tab(
      icon: Container(
        color: isSelected
            ? Colors.white
            : Colors.transparent, // Define a cor de fundo do contêiner
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imagePath,
          width: 60,
          height: 60,
          color: isSelected
              ? Colors.black
              : const Color.fromARGB(255, 88, 88, 88), // Define a cor do ícone
        ),
      ),
    );
  } */

