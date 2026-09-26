import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/Pengaturan_page.dart';
import 'package:flutter_application_1/Views/statistik_page.dart';

final List<Map<String, dynamic>> dataKeuangan = [
  {'tanggal': '20 Sep 2026', 'kategori': 'Gaji', 'jenis': 'masuk', 'nominal': 8000000},
  {'tanggal': '20 Sep 2026', 'kategori': 'Makanan', 'jenis': 'keluar', 'nominal': 45000},
  {'tanggal': '19 Sep 2026', 'kategori': 'Transport', 'jenis': 'keluar', 'nominal': 25000},
  {'tanggal': '18 Sep 2026', 'kategori': 'Belanja', 'jenis': 'keluar', 'nominal': 250000},
  {'tanggal': '17 Sep 2026', 'kategori': 'Freelance', 'jenis': 'masuk', 'nominal': 1200000},
  {'tanggal': '16 Sep 2026', 'kategori': 'Tagihan', 'jenis': 'keluar', 'nominal': 400000},
];

// Mengubah 8000000 menjadi "Rp 8.000.000" (cukup dipakai, tidak perlu dipahami dulu)
String rupiah(int angka) {
  final teks = angka.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (m) => '.',
      );
  return 'Rp $teks';
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int menuAktif = 0;

  final List<String> namaMenu = ['Riwayat', 'Statistik', 'Pengaturan', 'About Me'];
  final List<IconData> ikonMenu = [Icons.list_alt, Icons.bar_chart, Icons.settings, Icons.person];

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder memberi tahu lebar layar saat ini
    return LayoutBuilder(
      builder: (context, constraints) {
        final layarLebar = constraints.maxWidth >= 800;

        if (layarLebar) {
          return Scaffold(
            backgroundColor: const Color(0xFFF4F5F7),
            body: Row(
              children: [
                Container(
                  width: 220,
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'My Duit',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 24),
                      daftarMenu(dalamDrawer: false),
                    ],
                  ),
                ),
                Expanded(child: isiHalaman()),
              ],
            ),
          );
        } else {
          
          return Scaffold(
            backgroundColor: const Color(0xFFF4F5F7),
            appBar: AppBar(title: Text(namaMenu[menuAktif])),
            drawer: Drawer(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'My Duit',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 24),
                      daftarMenu(dalamDrawer: true),
                    ],
                  ),
                ),
              ),
            ),
            body: isiHalaman(),
          );
        }
      },
    );
  }

  // ---------------------------------------------------------------
  // DAFTAR MENU
  // Dipakai di sidebar dan di drawer, jadi kodenya cukup ditulis sekali.
  // ---------------------------------------------------------------
  Widget daftarMenu({required bool dalamDrawer}) {
    return Column(
      children: [
        // Buat satu ListTile untuk setiap nama menu
        for (int i = 0; i < namaMenu.length; i++)
          ListTile(
            leading: Icon(ikonMenu[i]),
            title: Text(namaMenu[i]),
            selected: menuAktif == i, // menu yang aktif diberi warna
            onTap: () {
              setState(() {
                menuAktif = i; // ganti menu, tampilan otomatis dibangun ulang
              });
              if (dalamDrawer) {
                Navigator.pop(context); // tutup drawer setelah memilih
              }
            },
          ),
      ],
    );
  }

  // ---------------------------------------------------------------
  // ISI HALAMAN
  // Menentukan apa yang tampil sesuai menu yang dipilih.
  // ---------------------------------------------------------------
  Widget isiHalaman() {
    if (menuAktif == 0) {
      return halamanRiwayat();
    } else if (menuAktif == 1) {
      return const Center(child: Text('Halaman Statistik (belum dibuat)'));
    } else if (menuAktif == 2) {
      return const Center(child: Text('Halaman Pengaturan (belum dibuat)'));
    } else {
      return const Center(child: Text('Halaman About Me (belum dibuat)'));
    }
  }

  // ---------------------------------------------------------------
  // HALAMAN RIWAYAT (berisi LIST VIEW)
  // ---------------------------------------------------------------
  Widget halamanRiwayat() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Riwayat',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Expanded wajib dipakai supaya ListView mendapat sisa tinggi layar
          Expanded(
            child: ListView.builder(
              itemCount: dataKeuangan.length, // jumlah baris
              itemBuilder: (context, index) {
                // dipanggil sekali untuk setiap baris; index = nomor baris (0, 1, 2, ...)
                final item = dataKeuangan[index];
                final masuk = item['jenis'] == 'masuk';

                return Card(
                  child: ListTile(
                    title: Text(item['kategori']),
                    subtitle: Text(item['tanggal']),
                    trailing: Text(
                      '${masuk ? '+' : '-'} ${rupiah(item['nominal'])}',
                      style: TextStyle(
                        color: masuk ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}