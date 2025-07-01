// File: lib/tugas_screen.dart

import 'package:flutter/material.dart';

// Definisikan warna yang konsisten
const Color kAppBarBlue = Color(0xFF075497);
const Color kScaffoldBackground = Color(0xFFEBF3FB);
const Color kDarkTextColor = Color(0xFF333333);
const Color kLightTextColor = Color(0xFF666666);

class TugasScreen extends StatelessWidget {
  const TugasScreen({super.key});

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
          'Tugas',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kAppBarBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          TugasCard(
            courseTitle: 'Teknologi Mobile',
            lecturer: 'Arif Rahman',
            tasks: [
              TaskItem(
                dueDateCategory: 'Batas waktu hari ini',
                time: '23.59',
                taskName: 'Review Aplikasi Mobile',
              ),
              TaskItem(
                dueDateCategory: 'Tenggat: Senin',
                time: '23.59',
                taskName: 'Kuis Materi Proses Pengembangan Aplikasi Mobile',
              ),
            ],
          ),
          SizedBox(height: 16),
          TugasCard(
            courseTitle: 'Keamanan Sistem Informasi',
            lecturer: 'Imam Riadi',
            tasks: [
              TaskItem(
                dueDateCategory: 'Batas waktu hari ini',
                time: '23.59',
                taskName: 'Materi Tugas',
              ),
              TaskItem(
                dueDateCategory: 'Tenggat: Senin',
                time: '23.59',
                taskName: 'Materi Tugas',
              ),
            ],
          ),
          SizedBox(height: 16),
          TugasCard(
            courseTitle: 'Riset Desain Pengalaman Pengguna',
            lecturer: 'Farid Surya',
            tasks: [
              TaskItem(
                dueDateCategory: 'Batas waktu hari ini',
                time: '23.59',
                taskName: 'Materi Tugas',
              ),
              TaskItem(
                dueDateCategory: 'Tenggat: Senin',
                time: '23.59',
                taskName: 'Materi Tugas',
              ),
            ],
          ),
          SizedBox(height: 16),
          TugasCard(
            courseTitle: 'Desain Pengembangan Sistem Informasi',
            lecturer: 'Imam Azhari',
            tasks: [
              TaskItem(
                dueDateCategory: 'Batas waktu hari ini',
                time: '23.59',
                taskName: 'Materi Tugas',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget untuk satu kartu mata kuliah
class TugasCard extends StatelessWidget {
  final String courseTitle;
  final String lecturer;
  final List<TaskItem> tasks;

  const TugasCard({
    super.key,
    required this.courseTitle,
    required this.lecturer,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: ClipRRect( // Untuk memastikan header di dalam container juga memiliki border radius
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Biru
            Container(
              width: double.infinity,
              color: kAppBarBlue,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lecturer,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Body Putih berisi daftar tugas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: tasks, // Menampilkan daftar widget TaskItem
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Widget untuk satu item tugas di dalam kartu
class TaskItem extends StatelessWidget {
  final String dueDateCategory;
  final String time;
  final String taskName;

  const TaskItem({
    super.key,
    required this.dueDateCategory,
    required this.time,
    required this.taskName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dueDateCategory,
            style: const TextStyle(color: kLightTextColor, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                '$time - ',
                style: const TextStyle(
                  color: kDarkTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  taskName,
                  style: const TextStyle(
                    color: kDarkTextColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}