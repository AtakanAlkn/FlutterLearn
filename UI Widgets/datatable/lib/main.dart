import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NeonDevelopersScreen(),
    );
  }
}

class NeonDevelopers {
  final String name;
  final String surname;
  final String team;
  final int age;
  final String hometown;
  final String mail;

  NeonDevelopers({
    required this.name,
    required this.surname,
    required this.team,
    required this.age,
    required this.hometown,
    required this.mail,
  });
}

class NeonDevelopersScreen extends StatelessWidget {
  final List<NeonDevelopers> developers = [
    NeonDevelopers(
      name: "Mehmet Nuri",
      surname: "Fırat",
      team: "Flutter Team",
      age: 25,
      hometown: "New York",
      mail: "example@gmail.com",
    ),
    NeonDevelopers(
      name: "Atakan",
      surname: "Alkan",
      team: "Flutter Team",
      age: 22,
      hometown: "Los Angeles",
      mail: "example2@gmail.com",
    ),
    NeonDevelopers(
      name: "Michael",
      surname: "Johnson",
      team: "Android Team",
      age: 24,
      hometown: "Chicago",
      mail: "michael.johnson@example.com",
    ),
    NeonDevelopers(
      name: "Emily",
      surname: "Williams",
      team: "Design Team",
      age: 22,
      hometown: "San Francisco",
      mail: "emily.williams@example.com",
    ),
    NeonDevelopers(
      name: "Tony",
      surname: "Stark",
      team: "Design Team",
      age: 52,
      hometown: "Istanbul",
      mail: "s@example.com",
    ),
    NeonDevelopers(
      name: "Patrick",
      surname: "Williams",
      team: "iOS Team",
      age: 30,
      hometown: "London",
      mail: "Pattrick@example.com",
    ),
  ];

  void _onDeveloperSelected(BuildContext context, NeonDevelopers developer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => developerDetailsScreen(developer: developer),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Table"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Surname")),
            DataColumn(label: Text("Team")),
            DataColumn(label: Text("Age")),
            DataColumn(label: Text("Hometown")),
            DataColumn(label: Text("Mail")),
          ],
          rows: developers.map((developer) {
            return DataRow(
              onSelectChanged: (isSelected) =>
                  _onDeveloperSelected(context, developer),
              cells: [
                DataCell(Text(developer.name)),
                DataCell(Text(developer.surname)),
                DataCell(Text(developer.team)),
                DataCell(Text(developer.age.toString())),
                DataCell(Text(developer.hometown)),
                DataCell(Text(developer.mail)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class developerDetailsScreen extends StatelessWidget {
  final NeonDevelopers developer;

  developerDetailsScreen({required this.developer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("developer Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${developer.name} ${developer.surname}"),
            const SizedBox(height: 8),
            Text("Team: ${developer.team}"),
            const SizedBox(height: 8),
            Text("Age: ${developer.age}"),
            const SizedBox(height: 8),
            Text("Hometown: ${developer.hometown}"),
            const SizedBox(height: 8),
            Text("Mail: ${developer.mail}"),
          ],
        ),
      ),
    );
  }
}
