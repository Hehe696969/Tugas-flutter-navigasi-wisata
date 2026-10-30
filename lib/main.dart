import 'package:flutter/material.dart';

void main() {
  runApp(const WisataIndonesiaApp());
}

class WisataIndonesiaApp extends StatelessWidget {
  const WisataIndonesiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Indonesia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF087E8B)),
        scaffoldBackgroundColor: const Color(0xFFF4F8FA),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const BerandaPage(),

        '/pantai': (context) => const KategoriPage(
          nama: 'Pantai',
          tempat: 'Pantai Kuta',
          deskripsi: 'Pantai Kuta merupakan salah satu wisata populer di Bali yang terkenal dengan pasir putih dan pemandangan matahari terbenam.',
          ikon: Icons.beach_access,
          imagePath: 'assets/images/foto_pantai_kuta.jpg',
        ),

        '/gunung': (context) => const KategoriPage(
          nama: 'Gunung',
          tempat: 'Gunung Bromo',
          deskripsi: 'Gunung Bromo merupakan destinasi wisata alam di Jawa Timur yang terkenal dengan pemandangan matahari terbit.',
          ikon: Icons.landscape,
          imagePath: 'assets/images/foto_gunung_bromo.jpg',
        ),

        '/budaya': (context) => const KategoriPage(
          nama: 'Budaya',
          tempat: 'Tari Saman',
          deskripsi: 'Tari Saman merupakan kesenian tradisional dari Aceh yang terkenal dengan gerakan kompak dan irama tepukan.',
          ikon: Icons.account_balance,
          imagePath: 'assets/images/foto_tari_saman.jpg',
        ),

        '/kuliner': (context) => const KategoriPage(
          nama: 'Kuliner',
          tempat: 'Rendang',
          deskripsi: 'Rendang merupakan makanan khas Sumatera Barat yang dimasak menggunakan santan dan berbagai rempah.',
          ikon: Icons.restaurant,
          imagePath: 'assets/images/foto_rendang.jpg',
        ),

        '/detail': (context) => const DetailWisataPage(),
      },
    );
  }
}

// ================= BERANDA =================

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menu = [
      {
        'nama': 'Pantai',
        'rute': '/pantai',
        'foto': 'assets/images/foto_pantai_kuta.jpg',
      },
      {
        'nama': 'Gunung',
        'rute': '/gunung',
        'foto': 'assets/images/foto_gunung_bromo.jpg',
      },
      {
        'nama': 'Budaya',
        'rute': '/budaya',
        'foto': 'assets/images/foto_tari_saman.jpg',
      },
      {
        'nama': 'Kuliner',
        'rute': '/kuliner',
        'foto': 'assets/images/foto_rendang.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wisata Indonesia',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF087E8B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF087E8B), Color(0xFF39A9A5)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
      child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.explore, color: Colors.white, size: 40),
                  SizedBox(height: 12),
                  Text(
                    'Jelajahi Keindahan Nusantara',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Temukan berbagai destinasi wisata menarik di Indonesia.',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Kategori Wisata',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 3.5,
                children: menu.map((item) {
                  return Card(        
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {
                        Navigator.pushNamed(context, item['rute'] as String);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(18),
                            ),
                            child: Image.asset(
                              item['foto'] as String,
                              width: double.infinity,
                              height: 125,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['nama'] as String,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Lihat wisata',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= HALAMAN KATEGORI =================

class KategoriPage extends StatelessWidget {
  final String nama;
  final String tempat;
  final String deskripsi;
  final IconData ikon;
  final String imagePath;

  const KategoriPage({
    super.key,
    required this.nama,
    required this.tempat,
    required this.deskripsi,
    required this.ikon,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wisata $nama',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF087E8B),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 35),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF087E8B), Color(0xFF39A9A5)],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.white,
                    child: Icon(ikon, size: 48, color: const Color(0xFF087E8B)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Wisata $nama Indonesia',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'Pilihan $nama',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        color: const Color(0xFFF0F0F0),
                        child: Image.asset(
                          imagePath,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      tempat,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF087E8B),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      deskripsi,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: {
                              'kategori': nama,
                              'nama': tempat,
                              'deskripsi': deskripsi,
                              'imagePath': imagePath,
                            },
                          );
                        },
                        icon: const Icon(Icons.explore),
                        label: const Text('Lihat Detail'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF087E8B),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Kembali'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF087E8B),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= HALAMAN DETAIL WISATA =================

class DetailWisataPage extends StatelessWidget {
  const DetailWisataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final kategori = data['kategori']!;
    final nama = data['nama']!;
    final deskripsi = data['deskripsi']!;
    final imagePath = data['imagePath']!;

    final IconData ikon;
    if (kategori == 'Pantai') {
      ikon = Icons.beach_access;
    } else if (kategori == 'Gunung') {
      ikon = Icons.landscape;
    } else if (kategori == 'Budaya') {
      ikon = Icons.account_balance;
    } else {
      ikon = Icons.restaurant;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Informasi'),
        backgroundColor: const Color(0xFF087E8B),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    color: const Color(0xFFF0F0F0),
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Center(
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: const Color(0xFF087E8B)
                        .withValues(alpha: 0.12),
                    child: Icon(ikon, size: 52, color: const Color(0xFF087E8B)),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Kategori',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 5),
                Text(
                  kategori,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nama',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 5),
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF087E8B),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Deskripsi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  deskripsi,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Kembali'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF087E8B),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
