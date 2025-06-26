// File: lib/load_screen.dart (bagian yang diubah)

import 'dart:async';
import 'package:flutter/material.dart';
// UBAH baris import ini
import 'package:moodle_app/onboarding_screen.dart'; // <-- Ganti ke onboarding_screen.dart

class LoadScreen extends StatefulWidget {
  const LoadScreen({super.key});

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          // UBAH tujuan MaterialPageRoute
          MaterialPageRoute(builder: (context) => const OnboardingScreen()), // <-- Ganti ke OnboardingScreen()
        );
      }
    });
  }

  // 5. Pindahkan seluruh metode build() Anda ke sini
  @override
  Widget build(BuildContext context) {
    // UI yang sudah Anda buat sebelumnya tetap sama
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0071BC), // Biru atas
              Color(0xFF002F6C), // Biru bawah
            ],
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Moodle',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontFamily: 'Pacifico', // Ganti sesuai font kamu
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Complete activities anywhere, anytime',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}