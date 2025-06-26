// File: lib/login_screen.dart

import 'package:flutter/material.dart';
// --- PERUBAHAN 1: Import halaman login situs ---
import 'package:moodle_app/site_login_screen.dart'; // Pastikan nama project 'moodle_app' sudah benar

// Definisikan warna yang akan digunakan
const Color kDarkBlue = Color(0xFF002F6C);
const Color kLightBlue = Color(0xFF0071BC);
const Color kBackgroundColor = Color(0xFFF0F4F7); // Warna latar yang sedikit kebiruan
const Color kTextColor = Color(0xFF0D253C);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // --- PERUBAHAN 2: Buat fungsi helper untuk navigasi ---
    // Ini agar kode tidak ditulis berulang-ulang
    void navigateToSiteLogin() {
      // Menggunakan push, agar pengguna bisa kembali jika salah memasukkan URL
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SiteLoginScreen()),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            // Pusatkan konten secara vertikal
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Judul "Moodle App"
              const Text(
                'Moodle App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Pacifico', // Ganti dengan font Anda jika ada
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              const SizedBox(height: 60),

              // 2. Sub-judul "Masuk situs anda"
              const Text(
                'Masuk situs anda',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              const SizedBox(height: 20),

              // 3. Input field untuk URL
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.go, // Mengubah tombol enter menjadi 'Go'
                  // --- PERUBAHAN 3: Tambahkan aksi saat field di-submit ---
                  onFieldSubmitted: (value) {
                    navigateToSiteLogin();
                  },
                  decoration: const InputDecoration(
                    hintText: 'https://elearning.kampus.id',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 4. Teks pemisah "( Atau )"
              Text(
                '( Atau )',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: kTextColor.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 24),

              // 5. Tombol "Scan kode QR"
              ElevatedButton(
                // --- PERUBAHAN 4: Ubah onPressed untuk navigasi ---
                onPressed: navigateToSiteLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkBlue,
                  shape: const StadiumBorder(), // Membuat bentuk kapsul
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Scan kode QR',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: kDarkBlue,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // 6. Tombol "Butuh bantuan?"
              TextButton(
                onPressed: () {
                  // TODO: Implementasi halaman bantuan
                  print('Butuh bantuan? ditekan');
                },
                child: Text(
                  'Butuh bantuan?',
                  style: TextStyle(
                    color: kTextColor.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}