import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  // Fungsi utilitas untuk membuat teks detail yang lebih panjang
  // Ini mensimulasikan deskripsi yang lebih kaya berdasarkan nama lokasi yang ada.
  String _getDetailedDescription(Map<String, String> item) {
    final nama = item["nama"] ?? "Tempat Wisata";
    final lokasi = item["lokasi"] ?? "Lokasi";
    final deskripsiSingkat = item["deskripsi"] ?? "Tidak ada deskripsi tersedia.";

    // Teks panjang yang disesuaikan sedikit berdasarkan nama item
    String detailTeks;

    if (nama.contains("Kelingking")) {
      detailTeks = "Pantai ini terkenal karena tebingnya yang ikonik, menyerupai bentuk kepala Dinosaurus T-Rex, yang membuatnya sangat populer di media sosial. Selain pemandangan tebing yang menakjubkan dari atas, pengunjung juga bisa mencoba menuruni anak tangga ekstrem untuk mencapai pantai berpasir putih di bawahnya. Perjalanan menuruni tebing cukup menantang namun akan terbayar dengan air laut biru jernih yang memukau. Kelingking Beach adalah bukti nyata keindahan alam Nusa Penida, Bali.";
    } else if (nama.contains("Bromo")) {
      detailTeks = "Gunung Bromo, bagian dari Taman Nasional Bromo Tengger Semeru, adalah salah satu ikon wisata Jawa Timur. Pengalaman paling dicari di sini adalah menyaksikan matahari terbit (sunrise) dari Penanjakan atau Bukit Kingkong, dengan latar belakang kaldera, lautan pasir yang luas, dan Gunung Semeru di kejauhan. Setelah sunrise, wisatawan biasanya melanjutkan perjalanan menyeberangi lautan pasir menuju kaki Bromo, kemudian menaiki sekitar 250 anak tangga untuk melihat kawah Bromo yang masih aktif.";
    } else if (nama.contains("Labuan Bajo")) {
      detailTeks = "Labuan Bajo adalah gerbang utama menuju Taman Nasional Komodo, yang meliputi Pulau Komodo, Pulau Rinca, dan Pulau Padar. Destinasi ini menawarkan petualangan bahari yang luar biasa, mulai dari berlayar di antara gugusan pulau-pulau eksotis, trekking di Pulau Padar untuk mendapatkan pemandangan yang legendaris, hingga menyelam atau snorkeling di perairan kaya biota laut. Labuan Bajo telah bertransformasi menjadi tujuan wisata premium yang fokus pada keindahan alam dan konservasi.";
    } else {
      detailTeks = "Informasi detail tambahan mengenai $nama di $lokasi saat ini sedang dalam pengembangan. Namun, seperti yang disebutkan sebelumnya: $deskripsiSingkat. Destinasi ini menawarkan pengalaman yang unik dan tak terlupakan bagi setiap pengunjung yang datang.";
    }

    return """
**Pengantar**
$deskripsiSingkat

**Seluk Beluk Destinasi**
$detailTeks

**Tips Kunjungan**
Untuk pengalaman terbaik, disarankan mengunjungi $nama pada musim kemarau (April hingga Oktober). Selalu siapkan kamera terbaik Anda karena setiap sudut menawarkan latar belakang fotografi yang luar biasa. Jangan lupa untuk menjaga kebersihan lingkungan selama kunjungan Anda.
    """;
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? wisata = 
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    if (wisata == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Detail Tidak Ditemukan")),
        body: const Center(child: Text("Data wisata tidak tersedia.")),
      );
    }
    
    // Panggil fungsi untuk mendapatkan deskripsi yang lebih panjang
    final deskripsiLengkap = _getDetailedDescription(wisata);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 2. AppBar yang bisa digulir (SliverAppBar)
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                wisata["nama"] ?? "Wisata",
                style: const TextStyle(
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
              ),
              background: Image.network(
                wisata["gambar"]!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey));
                },
              ),
            ),
          ),

          // 3. Konten Utama (Deskripsi dan Lokasi)
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Lokasi
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.teal),
                          const SizedBox(width: 8),
                          Text(
                            wisata["lokasi"] ?? "Lokasi tidak diketahui",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.teal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      
                      // Deskripsi
                      const Text(
                        "Detail Informasi Wisata:",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      // Tampilkan deskripsi yang lebih panjang
                      Text(
                        deskripsiLengkap, // Menggunakan deskripsi yang sudah diperkaya
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.6, // Meningkatkan spasi baris agar mudah dibaca
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}