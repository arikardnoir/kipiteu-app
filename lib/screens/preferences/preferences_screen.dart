import 'package:flutter/material.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  final TextEditingController searchController = TextEditingController();

  final _cardAds = [
    {'image': 'assets/images/cards/preferences_cards/ads1.jpg'},
    {'image': 'assets/images/cards/preferences_cards/ads1.jpg'},
    {'image': 'assets/images/cards/preferences_cards/ads1.jpg'},
    {'image': 'assets/images/cards/preferences_cards/ads1.jpg'},
  ];

  final _cardPops = [
    {'image': 'assets/images/cards/preferences_cards/pops1.jpg'},
    {'image': 'assets/images/cards/preferences_cards/pops1.jpg'},
    {'image': 'assets/images/cards/preferences_cards/pops1.jpg'},
    {'image': 'assets/images/cards/preferences_cards/pops1.jpg'},
  ];

  /*  final _cardLasts = [
    {'image': 'assets/images/cards/preferences_cards/ads1.jpg'},
    {'image': 'assets/images/cards/preferences_cards/ads1.jpg'},
    {'image': 'assets/images/cards/preferences_cards/ads1.jpg'},
    {'image': 'assets/images/cards/preferences_cards/ads1.jpg'},
  ];

   

   final _cardFasts = [
    {'image': 'assets/images/cards/preferences_cards/ads1.jpg'},
    {'image': 'assets/images/cards/preferences_cards/ads1.jpg'},
    {'image': 'assets/images/cards/preferences_cards/ads1.jpg'},
    {'image': 'assets/images/cards/preferences_cards/ads1.jpg'},
  ]; */

  final _cardData = [
    {
      'title': 'Café',
      'image': 'assets/images/cards/preferences_cards/matabicho.png'
    },
    {
      'title': 'Almoço',
      'image': 'assets/images/cards/preferences_cards/almoco.png'
    },
    {
      'title': 'Jantar',
      'image': 'assets/images/cards/preferences_cards/jantar.png'
    },
    {
      'title': 'Sobremesa',
      'image': 'assets/images/cards/preferences_cards/sobremesa.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    controller: searchController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      hintText: 'Procurar...',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(31),
                        borderSide: const BorderSide(color: Colors.black),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _cardData.map((card) => _buildCard(card)).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 240,
              //width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _cardAds.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31),
                      ),

                      // Espaçamento entre o card e o texto
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(10),
                            ),
                            child: Image.asset(
                              _cardAds[index]['image']!,
                              fit: BoxFit.cover,
                              height: 180,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            /* SizedBox(
              height: 230,
              //width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _cardPops.length,
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
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(10),
                            ),
                            child: Image.asset(
                              _cardPops[index]['image']!,
                              fit: BoxFit.cover,
                              height: 180,
                              width: 380,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ), */
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _cardPops.length,
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
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(10),
                            ),
                            child: Image.asset(
                              _cardPops[index]['image'] ??
                                  'assets/default_image.png',
                              fit: BoxFit.cover,
                              height: 180,
                              width: 380,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                _cardPops[index]['nome_receita'] ??
                                    'Nome da Receita',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 250),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _cardPops[index]['categoria'] ?? 'Categoria',
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
                                    _cardPops[index]['tempo_duracao'] ??
                                        '00:00',
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
                                _cardPops[index]['nivel'] ?? 'Nível',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 276),
                              _buildRatingBar(
                                _cardPops[index]['avaliacao'] != null
                                    ? double.parse(
                                        _cardPops[index]['avaliacao']!)
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
      ),
    );
  }

  Widget _buildCard(Map<String, String> card) {
    return Expanded(
      child: Column(
        children: [
          Card(
            color: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 0.1), // Reduzindo ainda mais o espaço inferior
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: Image.asset(
                      card['image']!,
                      fit: BoxFit.contain,
                      height: 90,
                      width: 90,
                    ),
                  ),
                  Text(
                    card['title']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(double rating) {
    // Este é um exemplo de barra de avaliação personalizada
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          size: 14,
          color: Colors.amber,
        );
      }),
    );
  }
}
