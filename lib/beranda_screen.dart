// File: lib/beranda_screen.dart

import 'package:flutter/material.dart';
import 'package:moodle_app/catatan_screen.dart';
import 'package:moodle_app/materi_screen.dart';
import 'package:moodle_app/profile_screen.dart'; // <-- 1. IMPORT PROFIL SCREEN
import 'package:moodle_app/tugas_screen.dart';

// Definisikan warna yang akan digunakan
const Color kDarkBlue = Color(0xFF002F6C);
const Color kLightBlue = Color(0xFFE3F2FD); // Warna latar yang sangat terang
const Color kOrange = Color(0xFFFFA726);
const Color kTextColor = Color(0xFF0D253C);

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlue,
      body: Stack( // Gunakan Stack untuk menumpuk header dan konten
        children: [
          // Konten utama yang bisa di-scroll
          SingleChildScrollView(
            child: Column(
              children: [
                // Spacer setinggi header agar konten dimulai di bawahnya
                const SizedBox(height: 120),

                // --- Konten di bawah header ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search Bar
                      _buildSearchBar(),
                      const SizedBox(height: 24),

                      // Horizontal Scroll Pengumuman
                      _buildAnnouncementSection(),
                      const SizedBox(height: 24),

                      // Menu Cepat (Tugas, Materi, dll)
                      _buildQuickMenu(context),
                      const SizedBox(height: 24),

                      // Kartu Informasi Vertikal
                      _buildInfoCard(
                        icon: Icons.rocket_launch_outlined,
                        title: 'Meningkatkan Fleksibilitas dan Aksesibilitas',
                        description: 'E-Learning menawarkan kepada mahasiswa untuk belajar sesuai dengan mereka sendiri.',
                      ),
                      const SizedBox(height: 16),
                      _buildInfoCard(
                        icon: Icons.bar_chart_outlined,
                        title: 'Peluang Pembelajaran yang Ditingkatkan',
                        description: 'E-learning mengintegrasikan elemen multimedia seperti modul interaktif, simulasi, dan diskusi online.',
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Header Kustom (menumpuk di atas konten)
          _buildCustomHeader(context), // <-- Pass context to the header
        ],
      ),
    );
  }

  // Widget helper untuk Header (sudah dimodifikasi)
  Widget _buildCustomHeader(BuildContext context) { // <-- Receive context
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 20),
      decoration: const BoxDecoration(
        color: kDarkBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Elearning', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              Text('Universitas Ahmad Dahlan', style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
          // <-- 2. WRAP AVATAR DENGAN GESTUREDETECTOR
          GestureDetector(
            onTap: () {
              // <-- 3. TAMBAHKAN NAVIGASI KE PROFILSCREEN
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.9),
              child: const Icon(Icons.person, color: kDarkBlue),
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper untuk Search Bar
  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Telusuri di sini',
          prefixIcon: const Icon(Icons.search, color: kDarkBlue),
          suffixIcon: IconButton(icon: const Icon(Icons.close, color: Colors.grey), onPressed: () {}),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  // Widget helper untuk bagian Pengumuman
  Widget _buildAnnouncementSection() {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildAnnouncementCard(),
          const SizedBox(width: 16),
          _buildAnnouncementCard(isSecond: true),
        ],
      ),
    );
  }

  Widget _buildAnnouncementCard({bool isSecond = false}) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(isSecond ? 'Perkuliahan' : 'Pengumuman', style: const TextStyle(fontWeight: FontWeight.bold, color: kTextColor)),
          const SizedBox(height: 8),
          const Text('Desain Pengembangan Sistem Informasi', style: TextStyle(color: kTextColor, fontSize: 13, fontWeight: FontWeight.w600)),
          const Text('Pertemuan ke 7 - Teknik Slicing UI Design', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const Spacer(),
          const Row(
            children: [
              Icon(Icons.access_time, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text('Kamis, 10 Juli 2025, 23.59', style: TextStyle(color: Colors.grey, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  // Widget helper untuk Menu Cepat
  Widget _buildQuickMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildQuickMenuItem(
          icon: Icons.assignment,
          label: 'Tugas',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TugasScreen()),
            );
          },
        ),
        _buildQuickMenuItem(
          icon: Icons.book,
          label: 'Materi',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MateriScreen()),
            );
          },
        ),
        _buildQuickMenuItem(
          icon: Icons.edit_note,
          label: 'Catatan',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CatatanScreen()),
            );
          },
        ),
        _buildQuickMenuItem(icon: Icons.school, label: 'Kuliah', onTap: () {}),
      ],
    );
  }

  Widget _buildQuickMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: kOrange,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: kDarkBlue, size: 28),
            ),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(color: kTextColor, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk Kartu Informasi
  Widget _buildInfoCard({required IconData icon, required String title, required String description}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: kTextColor),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: kTextColor)),
                const SizedBox(height: 4),
                Text(description, style: TextStyle(color: Colors.grey.shade700, fontSize: 13)),
              ],
            ),
          )
        ],
      ),
    );
  }
}