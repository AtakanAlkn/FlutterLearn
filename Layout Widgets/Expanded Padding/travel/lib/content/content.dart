import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TravelContent extends StatefulWidget {
  const TravelContent({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TravelContentState createState() => _TravelContentState();
}

class _TravelContentState extends State<TravelContent> {
  final List<String> _menuTitles = [
    'Populer',
    'Adventure',
    'Culture',
    'Festival'
  ];

  final List<List<String>> _menuImages = [
    ['eiffel.jpg', 'venice.jpg', 'bora.jpg'],
    ['amazon.jpg', 'everest.jpg', 'sahara.jpg'],
    ['louvre.jpg', 'vatican.jpg', 'british.jpg'],
    ['rio.jpg', 'tomorrowland.jpg'],
  ];

  final List<List<String>> _locationNames = [
    ['Paris', 'Venice', 'Bora Bora'],
    ['Amazon', 'Mount Everest', 'Sahara Desert'],
    ['Louvre Museum', 'Vatican Museums ', 'British Museum'],
    ['Rio Carnival', 'Tomorrowland'],
  ];

  final List<List<double>> _starRatings = [
    [4.2, 4.8, 4.5],
    [4.6, 4.9, 3.8],
    [3.5, 3.8, 3.7],
    [4.0, 4.1],
  ];

  final List<List<int>> _commentCounts = [
    [1500, 280, 700],
    [460, 49, 600],
    [3500, 980, 190],
    [44, 41],
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _menuTitles.length,
            (index) => _buildMenuButton(index),
          ),
        ),
        Expanded(
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
    );
  }

  Widget _buildMenuButton(int index) {
    bool isSelected = _currentPage == index;
    return Padding(
      padding: const EdgeInsets.all(8),
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
                isSelected ? Colors.blue : Colors.grey,
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
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMenuContent(int index) {
    return SingleChildScrollView(
      // Değişiklik: ListView.builder yerine SingleChildScrollView
      child: Column(
        children: List.generate(
          _menuImages[index].length,
          (subIndex) {
            return Container(
              margin: const EdgeInsets.all(8),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/${_menuImages[index][subIndex]}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 16,
                        ),
                        Text(
                          _locationNames[index][subIndex],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 8,
                    bottom: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                        const SizedBox(height: 4),
                        Text(
                          '${_starRatings[index][subIndex]}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '(${_commentCounts[index][subIndex]} Comments)',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
