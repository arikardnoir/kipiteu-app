import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                color: Colors.white,
                icon: Image.asset(
                  'assets/icons/account_icons/ring.png',
                  width: 30,
                  height: 30,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              color: Colors.grey,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nome',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'DEFINIÇOES DA CONTA',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/payment.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Formas pagamento',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    // Ação ao clicar em "Payment options"
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/notify.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Notificações',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    // Ação ao clicar em "Notification preferences"
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/personal.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Informações pessoais',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    // Ação ao clicar em "Personal information"
                  },
                ),
                //const Divider(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'AJUDA E SUPORTE',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/asks.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Perguntas frequentes',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    // Ação ao clicar em "My dashboard"
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/talk.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Fale conosco',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                //const Divider(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'SEGURANÇA',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/legal.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Assuntos legais',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    // Ação ao clicar em "My dashboard"
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/safety.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Dados e proteção',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/icons/account_icons/exit.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Sair',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    // Ação ao clicar em "List my services"
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 60);
    var secondEndPoint = Offset(size.width, size.height - 20);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
