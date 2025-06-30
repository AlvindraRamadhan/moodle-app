// File: lib/main_screen.dart

import 'package:flutter/material.dart';
import 'package:moodle_app/beranda_screen.dart'; // Pastikan path import ini benar
import 'package:moodle_app/jadwal_screen.dart';
import 'package:moodle_app/notifikasi_screen.dart';
import 'package:moodle_app/profile_screen.dart'; // 1. IMPORT HALAMAN PROFIL

const Color kDarkBlue = Color(0xFF002F6C);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 3; // Melacak tab yang sedang aktif, langsung ke profil untuk demo

  // Daftar halaman yang akan ditampilkan sesuai tab
  static const List<Widget> _pages = <Widget>[
    BerandaScreen(),
    JadwalScreen(),
    NotifikasiScreen(),
    ProfilScreen(), // 2. GANTI PLACEHOLDER DENGAN HALAMAN PROFIL
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ikon dan label untuk BottomNavigationBar
    final bottomNavItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: 'Beranda',
      ),
      const BottomNavigationBarItem(
        // Menggunakan ikon dari gambar untuk konsistensi
        icon: Icon(Icons.calendar_month_outlined),
        activeIcon: Icon(Icons.calendar_month),
        label: 'Jadwal',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.notifications_outlined),
        activeIcon: Icon(Icons.notifications),
        label: 'Notifikasi',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        activeIcon: Icon(Icons.person),
        label: 'Profil',
      ),
    ];

    // Memberi style pada label agar lebih mirip dengan gambar
    final unselectedLabelStyle = TextStyle(color: Colors.grey.shade600);
    final selectedLabelStyle = const TextStyle(color: kDarkBlue, fontWeight: FontWeight.w600);


    return Scaffold(
      // Menggunakan IndexedStack agar state setiap halaman tetap terjaga
      // saat berpindah tab.
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: _selectedIndex,
        selectedItemColor: kDarkBlue,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: selectedLabelStyle,
        unselectedLabelStyle: unselectedLabelStyle,
        showUnselectedLabels: true, // Selalu tampilkan label
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Agar item tidak bergeser
      ),
    );
  }
}