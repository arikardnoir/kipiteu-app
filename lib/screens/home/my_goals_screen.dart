import 'package:flutter/material.dart';
import 'package:kipiteu_app/screens/home/categories_screen.dart';
import 'package:kipiteu_app/screens/recipes/recipe_screen.dart';

class MyGoalsSreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyGoalsSreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cardLasts = [
      {'image': 'assets/images/cards/goals_cards/goalscard1.jpg'},
      {'image': 'assets/images/cards/goals_cards/goalscard2.jpg'},
      {'image': 'assets/images/cards/goals_cards/goalscard3.jpg'},
      {'image': 'assets/images/cards/goals_cards/goalscard4.jpg'},
    ];

    final List<Map<String, String>> images = [
      {
        'image': 'assets/icons/plan_icons/numero1.png',
      },
      {
        'image': 'assets/icons/plan_icons/numero2.png',
      },
      {
        'image': 'assets/icons/plan_icons/numero3.png',
      },
      {
        'image': 'assets/icons/plan_icons/numero4.png',
      },
      {
        'image': 'assets/icons/plan_icons/numero5.png',
      },
      {
        'image': 'assets/icons/plan_icons/numero6.png',
      },
      {
        'image': 'assets/icons/plan_icons/numero7.png',
      },
    ];
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
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
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
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
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    images.map((card) => _buildCard(card, context)).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: cardLasts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Para si',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 170),
                          ],
                        ),
                        InkWell(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(10),
                            ),
                            child: Image.asset(
                              cardLasts[index]['image'] ??
                                  'assets/default_image.png',
                              fit: BoxFit.cover,
                              height: 180,
                              width: 380,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RecipeScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              cardLasts[index]['nome_receita'] ??
                                  'Nome da Receita',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 200),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              cardLasts[index]['categoria'] ?? 'Categoria',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 263),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  cardLasts[index]['tempo_duracao'] ?? '00:00',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              cardLasts[index]['nivel'] ?? 'Nível',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 276),
                            _buildRatingBar(
                              cardLasts[index]['avaliacao'] != null
                                  ? double.parse(cardLasts[index]['avaliacao']!)
                                  : 0.0,
                            ),
                          ],
                        ),
                      ],
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

  Widget _buildRatingBar(double rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          size: 14,
          color: Colors.redAccent,
        );
      }),
    );
  }

  Widget _buildCard(Map<String, String> card, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4 -
          16, // Ajuste a largura para se ajustar à tela
      margin: const EdgeInsets.symmetric(
          horizontal:
              1.0), // Adicione uma margem horizontal pequena para espaçamento
      child: Column(
        children: [
          InkWell(
            child: Card(
              color: Colors.white70,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
                side: const BorderSide(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(0),
                      ),
                      child: Image.asset(
                        card['image']!,
                        fit: BoxFit.cover,
                        height: 60, // Increased height
                        width: 60, // Increased width
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CategoryScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
