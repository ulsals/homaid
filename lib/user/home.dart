import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  int _currentImageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  late Timer _timer;

  final List<String> _imagePaths = [
    'assets/promosi3.jpeg',
    'assets/promosi2.jpeg',
    'assets/promosi4.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    //set waktu digambar
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentImageIndex < _imagePaths.length - 1) {
        _currentImageIndex++;
      } else {
        _currentImageIndex = 0;
      }

      _pageController.animateToPage(
        _currentImageIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: 20,
              ),
            ],
          ),
        ),
      ),

      //BODY
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                _buildImageSlider(),
                SizedBox(height: 20),
                _buildCategories(),
                SizedBox(height: 5),
                _buildRecommendation(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16), // Sudut melengkung
      child: Container(
        height: 225,
        child: PageView.builder(
          controller: _pageController,
          itemCount: _imagePaths.length,
          itemBuilder: (context, index) {
            return Image.asset(
              _imagePaths[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildServiceIcon('assets/home.png', 'Home Care'),
        _buildServiceIcon('assets/clean.png', 'Cleaning Service'),
        _buildServiceIcon('assets/plant.png', 'Plant Care'),
        _buildServiceIcon('assets/laundry.png', 'Laundry'),
        _buildServiceIcon('assets/stuff.png', 'Cleaning Stuff'),
        _buildServiceIcon('assets/cook.png', 'Cooking'),
      ],
    );
  }

  Widget _buildServiceIcon(String assetPath, String label) {
    return Column(
      children: [
        Image.asset(
          assetPath,
          height: 80,
        ),
        // SizedBox(height: 20),
        Text(
          label,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRecommendation() {
    return Container(
      height: 300,
      width: 1100,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rekomendasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/rekomen.png'),
                    radius: 30,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'rina.karmila',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            SizedBox(width: 10),
                            Text('70 Penilaian'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Menyediakan Jasa: ',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'Mencuci Piring, Memasak, Mencuci Baju dan Setrika Baju ',
                          style: TextStyle(fontSize: 12,),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Aksi ketika tombol Chat ditekan
                          },
                          child: Text(
                            'Chat',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
