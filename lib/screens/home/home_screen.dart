import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  late TabController _tabController;
  int _currentIndex = 0;
  int _currentCard = 0;
  //int cardsPerRow = 5;

  final List<String> _images = [
    'assets/images/cards/food1.jpg',
    'assets/images/cards/food2.jpg',
    'assets/images/cards/food3.jpg',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          Container(
            height: kToolbarHeight, // Use the same height as the AppBar
            color: Colors.transparent,
            child: SizedBox(
              // Adicionando um Container para definir a largura
              width: double.infinity, // Largura igual à largura da tela
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
                    icon: Image.asset(
                      'assets/icons/home_icons/top/notification_icon.png',
                      width: 30,
                      height: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            // Container que envolve o PageView e os indicadores
            height: 230, // Defina uma altura específica aqui
            child: PageView.builder(
              itemCount: _images.length,
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentCard = page;
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
                      _images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          DotsIndicator(
            dotsCount: _images.length,
            position: _currentCard,
            decorator: DotsDecorator(
              color: Colors.grey, // Cor dos pontos não selecionados
              activeColor: Colors.redAccent, // Cor do ponto selecionado
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              spacing: const EdgeInsets.symmetric(horizontal: 5.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Número de linhas de cards
              itemBuilder: (context, index) {
                return Container(
                  height: 150, // Altura dos cards
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              // Adicione ação ao tocar no card aqui, se necessário
                            },
                            child: Center(
                              child: Text(
                                'Card ${index * 2 + 1}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              // Adicione ação ao tocar no card aqui, se necessário
                            },
                            child: Center(
                              child: Text(
                                'Card ${index * 2 + 2}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90.0,
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          indicator:
              const BoxDecoration(), // Define um BoxDecoration vazio para remover a barra de seleção
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
      height: 90,
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
                      Colors.black87,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      imagePath,
                      width: 60,
                      height: 60,
                      color: Colors.black87,
                    ),
                  )
                : Image.asset(
                    imagePath,
                    width: 60,
                    height: 60,
                    color: Colors.grey,
                  ),
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? Colors.black87
                  : Colors
                      .grey, // Altera a cor do texto dependendo se estiver selecionado ou não
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
