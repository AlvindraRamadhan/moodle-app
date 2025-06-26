// File: lib/site_login_screen.dart

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// --- PERUBAHAN 1: Import halaman MainScreen ---
import 'package:moodle_app/main_screen.dart'; // Pastikan nama project 'moodle_app' sudah benar

// Definisikan warna yang akan digunakan, bisa juga diimport dari file lain
const Color kDarkBlue = Color(0xFF002F6C);
const Color kBackgroundColor = Color(0xFFF0F4F7);
const Color kTextColor = Color(0xFF0D253C);

class SiteLoginScreen extends StatefulWidget {
  const SiteLoginScreen({super.key});

  @override
  State<SiteLoginScreen> createState() => _SiteLoginScreenState();
}

class _SiteLoginScreenState extends State<SiteLoginScreen> {
  // State untuk mengontrol visibilitas kata sandi
  bool _isPasswordVisible = false;
  // State untuk switch "Ingat Kata Sandi"
  bool _rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView( // Agar bisa di-scroll jika keyboard muncul
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),

              // 1. Judul
              const Text(
                'Moodle App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Pacifico', // Ganti dengan font kustom Anda
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Elearning',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              const Text(
                'Universitas Ahmad Dahlan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              const SizedBox(height: 40),

              // 2. Input Nama Pengguna
              _buildTextField(
                hintText: 'Nama Pengguna',
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

              // 3. Input Kata Sandi
              _buildTextField(
                hintText: 'Kata Sandi',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 16),

              // 4. Ingat Kata Sandi
              Row(
                children: [
                  Switch(
                    value: _rememberPassword,
                    onChanged: (value) {
                      setState(() {
                        _rememberPassword = value;
                      });
                    },
                    activeColor: kDarkBlue,
                  ),
                  const Text('Ingat Kata Sandi'),
                ],
              ),
              const SizedBox(height: 20),

              // 5. Tombol Masuk Situs
              ElevatedButton(
                // --- PERUBAHAN 2: Ubah onPressed untuk navigasi ke MainScreen ---
                onPressed: () {
                  // Navigasi ke MainScreen dan hapus semua rute sebelumnya
                  // agar pengguna tidak bisa kembali ke halaman login.
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                        (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkBlue,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Masuk situs',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_forward, color: kDarkBlue, size: 20),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 6. Lupa Kata Sandi
              TextButton(
                onPressed: () {
                  // TODO: Implementasi halaman lupa kata sandi
                  print('Lupa kata sandi? ditekan');
                },
                child: Text(
                  'Lupa kata sandi?',
                  style: TextStyle(color: kTextColor.withOpacity(0.8), fontSize: 14),
                ),
              ),

              const SizedBox(height: 60),

              // 7. Belum Punya Akun (di bagian bawah)
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: kTextColor.withOpacity(0.8), fontSize: 14),
                  children: [
                    const TextSpan(text: 'Belum punya akun? '),
                    TextSpan(
                      text: 'Buat akun',
                      style: const TextStyle(
                        color: kDarkBlue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // TODO: Implementasi halaman buat akun
                          print('Buat akun ditekan');
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Helper method untuk membuat text field agar tidak duplikat kode
  Widget _buildTextField({
    required String hintText,
    required IconData prefixIcon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: isPassword ? !_isPasswordVisible : false,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(prefixIcon, color: Colors.grey.shade600),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey.shade600,
            ),
            onPressed: () {
              // Update state untuk mengubah ikon dan visibilitas teks
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}