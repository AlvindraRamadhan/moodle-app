// File: lib/materi_screen.dart

import 'package:flutter/material.dart';

// Definisikan warna yang konsisten
const Color kAppBarBlue = Color(0xFF075497);
const Color kScaffoldBackground = Color(0xFFEBF3FB);
const Color kChipBackground = Color(0xFFE9EEF3);
const Color kChipTextColor = Color(0xFF5F6F80);
const Color kCardTextColor = Color(0xFF333333);

class MateriScreen extends StatefulWidget {
  const MateriScreen({super.key});

  @override
  State<MateriScreen> createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  // Data dummy untuk filter mata kuliah
  final List<String> courses = ['DPSI', 'RDPP', 'KSI', 'AE', 'JK', 'TM', 'RDPP'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Materi',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kAppBarBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Filter Mata Kuliah
          _buildCourseFilterBar(),
          // Daftar Materi
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                MateriCard(
                  title: 'Pertemuan 1: Analisis Kebutuhan Sistem',
                  description: 'Pengumpulan dan identifikasi kebutuhan penggu...',
                ),
                MateriCard(
                  title: 'Pertemuan 2: Use Case Modeling',
                  description: 'Representasi visual interaksi antara aktor dan sist...',
                ),
                MateriCard(
                  title: 'Pertemuan 3: Pemodelan Interaksi (Activity Diagram)',
                  description: 'Visualisasi alur aktivitas sistem untuk menggam...',
                ),
                MateriCard(
                  title: 'Pertemuan 4: Pemodelan konseptual Sistem (Class Diagram)',
                  description: 'Pengembangan Struktur sistem melalui entitas...',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget untuk bar filter mata kuliah yang bisa di-scroll
  Widget _buildCourseFilterBar() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final bool isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? kAppBarBlue : kChipBackground,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  courses[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : kChipTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Widget untuk satu kartu materi
class MateriCard extends StatelessWidget {
  final String title;
  final String description;

  const MateriCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kCardTextColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kChipBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.description_outlined, color: kChipTextColor),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download, size: 18),
                label: const Text('Lihat Materi'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kAppBarBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}