import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Accebility extends StatelessWidget {
  const Accebility({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerSize = screenWidth * 0.1;
    double iconSize = screenWidth * 0.06;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildIconContainer(Icons.hearing, containerSize, iconSize),
        _buildIconContainer(Icons.visibility, containerSize, iconSize),
        _buildIconContainer(Icons.voice_over_off, containerSize, iconSize),
        _buildIconContainer(Icons.directions_walk, containerSize, iconSize),
      ],
    );
  }

  Widget _buildIconContainer(
      IconData icon, double containerSize, double iconSize) {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: const BoxDecoration(
        color: Color(0xFFC0EFC3),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: iconSize, color: const Color(0xFF343434)),
    );
  }
}

Widget iconExpression({required name}) {
  return Image.asset(
    name,
    width: 35,
    height: 50,
  );
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.stars,
      'title': 'Rating',
      'iconColor': Colors.black,
      'textColor': Colors.black,
    },
    {
      'icon': Icons.bug_report,
      'title': 'Report Bug',
      'iconColor': Colors.black,
      'textColor': Colors.black,
    },
    {
      'icon': Icons.person,
      'title': 'Tes MBTI',
      'iconColor': Colors.black,
      'textColor': Colors.black,
    },
    {
      'icon': Icons.exit_to_app,
      'title': 'Logout',
      'iconColor': Colors.red,
      'textColor': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Builder(builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              })),
          title: const Text(
            'Selamat Pagi, Yondi',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 24),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/img/profile.jpg'),
                radius: 20,
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal[200],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.5),
                          child: const Text(
                            'Halo, Ayondi',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 9),
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/img/profile.jpg'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: menuItems.map((item) {
                    return ListTile(
                      leading: Icon(
                        item['icon'],
                        color: item['iconColor'],
                      ),
                      title: Text(
                        item['title'],
                        style: TextStyle(
                          color: item['textColor'],
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      onTap: () {
                        // Tambahkan aksi saat menu di klik
                      },
                    );
                  }).toList(),
                ),
              ),
              const Divider(height: 1, color: Colors.white),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Made By',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Image.asset(
                      'assets/img/made.png',
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
body: SingleChildScrollView(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Center(
        child: Text(
          'Bagaimana Perasaan Anda Hari Ini?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 30),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 173, 215, 176),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(300),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding:
                      const EdgeInsets.only(top: 5, left: 5, right: 5),
                  width: MediaQuery.of(context).size.width - 100,
                  height: 170,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC5F4C8),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(300),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: iconExpression(
                            name: 'assets/icon/emoji_1.png'),
                      ),
                      Positioned(
                        bottom: 40,
                        left: 20,
                        child: iconExpression(
                            name: 'assets/icon/emoji_2.png'),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 50,
                        child: iconExpression(
                            name: 'assets/icon/emoji_3.png'),
                      ),
                      Positioned(
                        bottom: 105,
                        left: 90,
                        child: iconExpression(
                            name: 'assets/icon/emoji_4.png'),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: iconExpression(
                            name: 'assets/icon/emoji_5.png'),
                      ),
                      Positioned(
                        bottom: 105,
                        right: 90,
                        child: iconExpression(
                            name: 'assets/icon/emoji_6.png'),
                      ),
                      Positioned(
                        bottom: 80,
                        right: 50,
                        child: iconExpression(
                            name: 'assets/icon/emoji_7.png'),
                      ),
                      Positioned(
                        bottom: 40,
                        right: 20,
                        child: iconExpression(
                            name: 'assets/icon/emoji_8.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: iconExpression(
                            name: 'assets/icon/emoji_9.png'),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Image.asset('assets/icon/arrow.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Accebility(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Butuh motivasi?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
            child: const Text('Lihat Semua',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black)),
          ),
        ],
      ),
      const SizedBox(
        height: 200,
        child: ImageContainer(),
      ),
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ceritakan Hari Anda',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.open_in_full,
                    color: Colors.grey,
                    size: 18,
                  ),
                  onPressed: () {
                    // Tambahkan aksi untuk membuka halaman cerita
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Tulis Judul Cerita',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        ),
      ),
      const SizedBox(height: 25),
      // Tambahkan gambar kanan sendiri di bawah
      Container(
        width: double.infinity,
        height: 300,
        margin: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: const DecorationImage(
            image: AssetImage(
              'assets/img/cerdas.png', // Path ke gambar Anda
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  ),
),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFF9F9F9),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF916246),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              label: 'Screening',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
                size: 40,
              ),
              label: 'Kamera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Kolaborasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Psikiater',
            ),
          ],
        ));
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/img/motivation1.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/img/motivation2.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
