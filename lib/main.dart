import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TutoDemo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage('assets/images/man.jpg'),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'Kuete Valdes', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '+237698848441', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'abc address ,xyz city', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile('Email', '+237698848441', CupertinoIcons.mail),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Edit Profile'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _launchURL,
              child: const Text('View GitHub Profile'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.deepOrange.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
          )
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
      ),
    );
  }
}

void _launchURL() async {
  const url = 'https://github.com/chess6988';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}