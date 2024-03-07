import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class CitySelectScreen extends StatefulWidget {
  const CitySelectScreen({super.key});

  @override
  State<CitySelectScreen> createState() => _CitySelectScreenState();
}

class _CitySelectScreenState extends State<CitySelectScreen> {
  List<Map<String, dynamic>> _foundCity = [];

  List<Map<String, dynamic>> _allCities = [
    {"name": "Mumbai"},
    {"name": "East Suburbs 1"},
    {"name": "East Suburbs 2"},
    {"name": "Harbour"},
    {"name": "Western Suburbs"},
    {"name": "South Mumbai 1"},
    {"name": "South Mumbai 2"},
    {"name": "South Mumbai 3"},
    {"name": "Delhi"},
    {"name": "North Delhi"},
    {"name": "East Delhi"},
    {"name": "South Delhi"},
    {"name": "Banglore"},
    {"name": "Hyderabad"},
    {"name": "Chennai"},
    {"name": "Ahmedabad"},
    {"name": "Kolkata"},
    {"name": "Surat"},
    {"name": "Pune"},
    {"name": "Jaipur"},
    {"name": "Lucknow"},
    {"name": "Kanpur"},
  ];

  void _runFilter(String value) {
    List<Map<String, dynamic>> results = [];
    if (value.isEmpty) {
      results = _allCities;
    } else {
      results = _allCities
          .where((element) => element['name']
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundCity = results;
    });
  }

  @override
  void initState() {
    _foundCity = _allCities;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        // titleTextStyle: TextStyle(),
        title: const Text(
          "City",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        leading: InkWell(
            onTap: () => {Navigator.pushNamed(context, '/register')},
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: OutlineSearchBar(
              autoCorrect: true,
              hideSearchButton: true,
              backgroundColor: Colors.black,
              onKeywordChanged: (value) => {_runFilter(value)},
              hintText: "Search city",
              hintStyle: TextStyle(color: Colors.white38),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderColor: Colors.white30,
              padding: const EdgeInsets.only(left: 10, right: 10),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: ListView.builder(
                  itemCount: _foundCity.length,
                  itemBuilder: (context, index) => Material(
                        color: Colors.black,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: ListTile(
                            textColor: Colors.white,
                            title: Text(
                              _foundCity[index]["name"].toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
