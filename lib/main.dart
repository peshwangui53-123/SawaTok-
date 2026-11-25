import 'package:flutter/material.dart';

void main() {
  runApp(const SawaTokApp());
}

class SawaTokApp extends StatelessWidget {
  const SawaTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SawaTok',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
        )
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical, // TIKTOK STYLE
        onPageChanged: (i) => setState(() => _currentIndex = i),
        children: const [
          VideoFeed(user: '@King_Sawa', desc: 'SawaTok Live 🔥', likes: '12.4K'),
          VideoFeed(user: '@Queen_Nai', desc: 'Nairobi vibes 🇰🇪', likes: '5.2K'),
          VideoFeed(user: '@CEO_Kenya', desc: 'Follow for more!', likes: '890'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex < 3 ? _currentIndex : 0,
        onTap: (i) => _controller.jumpToPage(i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 38), label: 'Live'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class VideoFeed extends StatelessWidget {
  final String user;
  final String desc;
  final String likes;
  const VideoFeed({super.key, required this.user, required this.desc, required this.likes});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // FAKE VIDEO
        Container(
          color: Colors.grey[900], 
          child: Center(child: Icon(Icons.play_circle_fill, size: 90, color: Colors.deepPurple.withOpacity(0.4)))
        ),
        // USER INFO
        Positioned(
          bottom: 90,
          left: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white)),
              SizedBox(height: 5),
              Text(desc, style: TextStyle(color: Colors.white)),
              Text('SawaTok Sound', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ),
        // SIDE BUTTONS
        Positioned(
          right: 15,
          bottom: 110,
          child: Column(children: [
            Icon(Icons.favorite, color: Colors.red, size: 36), Text(likes, style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            Icon(Icons.comment, color: Colors.white, size: 36), Text('234', style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            Icon(Icons.live_tv, color: Colors.deepPurple, size: 36), Text('Live', style: TextStyle(color: Colors.white)),
          ]),
        ),
      ],
    );
  }
}
