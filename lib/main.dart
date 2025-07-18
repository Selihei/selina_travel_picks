import 'package:flutter/material.dart';
import "card.dart";
import "countries.dart";

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Travel Picks")),
        body: const TravelHomePage(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Suche"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          ],
        ),
      ),
    );
  }
}

//TravelHomePage
class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  final List<String> _selectedCountries = [];

  void _addCountry(String countryName) {
    if (!_selectedCountries.contains(countryName)) {
      setState(() {
        _selectedCountries.add(countryName);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "🌎 Willkommen zu deinen Reiseinspirationen",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 24),
          const Text("Europa", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: europeCountries
                  .map(
                    (country) => CountryCard(
                      emoji: country["emoji"]!,
                      name: country["name"]!,
                      onTap: () => _addCountry(country["name"]!),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 24),
          const Text("Südamerika", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: southAmericaCountries
                  .map(
                    (country) => CountryCard(
                      emoji: country["emoji"]!,
                      name: country["name"]!,
                      onTap: () => _addCountry(country["name"]!),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Text("Favoriten", style: TextStyle(fontSize: 18)),
              SizedBox(width: 15),
              Text(
                "Anzahl: ${_selectedCountries.length}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _selectedCountries.map((name) {
              return ActionChip(
                label: Text(name),
                onPressed: () {
                  setState(() {
                    _selectedCountries.remove(name);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
