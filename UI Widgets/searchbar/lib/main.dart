import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Search Bar',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<Person> _peopleList = [
    Person("Mini", "Mouse"),
    Person("Mickey", "Mouse"),
    Person("Atakan", "Alkan"),
    Person("Tony", "Stark"),
    Person("Bruce", "Wayne"),
    Person("Clark", "Kent"),
  ];

  List<Person> _filteredPeopleList = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredPeopleList = _peopleList;
  }

  void _filterPeopleList() {
    String searchText = _searchController.text.toLowerCase().trim();
    setState(() {
      _filteredPeopleList = _peopleList.where((person) {
        bool nameMatch = person.name.toLowerCase().contains(searchText);
        bool surnameMatch = person.surname.toLowerCase().contains(searchText);
        return nameMatch || surnameMatch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Bar'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) => _filterPeopleList(),
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Surname')),
                  ],
                  rows: _filteredPeopleList
                      .map(
                        (person) => DataRow(
                          cells: [
                            DataCell(Text(person.name)),
                            DataCell(Text(person.surname)),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Person {
  final String name;
  final String surname;

  Person(this.name, this.surname);
}
