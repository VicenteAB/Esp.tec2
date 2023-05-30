import 'package:flutter/material.dart';

class Achievement {
  final String name;
  final String description;
  final bool achieved;
  final int progress;
  final String imagePath;

  Achievement({
    required this.name,
    required this.description,
    required this.achieved,
    required this.progress,
    required this.imagePath,
  });
}

class AchievementsView extends StatelessWidget {
  final List<Achievement> achievements = [
    Achievement(
      name: 'Programar',
      description: '50 minutos',
      achieved: true,
      progress: 80,
      imagePath: 'assets/images/codigo.png',
    ), // Ruta de la imagen del logro 1
    Achievement(
      name: 'Leer',
      description: '30 minutos',
      achieved: false,
      progress: 40,
      imagePath: 'assets/images/leer.png',
    ),
    Achievement(
      name: 'Ejercicio',
      description: '60 minutos',
      achieved: false,
      progress: 40,
      imagePath: 'assets/images/ejercicio.png',
    ),
  ];

  Color getProgressColor(int progress) {
    if (progress >= 100) {
      return Colors.green;
    } else {
      final double ratio = progress / 100.0;
      final int red = (255 - (ratio * 255)).toInt();
      final int green = (ratio * 255).toInt();
      return Color.fromARGB(255, red, green, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            Text('Logros'),
          ],
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pomodoros pendientes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: achievements.length,
                itemBuilder: (context, index) {
                  final achievement = achievements[index];
                  final progressColor = getProgressColor(achievement.progress);

                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.grey),
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(achievement.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(achievement.name),
                      subtitle: Text(achievement.description),
                      onTap: () {
                        // Acción al hacer clic en un logro
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              Text(
                'Pomodoros completados',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Pomodoros pendientes
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2, // Cantidad de logros en la segunda lista
                itemBuilder: (context, index) {
                  final achievement = Achievement(
                    name: 'Logro ${index + 1}',
                    description: 'Descripción del logro ${index + 1}',
                    achieved: false,
                    progress: 0,
                    imagePath: 'assets/images/codigo.png',
                  );

                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.grey),
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.green,
                        ),
                      ),
                      title: Text(achievement.name),
                      subtitle: Text(achievement.description),
                      onTap: () {
                        // Acción al hacer clic en un logro
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
