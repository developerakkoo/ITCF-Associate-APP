import 'package:associatemember/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leadingWidth: 60,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Afternoon",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              "Associate",
              style: TextStyle(color: Colors.white54, fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              // Navigator.pushNamed(context, '/create-team');
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_on_outlined,
                color: Colors.white,
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SwitchListTile(
                value: themeState.getDarkTheme,
                title: themeState.getDarkTheme ? Text("Dark") : Text("Light"),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined),
                onChanged: (value) => {themeState.SetDarkTheme = value})
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: OutlineSearchBar(
              autoCorrect: true,
              clearButtonColor: Colors.white,
              searchButtonIconColor: Colors.white30,
              backgroundColor: Colors.black,
              onSearchButtonPressed: ((value) => {print(value)}),
              hintText: "Search by matches, players, events",
              hintStyle: TextStyle(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderColor: Colors.white30,
              padding: const EdgeInsets.only(left: 10, right: 10),
            ),
          )
        ],
      ),
    );
  }
}
