// File: lib/jadwal_screen.dart

import 'package:flutter/material.dart';
import 'jadwal_model.dart'; // Impor model dan data

// Definisikan warna yang sama agar konsisten
const Color kDarkBlue = Color(0xFF002F6C);
const Color kScaffoldBackground = Color(0xFFF0F4F8); // Latar belakang abu-abu muda

class JadwalScreen extends StatefulWidget {
  const JadwalScreen({super.key});

  @override
  State<JadwalScreen> createState() => _JadwalScreenState();
}

class _JadwalScreenState extends State<JadwalScreen> {
  int _selectedTabIndex = 0; // 0 untuk Mata Kuliah, 1 untuk Praktikum

  @override
  Widget build(BuildContext context) {
    // === PERUBAHAN UTAMA: Tentukan data mana yang akan ditampilkan ===
    final List<JadwalItem> currentData = _selectedTabIndex == 0
        ? mockMataKuliahData  // Jika tab 0 (Mata Kuliah) aktif
        : mockPraktikumData;  // Jika tab 1 (Praktikum) aktif

    return Scaffold(
      backgroundColor: kScaffoldBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kDarkBlue,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            const SizedBox(width: 8),
            const Text(
              'Jadwal',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.9),
              child: const Icon(Icons.person, color: kDarkBlue),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildToggleButtons(),

          // List of Schedules
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16), // Sesuaikan padding
              itemCount: currentData.length, // Gunakan panjang dari data saat ini
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                // Tampilkan item dari data saat ini
                return _buildScheduleCard(currentData[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk toggle button (tidak ada perubahan)
  Widget _buildToggleButtons() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade50, // Warna latar belakang toggle
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          _buildTabItem(title: 'Mata Kuliah', index: 0),
          _buildTabItem(title: 'Praktikum', index: 1),
        ],
      ),
    );
  }

  // Widget untuk item tab (tidak ada perubahan)
  Widget _buildTabItem({required String title, required int index}) {
    final bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: isSelected ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
              )
            ] : [],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? kDarkBlue : Colors.grey.shade700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk kartu jadwal (tidak ada perubahan)
  Widget _buildScheduleCard(JadwalItem item) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: item.circleColor,
            child: Text(
              item.acronym,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.courseName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black87
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.lecturerName,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.className, style: TextStyle(color: Colors.grey.shade800, fontSize: 12)),
                    Text(item.dayTime, style: TextStyle(color: Colors.grey.shade800, fontSize: 12)),
                    Text(item.room, style: TextStyle(color: Colors.grey.shade800, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}