import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardLasts = [
      {'image': 'assets/images/cards/preferences_cards/lasts1.jpg'},
      {'image': 'assets/images/cards/preferences_cards/lasts1.jpg'},
      {'image': 'assets/images/cards/preferences_cards/lasts1.jpg'},
      {'image': 'assets/images/cards/preferences_cards/lasts1.jpg'},
      {'image': 'assets/images/cards/preferences_cards/lasts1.jpg'},
      {'image': 'assets/images/cards/preferences_cards/lasts1.jpg'},
      {'image': 'assets/images/cards/preferences_cards/lasts1.jpg'},
      {'image': 'assets/images/cards/preferences_cards/lasts1.jpg'},
      {'image': 'assets/images/cards/preferences_cards/lasts1.jpg'},
    ];
    final TextEditingController searchController = TextEditingController();
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
          child: Column(children: [
        const SizedBox(
          height: 60,
        ),
        SizedBox(
          height: 1000,
          child: ListView.builder(
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
                            'Recomendadas para si',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 170),
                        ],
                      ),
                      ClipRRect(
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
      ])),
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
