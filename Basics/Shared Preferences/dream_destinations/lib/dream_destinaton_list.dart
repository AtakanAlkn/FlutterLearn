import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'dream_destination_card.dart';
import 'main.dart';

class DestinationListScreen extends StatefulWidget {
  const DestinationListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DestinationListScreenState createState() => _DestinationListScreenState();
}

class _DestinationListScreenState extends State<DestinationListScreen> {
  List<DreamDestination> dreamDestinations = [];
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    loadData();
  }

  void loadData() {
    List<String>? destinations = prefs.getStringList('dreamDestinations');
    if (destinations != null) {
      dreamDestinations = destinations.map((destination) {
        List<String> values = destination.split(';');
        Color backgroundColor = _getRandomColor();
        return DreamDestination(
          name: values[0],
          visited: values[1] == 'true',
          visitCount: int.parse(values[2]),
          details: values[3],
          backgroundColor: backgroundColor,
        );
      }).toList();
    }
    setState(() {});
  }

  void saveData() {
    List<String> destinations = dreamDestinations.map((destination) {
      return '${destination.name};${destination.visited};${destination.visitCount};${destination.details}';
    }).toList();
    prefs.setStringList('dreamDestinations', destinations);
  }

  Color _getRandomColor() {
    Random random = Random();
    int r = random.nextInt(128) + 128; // 128-255 arası kırmızı tonu
    int g = random.nextInt(128) + 128; // 128-255 arası yeşil tonu
    int b = random.nextInt(128) + 128; // 128-255 arası mavi tonu
    return Color.fromARGB(255, r, g, b);
  }

// Ekleme pop-up
  void _addDreamDestination() {
    showDialog(
      context: context,
      builder: (context) {
        String name = '';
        int visitCount = 0;
        String details = '';

        return AlertDialog(
          title: const Text('Add Dream Destination'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  visitCount = int.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Visit Count',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  details = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Details',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final dreamDestination = DreamDestination(
                  name: name,
                  visited: false,
                  visitCount: visitCount,
                  details: details,
                  backgroundColor: _getRandomColor(),
                );

                setState(() {
                  dreamDestinations.add(dreamDestination);
                  saveData();
                });

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

// Edit pop-up
  void _editDreamDestination(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String name = dreamDestinations[index].name;
        int visitCount = dreamDestinations[index].visitCount;
        String details = dreamDestinations[index].details;

        return AlertDialog(
          title: const Text('Edit Dream Destination'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                controller: TextEditingController(text: name),
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  visitCount = int.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Visit Count',
                ),
                controller: TextEditingController(text: visitCount.toString()),
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  details = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Details',
                ),
                controller: TextEditingController(text: details),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final dreamDestination = DreamDestination(
                  name: name,
                  visited: dreamDestinations[index].visited,
                  visitCount: visitCount,
                  details: details,
                  backgroundColor: dreamDestinations[index].backgroundColor,
                );

                setState(() {
                  dreamDestinations[index] = dreamDestination;
                  saveData();
                });

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showDreamDestinationDetails(DreamDestination destination) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(destination.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Visit Count: ${destination.visitCount}'),
              const SizedBox(height: 8),
              Text('Details: ${destination.details}'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Dream Destinations'),
        ),
      ),
      body: ListView.builder(
        itemCount: dreamDestinations.length,
        itemBuilder: (context, index) {
          final destination = dreamDestinations[index];
          return DreamDestinationCard(
            destination: destination,
            onDestinationTap: () {
              _showDreamDestinationDetails(destination);
            },
            //Kart yapısına uzun basılınca ziyaret sayısını 1 arttırır
            onDestinationLongPress: () {
              setState(() {
                destination.visitCount++;
                _showNotification(
                    'Your ${destination.visitCount}th visit to ${destination.name}');
                saveData();
              });
            },
            // CheckBox
            onDestinationVisitedToggle: () {
              setState(() {
                destination.visited = !destination.visited;

                saveData();
              });
            },
            //Silme
            onDestinationDelete: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Dream Destination'),
                    content: const Text(
                      'Are you sure you want to delete this destination?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            dreamDestinations.removeAt(index);
                            saveData();
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
            // Düzenleme
            onDestinationEdit: () {
              _editDreamDestination(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addDreamDestination();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
