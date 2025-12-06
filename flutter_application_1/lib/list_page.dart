import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  // Tambahan 15 data wisata (sama seperti kode Anda sebelumnya)
  final List<Map<String, String>> wisata = const [
    {
      "nama": "Pantai Kelingking",
      "lokasi": "Nusa Penida, Bali",
      "gambar": "https://picsum.photos/200?random=1",
      "deskripsi":
          "Pantai dengan tebing berbentuk T-Rex dan air laut yang biru jernih, ikon Pulau Nusa Penida."
    },
    {
      "nama": "Gunung Bromo",
      "lokasi": "Jawa Timur",
      "gambar": "https://picsum.photos/200?random=2",
      "deskripsi":
          "Tempat terbaik menikmati sunrise dengan pemandangan gunung berapi yang spektakuler dan lautan pasir."
    },
    {
      "nama": "Labuan Bajo",
      "lokasi": "NTT",
      "gambar": "https://picsum.photos/200?random=3",
      "deskripsi":
          "Destinasi wisata dengan pulau-pulau indah dan gerbang utama menuju Taman Nasional Komodo."
    },
    {
      "nama": "Candi Borobudur",
      "lokasi": "Magelang, Jawa Tengah",
      "gambar": "https://picsum.photos/200?random=4",
      "deskripsi":
          "Candi Buddha terbesar di dunia, menawarkan arsitektur megah dan pemandangan matahari terbit yang damai."
    },
    {
      "nama": "Raja Ampat",
      "lokasi": "Papua Barat",
      "gambar": "https://picsum.photos/200?random=5",
      "deskripsi":
          "Gugusan pulau yang terkenal dengan keindahan bawah lautnya, surga bagi para penyelam."
    },
    {
      "nama": "Danau Toba",
      "lokasi": "Sumatera Utara",
      "gambar": "https://picsum.photos/200?random=6",
      "deskripsi":
          "Danau vulkanik terbesar di dunia, di tengahnya terdapat Pulau Samosir yang kaya akan budaya Batak."
    },
    {
      "nama": "Taman Nasional Komodo",
      "lokasi": "NTT",
      "gambar": "https://picsum.photos/200?random=7",
      "deskripsi":
          "Habitat asli Komodo, kadal terbesar di dunia. Juga terkenal dengan Pink Beach-nya."
    },
    {
      "nama": "Tanjung Puting",
      "lokasi": "Kalimantan Tengah",
      "gambar": "https://picsum.photos/200?random=8",
      "deskripsi":
          "Taman nasional untuk konservasi orangutan, menawarkan pengalaman susur sungai dengan klotok."
    },
    {
      "nama": "Pulau Derawan",
      "lokasi": "Kalimantan Timur",
      "gambar": "https://picsum.photos/200?random=9",
      "deskripsi":
          "Kepulauan indah dengan pantai pasir putih, tempat berenang bersama ubur-ubur tanpa sengat di Danau Kakaban."
    },
    {
      "nama": "Pura Tanah Lot",
      "lokasi": "Tabanan, Bali",
      "gambar": "https://picsum.photos/200?random=10",
      "deskripsi":
          "Pura Hindu yang terletak di atas batu karang di tengah laut, pemandangan sunset yang ikonik."
    },
    {
      "nama": "Lembah Baliem",
      "lokasi": "Pegunungan Papua",
      "gambar": "https://picsum.photos/200?random=11",
      "deskripsi":
          "Lembah subur yang dikelilingi pegunungan, terkenal dengan Festival Budaya Lembah Baliem."
    },
    {
      "nama": "Gili Trawangan",
      "lokasi": "Lombok, NTB",
      "gambar": "https://picsum.photos/200?random=12",
      "deskripsi":
          "Pulau bebas kendaraan bermotor, populer untuk snorkeling, diving, dan suasana santai."
    },
    {
      "nama": "Kawah Ijen",
      "lokasi": "Banyuwangi, Jawa Timur",
      "gambar": "https://picsum.photos/200?random=13",
      "deskripsi":
          "Kawah asam belerang yang terkenal dengan fenomena 'api biru' (blue fire) pada malam hari."
    },
    {
      "nama": "Ngarai Sianok",
      "lokasi": "Bukittinggi, Sumatera Barat",
      "gambar": "https://picsum.photos/200?random=14",
      "deskripsi":
          "Lembah curam yang menakjubkan dengan pemandangan hijau, sering disebut Grand Canyon-nya Sumatera."
    },
    {
      "nama": "Pulau Padar",
      "lokasi": "NTT",
      "gambar": "https://picsum.photos/200?random=15",
      "deskripsi":
          "Pulau ikonik di TN Komodo dengan pemandangan tiga teluk yang bertemu, sempurna untuk hiking dan fotografi."
    },
  ];
  
  // Asumsi: Halaman Login/Utama berada di route '/'
  final String _loginRoute = '/';

  // Fungsi untuk menangani aksi Logout
  void _handleLogout(BuildContext context) {
    // Di aplikasi nyata, Anda akan menghapus token sesi atau status login di sini.
    print("User logged out!");

    // Mengganti semua rute yang ada dengan rute login/utama ('/'), 
    // sehingga pengguna tidak bisa kembali ke halaman ListPage dengan tombol back.
    Navigator.of(context).pushNamedAndRemoveUntil(
      _loginRoute, // Rute tujuan (Halaman Login/Utama)
      (Route<dynamic> route) => false, // Hapus semua rute sebelumnya
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar 15 Wisata Indonesia"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        // *** BAGIAN LOGOUT DITAMBAHKAN DI SINI ***
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => _handleLogout(context), // Panggil fungsi logout
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: wisata.length,
        itemBuilder: (context, index) {
          final item = wisata[index];
          return InkWell(
            onTap: () {
              // Aksi saat item diklik untuk navigasi ke halaman detail
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: item,
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // ... [Bagian Tampilan Item List] ...
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        item["gambar"]!, 
                        width: 100, 
                        height: 100, 
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Nama Wisata (Title)
                          Text(
                            item["nama"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: 16
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          // Lokasi (Subtitle)
                          Text(
                            item["lokasi"]!,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}