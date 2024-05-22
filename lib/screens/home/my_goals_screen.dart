import 'package:flutter/material.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        'title': 'Doenças Cardíacas',
        'image': 'assets/icons/home_icons/center/heart.png',
      },
    ];

    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const SizedBox(
            width: 40,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  controller: searchController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    hintText: 'Procurar...',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(31),
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 0.9,
              ),
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        child: Image.asset(
                          cardData[index]['image']!,
                          fit: BoxFit.cover,
                          height:
                              100, // Adjust this value to change image height
                          width: 100,
                          color: const Color.fromARGB(255, 250, 128, 128),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          cardData[index]['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 117, 117, 117),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
