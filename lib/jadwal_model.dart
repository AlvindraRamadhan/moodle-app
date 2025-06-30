// File: lib/jadwal_model.dart

import 'package:flutter/material.dart';

class JadwalItem {
  final String acronym;
  final String courseName;
  final String lecturerName;
  final String className;
  final String dayTime;
  final String room;
  final Color circleColor;

  JadwalItem({
    required this.acronym,
    required this.courseName,
    required this.lecturerName,
    required this.className,
    required this.dayTime,
    required this.room,
    required this.circleColor,
  });
}

// Data untuk tab "Mata Kuliah"
final List<JadwalItem> mockMataKuliahData = [
  JadwalItem(
    acronym: 'DPSI',
    courseName: 'Desain Pengembangan Sistem Informasi',
    lecturerName: 'Farid Suryanto S.Pd., M.T.',
    className: 'Kelas : C',
    dayTime: 'Selasa, 12.30 - 14.10',
    room: 'Ruang : 4.1.5.63',
    circleColor: Colors.lightBlue.shade300,
  ),
  JadwalItem(
    acronym: 'AE',
    courseName: 'Arsitektur Enterprise',
    lecturerName: 'Dr. Mursid Wahyu Hananto, S.Si, M.Kom.',
    className: 'Kelas : C',
    dayTime: 'Selasa, 12.30 - 14.10',
    room: 'Ruang : 4.1.5.63',
    circleColor: Colors.red.shade300,
  ),
  JadwalItem(
    acronym: 'RDPP',
    courseName: 'Riset dan Desain Pengalaman Pengguna',
    lecturerName: 'Imam Azhari, S.Si, M.Cs.',
    className: 'Kelas : C',
    dayTime: 'Selasa, 12.30 - 14.10',
    room: 'Ruang : 4.1.5.63',
    circleColor: Colors.purple.shade300,
  ),
  // ... Tambahkan item lainnya jika ada
];

// BARU: Data untuk tab "Praktikum" sesuai gambar
final List<JadwalItem> mockPraktikumData = [
  JadwalItem(
    acronym: 'DPSI',
    courseName: 'Prak. Desain Pengembangan Sistem Informasi',
    lecturerName: 'Farid Suryanto S.Pd., M.T.',
    className: 'Kelas : A',
    dayTime: 'Kamis, 07.00 - 08.40',
    room: 'Ruang : INTIPRO',
    circleColor: Colors.lightBlue.shade300,
  ),
  JadwalItem(
    acronym: 'AE',
    courseName: 'Prak. Arsitektur Enterprise',
    lecturerName: 'Dr. Mursid Wahyu Hananto, S.Si, M.Kom.',
    className: 'Kelas : A',
    dayTime: 'Kamis, 07.00 - 08.40',
    room: 'Ruang : INTIPRO',
    circleColor: Colors.red.shade300,
  ),
  JadwalItem(
    acronym: 'RDPP',
    courseName: 'Prak. Riset dan Desain Pengalaman Pengguna',
    lecturerName: 'Imam Azhari, S.Si, M.Cs.',
    className: 'Kelas : A',
    dayTime: 'Kamis, 07.00 - 08.40',
    room: 'Ruang : INTIPRO',
    circleColor: Colors.purple.shade300,
  ),
  JadwalItem(
    acronym: 'KSI',
    courseName: 'Prak. Keamanan Sistem Informasi',
    lecturerName: 'Prof. Dr. Ir. Imam Riadi M.Kom.',
    className: 'Kelas : A',
    dayTime: 'Kamis, 07.00 - 08.40',
    room: 'Ruang : INTIPRO',
    circleColor: Colors.pink.shade300,
  ),
  JadwalItem(
    acronym: 'TM',
    courseName: 'Prak. Teknologi Mobile',
    lecturerName: 'Dr. Arif Rahman S.Pd.I, M.Pd.I',
    className: 'Kelas : A',
    dayTime: 'Kamis, 07.00 - 08.40',
    room: 'Ruang : INTIPRO',
    circleColor: Colors.green.shade300,
  ),
  JadwalItem(
    acronym: 'JK',
    courseName: 'Prak. Jaringan Komputer',
    lecturerName: 'Prof. Dr. Ir. Imam Riadi M.Kom.',
    className: 'Kelas : A',
    dayTime: 'Kamis, 07.00 - 08.40',
    room: 'Ruang : INTIPRO',
    circleColor: Colors.pinkAccent.shade100,
  ),
];