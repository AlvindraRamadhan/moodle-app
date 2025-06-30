// File: lib/notifikasi_model.dart

import 'package:flutter/material.dart';

class NotifikasiItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String timestamp;
  final bool hasUnreadDot;

  NotifikasiItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.timestamp,
    this.hasUnreadDot = false,
  });
}

// Data dummy sesuai dengan gambar
final List<NotifikasiItem> mockNotifikasiData = [
  NotifikasiItem(
    icon: Icons.notifications,
    hasUnreadDot: true,
    title: 'You have submitted your assignment submission for Practicum Session 2 Task',
    subtitle: 'Pertemuan ke 1',
    timestamp: 'Kamis, 10 Juli 2025, 23.59',
  ),
  NotifikasiItem(
    icon: Icons.check_circle,
    title: 'Course Completed',
    subtitle: 'Pertemuan ke 2',
    timestamp: 'Kamis, 10 Juli 2025, 23.59',
  ),
  NotifikasiItem(
    icon: Icons.history_toggle_off, // Ikon yang lebih mirip dengan gambar
    title: 'You Have Done Week 2 Quiz',
    subtitle: 'Pertemuan ke 2',
    timestamp: 'Kamis, 10 Juli 2025, 23.59',
  ),
  NotifikasiItem(
    icon: Icons.notifications,
    hasUnreadDot: true,
    title: 'You have submitted your assignment submission for Tugas 1 - Pengembangan Halaman HTML dan Publikasi di Github Page',
    subtitle: 'Pertemuan ke 4',
    timestamp: 'Kamis, 10 Juli 2025, 23.59',
  ),
  NotifikasiItem(
    icon: Icons.check_circle,
    title: 'Course Completed',
    subtitle: 'Pertemuan ke 2',
    timestamp: 'Kamis, 10 Juli 2025, 23.59',
  ),
];