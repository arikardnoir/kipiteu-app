import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:kipiteu_app/screens/home/account_screen.dart';
import 'package:kipiteu_app/screens/home/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _slidePageController;
  int _currentSlide = 0;
  final List<String> _slideImages = [
    'assets/images/cards/food1.jpg',
    'assets/images/cards/food2.jpg',
    'assets/images/cards/food3.jpg',
  ];

  /*  final List<String> _cardData = [
    'assets/images/cards/card1.png',
    'assets/images/cards/card2.png',
  ];
 */
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
            Container(
              color: Colors.white,
              child: const Icon(Icons.home),
            ),
            const AccountScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicator: null,
          tabs: [
            Tab(
              height: 80,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child:
                        Image.asset('assets/icons/home_icons/bottom/home.png'),
                  ),
                  const Text('Home', style: TextStyle(fontSize: 12)),
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
                    ),
                  ),
                  const Text('Search', style: TextStyle(fontSize: 12)),
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
                    child:
                        Image.asset('assets/icons/home_icons/bottom/prefs.png'),
                  ),
                  const Text('Prefs', style: TextStyle(fontSize: 12)),
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
                    child:
                        Image.asset('assets/icons/home_icons/bottom/user.png'),
                  ),
                  const Text('User', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeScreen() {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                color: Colors.white,
                icon: Image.asset(
                  'assets/icons/account_icons/ring.png',
                  width: 20,
                  height: 20,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
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
            height: 95,
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[Row()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}














 /* Container(
            color: Colors.red,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Nome completo',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 5),
                TextButton.icon(
                  onPressed: () {
                    // Ação ao clicar em "Edit"
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('Editar',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ), */











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