import 'package:flutter/material.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nachiketh Reddy's Portfolio",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/projects': (context) => const ProjectsPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Portfolio"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurpleAccent, Colors.purpleAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Colors.deepPurple),
              ),
              const SizedBox(height: 20),
              const Text("Nachiketh Reddy", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
              const Text("Computer Science Student | AI/ML Enthusiast", style: TextStyle(fontSize: 16, color: Colors.white70)),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/about'),
                    icon: const Icon(Icons.info_outline),
                    label: const Text("About Me"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/projects'),
                    icon: const Icon(Icons.code),
                    label: const Text("My Projects"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.greenAccent.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Me"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Education", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("• B.Tech - Computer Science (2023-Present)\n  CR Rao AIMSCS, JNTUH"),
            SizedBox(height: 8),
            Text("• Credit linked AI & ML Program (2025-Present)\n  IIT Guwahati"),
            SizedBox(height: 20),
            Text("Technical Skills", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(
              spacing: 10, runSpacing: 10,
              children: [
                Chip(label: Text("Java"), backgroundColor: Colors.orangeAccent),
                Chip(label: Text("Python"), backgroundColor: Colors.greenAccent),
                Chip(label: Text("Flutter"), backgroundColor: Colors.blueAccent),
                Chip(label: Text("Dart"), backgroundColor: Colors.lightBlue),
                Chip(label: Text("AI/ML"), backgroundColor: Colors.redAccent),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pop(context),
        label: const Text("Back"), icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> projects = [
      {'title': 'The Reward Alchemist', 'description': 'Personalized recommendation engine.'},
      {'title': 'Fake News Detection App', 'description': 'Full-stack application with Node.js.'},
      {'title': 'IRIS Dataset Analysis', 'description': 'Statistical hypothesis testing with Python.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Projects"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(project['title']),
              subtitle: Text(project['description']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pop(context),
        label: const Text("Back"), icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}