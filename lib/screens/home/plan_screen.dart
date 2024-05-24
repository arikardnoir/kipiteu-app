/* import 'package:flutter/material.dart';
import 'package:kipiteu_app/models/plans_model.dart';
import 'package:kipiteu_app/screens/preferences/preferences_screen.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  // Método para construir um cartão personalizado
  Widget _buildCard(Plan plan, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      child: SizedBox(
        height: 80,
        width: 350, // Fixed width for the card
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0), // Reduced padding
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            plan.imagePath,
                            fit: BoxFit.cover,
                            height: 50, // Reduced height
                            width: 50, // Reduced width
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const PreferencesScreen()),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0), // Reduced padding
                        child: Text(
                          plan.title,
                          style: const TextStyle(
                            fontSize: 16, // Reduced font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 3.0), // Reduced padding
                        child: Text(
                          plan.description,
                          style: TextStyle(
                            fontSize: 12, // Reduced font size
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 8,
              right: 8,
              child: Icon(
                Icons.lock,
                color: Colors.grey,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
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
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                          'assets/icons/home_icons/center/diabetes.png',
                          fit: BoxFit.cover,
                          height: 80, // Reduced height
                          width: 80, // Reduced width
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'DIABETES',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Receitas saudáveis e deliciosas!!!',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 640,
            child: SingleChildScrollView(
              child: Column(
                children:
                    plans.map((plan) => _buildCard(plan, context)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */