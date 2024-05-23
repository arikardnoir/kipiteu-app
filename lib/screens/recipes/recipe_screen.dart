import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

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
        actions: [
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 290,
              width: double.infinity,
              child: Image.asset(
                'assets/images/cards/preferences_cards/lasts1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'Hambúrguer com maionese e barbecue sauce e batatas fritas',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Categoria',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 200),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '30 min',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Nível',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 222),
                  _buildRatingBar(0.0),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: ExpansionTile(
                trailing: Icon(Icons.arrow_downward),
                title: Text(
                  'Ingredientes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text('Ingrediente 1'),
                  ),
                  ListTile(
                    title: Text('Ingrediente 2'),
                  ),
                  ListTile(
                    title: Text('Ingrediente 3'),
                  ),
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: ExpansionTile(
                trailing: Icon(Icons.arrow_downward),
                title: Text(
                  'Modo de preparo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text('Passo 1'),
                  ),
                  ListTile(
                    title: Text('Passo 2'),
                  ),
                  ListTile(
                    title: Text('Passo 3'),
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBar(double rating) {
    // Este é um exemplo de barra de avaliação personalizada
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          size: 18,
          color: Colors.redAccent,
        );
      }),
    );
  }
}
