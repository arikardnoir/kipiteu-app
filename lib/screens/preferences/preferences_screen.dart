import 'package:flutter/material.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.7, // Set the desired width
                        height: MediaQuery.of(context).size.width * 0.1,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Pesquisar...',
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 12.0,
                            ),
                            hintStyle: const TextStyle(fontSize: 14.0),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 212, 211, 211),
                            border: OutlineInputBorder(
                              // Remove the border
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // Remove the focused border
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                            suffixIcon: const Icon(Icons.search),
                          ),
                          cursorColor: Colors.black,
                          cursorHeight: 15.0,
                          onChanged: (value) {
                            // Lógica de pesquisa
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            1, // Set the desired width
                        height: MediaQuery.of(context).size.width * 0.35,
                        child: Card(
                          surfaceTintColor: Colors.white70,
                          margin: const EdgeInsets.all(10),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(31),
                              side: const BorderSide(color: Colors.black)),
                          child: const Center(
                            child: Text(
                              'Pequeno almoço',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            1, // Set the desired width
                        height: MediaQuery.of(context).size.width * 0.35,
                        child: Card(
                          surfaceTintColor: Colors.white70,
                          margin: const EdgeInsets.all(10),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(31),
                              side: const BorderSide(color: Colors.black)),
                          child: const Center(
                            child: Text(
                              'Almoço',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            1, // Set the desired width
                        height: MediaQuery.of(context).size.width * 0.35,
                        child: Card(
                          surfaceTintColor: Colors.white70,
                          margin: const EdgeInsets.all(10),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(31),
                              side: const BorderSide(color: Colors.black)),
                          child: const Center(
                            child: Text(
                              'Jantar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            1, // Set the desired width
                        height: MediaQuery.of(context).size.width * 0.35,
                        child: Card(
                          surfaceTintColor: Colors.white70,
                          margin: const EdgeInsets.all(10),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(31),
                              side: const BorderSide(color: Colors.black)),
                          child: const Center(
                            child: Text(
                              'Sobremesa',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
