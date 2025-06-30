// File: lib/pengaturan_screen.dart

import 'package:flutter/material.dart';
import 'package:moodle_app/edit_profile_screen.dart'; // Import untuk navigasi ke Edit Profil

const Color kDarkBlue = Color(0xFF002F6C);
const Color kScaffoldBackground = Color(0xFFE3F2FD); // Latar belakang biru sangat terang

class PengaturanScreen extends StatelessWidget {
  const PengaturanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(), // Fungsi untuk kembali
        ),
        title: const Text(
          'Pengaturan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kDarkBlue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Membuat Column sependek kontennya
            children: [
              _buildSettingsItem(
                context: context,
                icon: Icons.manage_accounts_outlined,
                title: 'Edit Profil',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditProfilScreen()),
                  );
                },
              ),
              _buildSettingsItem(
                context: context,
                icon: Icons.description_outlined,
                title: 'Syarat dan Ketentuan',
                onTap: () {}, // Tambahkan aksi di sini
              ),
              _buildSettingsItem(
                context: context,
                icon: Icons.headset_mic_outlined,
                title: 'Pusat Bantuan',
                onTap: () {}, // Tambahkan aksi di sini
              ),
              _buildSettingsItem(
                context: context,
                icon: Icons.share_outlined,
                title: 'Undang Teman',
                onTap: () {}, // Tambahkan aksi di sini
              ),
              _buildSettingsItem(
                context: context,
                icon: Icons.logout,
                title: 'Keluar',
                onTap: () {
                  // Menampilkan dialog konfirmasi saat keluar
                  _showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat setiap baris menu pengaturan
  Widget _buildSettingsItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi keluar
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Keluar'),
          content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Keluar', style: TextStyle(color: Colors.red.shade700)),
              onPressed: () {
                // TODO: Tambahkan logika logout di sini
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
          ],
        );
      },
    );
  }
}