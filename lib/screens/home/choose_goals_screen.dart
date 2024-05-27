// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:kipiteu_app/screens/preferences/preferences_screen.dart';

class ChooseGoalsScreen extends StatelessWidget {
  const ChooseGoalsScreen({Key? key});

  Widget _buildCard(BuildContext context, String imagePath, String title,
      String description) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: Colors.grey, // Define a cor da borda como cinza
            width: 1.0, // Define a largura da borda
          ),
        ),
        color: Colors.white, // Define a cor de fundo do Card como branco
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            height: 80, // Reduced height
                            width: 80, // Reduced width
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              description,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PreferencesScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            const Spacer(),
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
              height: 60,
            ),
            _buildCard(
              context,
              'assets/icons/home_icons/center/diabetes.png',
              'DIABETES',
              'Receitas saudáveis e deliciosas!!!',
            ),
            _buildCard(
              context,
              'assets/icons/home_icons/center/lessweight.png',
              'PERDER PESO',
              'Receitas para manter seu coração saudável!!!',
            ),
            _buildCard(
              context,
              'assets/icons/home_icons/center/baby.png',
              'BEBÊS',
              'Receitas para manter seu coração saudável!!!',
            ),
            _buildCard(
              context,
              'assets/icons/home_icons/center/heart.png',
              'AVC',
              'Receitas para manter seu coração saudável!!!',
            ),
            _buildCard(
              context,
              'assets/icons/home_icons/center/gluten.png',
              'SEM GLUTEN',
              'Receitas para manter seu coração saudável!!!',
            ),
            _buildCard(
              context,
              'assets/icons/home_icons/center/moreweight.png',
              'GANHAR PESO',
              'Receitas para manter seu coração saudável!!!',
            ),
            _buildCard(
              context,
              'assets/icons/home_icons/center/heart.png',
              'SAÚDE CARDÍACA',
              'Receitas para manter seu coração saudável!!!',
            ),
            _buildCard(
              context,
              'assets/icons/home_icons/center/vegan.png',
              'VEGETARIANO',
              'Receitas para manter seu coração saudável!!!',
            ),
            _buildCard(
              context,
              'assets/icons/home_icons/center/gluten.png',
              'SEM GLUTEN',
              'Receitas para manter seu coração saudável!!!',
            ),
          ],
        ),
      ),
    );
  }
}
