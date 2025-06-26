// File: lib/main_screen.dart

import 'package:flutter/material.dart';
import 'package:moodle_app/beranda_screen.dart'; // Import halaman beranda

const Color kDarkBlue = Color(0xFF002F6C);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Melacak tab yang sedang aktif

  // Daftar halaman yang akan ditampilkan sesuai tab
  static const List<Widget> _pages = <Widget>[
    BerandaScreen(),
    // Placeholder untuk halaman lain, ganti dengan widget Anda nanti
    Scaffold(body: Center(child: Text('Halaman Jadwal'))),
    Scaffold(body: Center(child: Text('Halaman Notifikasi'))),
    Scaffold(body: Center(child: Text('Halaman Profil'))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kDarkBlue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true, // Selalu tampilkan label
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Agar item tidak bergeser
      ),
    );
  }
}