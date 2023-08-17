import 'package:comedyclub/content/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Ticket {
  String title;
  String date;

  Ticket({required this.title, required this.date});
}

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final List<Ticket> _myTickets = [
    Ticket(title: 'Hababam Sınıfı', date: '2023-07-21'),
    Ticket(title: 'We Have a Ghost', date: '2023-07-22'),
    Ticket(title: 'G.O.R.A.', date: '2023-07-23'),
  ];
  final List<String> _menuTitles = [
    'Soon',
    'Popular',
    'Turkish',
    'My Tickets',
  ];

  final List<List<String>> _menuImages = [
    ['murder.jpg', 'ghost.jpg', 'asterix.jpg', 'medellin.jpg'],
    [
      'forrest.jpg',
      'idiots.jpg',
      'hababam.jpg',
      'truman.jpg',
      'up.jpg',
      'gora.jpg',
      'ratatuy.jpg'
    ],
    ['organize.jpg', 'hokkabaz.jpg', 'pek.jpg'],
  ];

  final List<List<String>> _locationNames = [
    [
      'Murder Mystery 2',
      'We Have a Ghost',
      'Astérix and Obélix : The Middle Kingdom',
      'Medellin',
    ],
    [
      'Forrest Gump',
      '3 idiots',
      'Hababam Sınıfı',
      'Truman Show',
      'Up',
      'G.O.R.A.',
      'Ratatuy',
    ],
    ['Organize İşler', 'Hokkabaz', 'Pek Yakında'],
  ];

  final List<List<double>> _starRatings = [
    [4.2, 4.8, 4.5, 3.9],
    [4.9, 4.9, 4.9, 4.8, 4.8, 4.8, 4.7],
    [3.5, 3.8, 3.7],
  ];

  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Menü kısmını esnek hale getirme
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                _menuTitles.length,
                (index) => _buildMenuButton(index),
              ),
            ),
          ),
          Expanded(
            // Menü içeriği esnek hale getirme
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _menuTitles.length,
              itemBuilder: (context, index) {
                return _buildMenuContent(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(int index) {
    bool isSelected = _currentPage == index;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TextButton(
            onPressed: () {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                isSelected ? const Color(0XFFEE4446) : Colors.black,
              ),
            ),
            child: Text(
              _menuTitles[index],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0XFFEE4446),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMenuContent(int index) {
    if (index == 3) {
      return _buildMyTicketsContent();
    } else {
      return ListView.builder(
        itemCount: _menuImages[index].length,
        itemBuilder: (context, subIndex) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/${_menuImages[index][subIndex]}',
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _locationNames[index][subIndex],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: _starRatings[index][subIndex],
                                  minRating: 0,
                                  maxRating: 5,
                                  itemSize: 16,
                                  allowHalfRating: true,
                                  ignoreGestures: true,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${_starRatings[index][subIndex]}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //Bilet Al onpress
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          child: const Text('Bilet Al'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  Widget _buildMyTicketsContent() {
    return ListView.builder(
      itemCount: _myTickets.length,
      itemBuilder: (context, index) {
        Ticket ticket = _myTickets[index];
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            title: Text(ticket.title),
            subtitle: Text('Date: ${ticket.date}'),
            trailing: ElevatedButton(
              onPressed: () {
                CustomAlert.show(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text('Cancel'),
            ),
          ),
        );
      },
    );
  }
}
