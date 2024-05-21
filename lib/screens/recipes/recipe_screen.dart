import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 230,
              width: double.infinity,
              child: Image.asset(
                'assets/images/costelas.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingredientes',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Container(
              width: 300,
              height: 170,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (ctx, index) {
                    return const Card(
                      color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text('Bghsgs ggyasgvh fs'),
                      ),
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Modo de preparo',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Container(
              width: 300,
              height: 170,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (ctx, index) {
                    return Column(children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: const Text('Stfsyfay gyayayvass erty'),
                      )
                    ]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
