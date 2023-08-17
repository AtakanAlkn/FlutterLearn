import 'package:flutter/material.dart';
import 'main.dart';

class DreamDestinationCard extends StatelessWidget {
  final DreamDestination destination;
  final VoidCallback onDestinationTap;
  final VoidCallback onDestinationLongPress;
  final VoidCallback onDestinationVisitedToggle;
  final VoidCallback onDestinationDelete;
  final VoidCallback onDestinationEdit;

  const DreamDestinationCard({
    Key? key,
    required this.destination,
    required this.onDestinationTap,
    required this.onDestinationLongPress,
    required this.onDestinationVisitedToggle,
    required this.onDestinationDelete,
    required this.onDestinationEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: destination.backgroundColor,
      child: ListTile(
        title: Text(
          destination.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('Visit Count: ${destination.visitCount}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onDestinationVisitedToggle,
              icon: Icon(
                destination.visited
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
              ),
            ),
            IconButton(
              onPressed: onDestinationDelete,
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            IconButton(
              onPressed: onDestinationEdit,
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        onTap: onDestinationTap,
        onLongPress: onDestinationLongPress,
      ),
    );
  }
}
