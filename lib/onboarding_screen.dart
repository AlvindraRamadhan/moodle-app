// File: lib/onboarding_screen.dart

import 'package:flutter/material.dart';
import 'package:moodle_app/login_screen.dart'; // Import sudah benar

// --- Data Model untuk Konten Onboarding ---
// Membuat class ini membuat kode lebih rapi dan mudah dikelola
class OnboardingContent {
  final String title;
  final String description;

  OnboardingContent({
    required this.title,
    required this.description,
  });
}

// --- Daftar Konten untuk Setiap Halaman ---
// Anda bisa menambahkan halaman ke-3, ke-4, dst. di sini dengan mudah
final List<OnboardingContent> onboardingPages = [
  OnboardingContent(
    title: 'Belajar Mudah',
    description: 'Akses berbagai kelas dan materi pembelajaran dari mana saja, kapan saja',
  ),
  OnboardingContent(
    title: 'Fleksibel Waktu',
    description: 'Pelajari materi secara langsung atau pelajari ulang materi yang telah disimpan',
  ),
  OnboardingContent(
    title: 'Evaluasi Pembelajaran',
    description: 'Lihat Perkembangan nilai, dan aktivitas kelas Anda untuk hasil akademik terbaik',
  ),
];

// --- Warna yang Digunakan ---
const Color kDarkBlue = Color(0xFF0D253C);
const Color kLightBlue = Color(0xFFD8E4F1);
const Color kWhite = Colors.white;


// --- Widget Utama untuk Onboarding Screen ---
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Controller untuk mengelola PageView
  late PageController _pageController;
  // Variabel untuk melacak halaman saat ini
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // --- PERUBAHAN 1: Buat fungsi helper untuk navigasi ---
  // Ini dilakukan agar kode tidak berulang (DRY - Don't Repeat Yourself)
  void _navigateToLogin() {
    // pushReplacement digunakan agar pengguna tidak bisa kembali ke halaman onboarding
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  // Fungsi untuk tombol aksi (panah kanan)
  void _onNextPressed() {
    // Jika bukan halaman terakhir, pindah ke halaman selanjutnya
    if (_currentPageIndex < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // --- PERUBAHAN 2: Jika ini halaman terakhir, navigasi ke LoginScreen ---
      _navigateToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Tombol "Lewati" di kanan atas
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    // --- PERUBAHAN 3: Tombol "Lewati" juga akan navigasi ke LoginScreen ---
                    onPressed: _navigateToLogin,
                    child: const Text(
                      'Lewati',
                      style: TextStyle(
                        color: kDarkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // 2. PageView untuk konten yang bisa digeser
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingPages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final content = onboardingPages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            content.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: kDarkBlue,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            content.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: kDarkBlue.withOpacity(0.8),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // 3. Indikator Halaman
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingPages.length,
                      (index) => _buildIndicatorDot(isActive: index == _currentPageIndex),
                ),
              ),
              const SizedBox(height: 50),

              // 4. Tombol Aksi (panah)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: _onNextPressed,
                    backgroundColor: kDarkBlue,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: kWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat titik indikator
  Widget _buildIndicatorDot({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 10,
      width: isActive ? 24 : 10,
      decoration: BoxDecoration(
        color: isActive ? kDarkBlue : kLightBlue,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}