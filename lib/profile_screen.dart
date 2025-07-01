// File: lib/profil_screen.dart

import 'package:flutter/material.dart';
import 'package:moodle_app/edit_profile_screen.dart';
import 'package:moodle_app/pengaturan_screen.dart';

const Color kDarkBlue = Color(0xFF002F6C);
const Color kScaffoldBackground = Color(0xFFF0F4F8);

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      // Hapus `const` dari AppBar karena sekarang memiliki aksi dinamis
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kDarkBlue,
        elevation: 0,
        titleSpacing: 0,
        // Hapus `const` dari Row karena sekarang memiliki GestureDetector
        title: Row(
          children: [
            // 1. BUNGKUS PADDING DENGAN GESTUREDETECTOR UNTUK AKSI KLIK
            GestureDetector(
              onTap: () {
                // 2. TAMBAHKAN AKSI UNTUK KEMBALI KE LAYAR SEBELUMNYA
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Beri area klik yang lebih luas
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            // SizedBox tidak lagi diperlukan jika padding horizontal sudah diatur
            // const SizedBox(width: 8),
            const Text(
              'Profil',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            _buildDetailCard(),
          ],
        ),
      ),
    );
  }

  // Widget for the blue profile header
  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: const BoxDecoration(
        color: kDarkBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.school_outlined, color: Colors.white, size: 40),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Elearning Example',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '26000161001',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white.withOpacity(0.9),
                child: const Icon(Icons.person, size: 50, color: Colors.grey),
              )
            ],
          ),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _InfoColumn(value: 'Aktif', label: 'Mahasiswa'),
              _InfoColumn(value: '62', label: 'SKS'),
              _InfoColumn(value: '4', label: 'Semester'),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditProfilScreen()),
                    );
                  },
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  label: const Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: kDarkBlue, backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PengaturanScreen()),
                  );
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.settings, color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // Widget for the user details card
  Widget _buildDetailCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detail Pengguna',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          SizedBox(height: 20),
          _DetailRow(label: 'Nama', value: 'Nama Panjang Pengguna'),
          _DetailRow(label: 'Nomor Telepon', value: '089876543210'),
          _DetailRow(label: 'Alamat Email', value: '26000161001@webmail.uad.ac.id'),
          _DetailRow(label: 'Jurusan', value: 'Sistem Informasi'),
          _DetailRow(label: 'Fakultas', value: 'Sains dan Teknologi Terapan'),
          _DetailRow(label: 'Universitas', value: 'Universitas Ahmad Dahlan'),
        ],
      ),
    );
  }
}

// Helper widget for stats
class _InfoColumn extends StatelessWidget {
  final String value;
  final String label;
  const _InfoColumn({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
      ],
    );
  }
}

// Helper widget for detail rows
class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}