import 'package:flutter/material.dart';

void main() {
  runApp(PhysicsProjectsApp());
}

class PhysicsProjectsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Physics Projects Showcase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.deepPurple, // Dark violet color
        brightness: Brightness.dark, // Use dark theme
      ),
      debugShowCheckedModeBanner: false,
      home: ProjectListScreen(),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String imagePath;

  Project({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class ProjectListScreen extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: "Kepler's Laws Verification",
      description: "Verifying Kepler's laws using computational simulations.",
      imagePath: 'assets/kepler.png', // Place your image in the assets folder
    ),
    Project(
      title: "Elliptical Orbits of Inner Planets",
      description: "Compute and plot elliptical orbits of the five inner planets.",
      imagePath: 'assets/elliptical_orbits.png', // Update image path
    ),
    Project(
      title: "2D Animation of Planetary Orbits",
      description: "Create a 2D animation of the orbits of the planets.",
      imagePath: 'assets/2d_animation.png', // Update image path
    ),
    Project(
      title: "3D Orbit Animations with Inclination",
      description: "Plot 3D orbit animations of the planets using inclination angle.",
      imagePath: 'assets/3d_orbit_animations.png', // Update image path
    ),
    Project(
      title: "Orbital Time Variation with Polar Angle",
      description: "Use Simpson's numeric integration to study orbital time vs polar angle.",
      imagePath: 'assets/orbital_time_variation.png', // Update image path
    ),
    Project(
      title: "Solar System Spirograph",
      description: "Plot orbits of a planet pair and draw lines at fixed intervals.",
      imagePath: 'assets/solar_system_spirograph.png', // Update image path
    ),
    Project(
      title: "Ptolemy's Solar System Orbits",
      description: "Plot orbits of all solar system bodies with a chosen object at origin.",
      imagePath: 'assets/ptolemys_orbits.png', // Update image path
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BPhO Simulation Results'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.all(16.0),
            child: InkWell( // Wrap the Card with InkWell for tap interaction
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        FadeTransition(
                          opacity: animation,
                          child: ProjectDetailsScreen(project: projects[index]),
                        ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
                child: ListTile(
                  title: Text(
                    projects[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(projects[index].description),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      projects[index].imagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  ProjectDetailsScreen({required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  project.imagePath,
                  width: 380,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                project.description,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}