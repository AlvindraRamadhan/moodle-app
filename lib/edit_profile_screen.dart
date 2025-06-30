// File: lib/edit_profil_screen.dart

import 'package:flutter/material.dart';

const Color kDarkBlue = Color(0xFF002F6C);
const Color kScaffoldBackground = Color(0xFFE3F2FD); // Latar belakang biru sangat terang

class EditProfilScreen extends StatefulWidget {
  const EditProfilScreen({super.key});

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  // Controller untuk setiap form field
  late final TextEditingController _usernameController;
  late final TextEditingController _teleponController;
  late final TextEditingController _emailController;
  late final TextEditingController _jurusanController;
  late final TextEditingController _fakultasController;
  late final TextEditingController _universitasController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan data awal
    _usernameController = TextEditingController(text: 'Elearning Example');
    _teleponController = TextEditingController(text: '089876543210');
    _emailController = TextEditingController(text: '22000161042@webmail.uad.ac.id');
    _jurusanController = TextEditingController(text: 'Sistem Informasi');
    _fakultasController = TextEditingController(text: 'Sains dan Teknologi Terapan');
    _universitasController = TextEditingController(text: 'Universitas Ahmad Dahlan');
  }

  @override
  void dispose() {
    // Pastikan untuk membuang controller untuk menghindari memory leaks
    _usernameController.dispose();
    _teleponController.dispose();
    _emailController.dispose();
    _jurusanController.dispose();
    _fakultasController.dispose();
    _universitasController.dispose();
    super.dispose();
  }

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
          'Edit Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kDarkBlue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 60, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            // Form Card
            Container(
              padding: const EdgeInsets.all(24.0),
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
                children: [
                  _buildTextField(label: 'Username', controller: _usernameController),
                  _buildTextField(label: 'Nomor telepon', controller: _teleponController),
                  _buildTextField(label: 'Alamat Email', controller: _emailController),
                  _buildTextField(label: 'Jurusan', controller: _jurusanController),
                  _buildTextField(label: 'Fakultas', controller: _fakultasController),
                  _buildTextField(label: 'Universitas', controller: _universitasController, isLast: true),
                  const SizedBox(height: 24),
                  _buildActionButtons(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget helper untuk membuat text field
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: kDarkBlue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper untuk tombol Aksi
  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).pop(), // Kembali tanpa menyimpan
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: BorderSide(color: Colors.grey.shade400),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              foregroundColor: Colors.grey.shade800,
            ),
            child: const Text('Batal'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Logika untuk menyimpan data
              Navigator.of(context).pop(); // Kembali setelah menyimpan
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: kDarkBlue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Simpan'),
          ),
        ),
      ],
    );
  }
}