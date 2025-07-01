// File: lib/catatan_screen.dart

import 'package:flutter/material.dart';

// Color constants for consistency
const Color kAppBarBlue = Color(0xFF075497);
const Color kScaffoldBackground = Color(0xFFEBF3FB);
const Color kCardTextColor = Color(0xFF333333);
const Color kCardSubtextColor = Color(0xFF888888);

// A simple data model for a note
class Note {
  final String title;
  final String date;
  final String course;
  const Note({required this.title, required this.date, required this.course});
}

// The main screen widget
class CatatanScreen extends StatelessWidget {
  const CatatanScreen({super.key});

  // Dummy data to populate the list, based on the image
  final List<Note> notes = const [
    Note(title: 'Daftar Tugas Matakuliah', date: '01/5/25', course: 'Desain Pengembangan Sistem Informasi'),
    Note(title: 'Daftar Tugas Praktikum', date: '06/6/25', course: 'Prak. Keamanan Sistem Informasi'),
    Note(title: 'List Deadline Matakuliah', date: '09/5/25', course: 'Desain Pengembangan Sistem Informasi'),
    Note(title: 'List Deadline Praktikum', date: '11/5/25', course: 'Prak. Keamanan Sistem Informasi'),
    Note(title: 'Jadwal Praktikum', date: '12/5/25', course: 'Prak. Jaringan Komputer'),
    Note(title: 'Jadwal Matakuliah', date: '24/5/25', course: 'Riset Desain Pengalaman Pengguna'),
    Note(title: 'Daftar Seminar', date: '17/6/25', course: 'UI/UX'),
    Note(title: 'Laporan Tugas', date: '06/6/25', course: 'Laporan Tugas Arsitektur Enterprise'),
    Note(title: 'Laporan Praktikum', date: '08/7/25', course: 'Prak. Keamanan Sistem Informasi'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Catatan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: kAppBarBlue,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // The scrollable list of notes
          ListView.builder(
            // Add padding to prevent content from being hidden by the bottom bar
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
            // Total items = number of notes + 1 for the search bar
            itemCount: notes.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                // The first item in the list is the search bar
                return _buildSearchBar();
              }
              // The rest are the note cards
              final note = notes[index - 1];
              return _NoteCard(note: note);
            },
          ),
          // The bottom action bar that floats on top of the list
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomActionBar(notes.length),
          )
        ],
      ),
    );
  }

  // Helper widget for the search bar
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Telusuri di sini',
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
          suffixIcon: IconButton(
            icon: Icon(Icons.close, color: Colors.grey.shade600),
            onPressed: () { /* Add clear search logic here */ },
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        ),
      ),
    );
  }

  // Helper widget for the bottom action bar
  Widget _buildBottomActionBar(int noteCount) {
    return Container(
      height: 70, // A fixed height for the bar
      decoration: const BoxDecoration(
        color: kAppBarBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              '$noteCount Catatan',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: const Icon(Icons.edit_outlined, color: Colors.white, size: 28),
              onPressed: () { /* Add logic to create a new note */ },
            ),
          ),
        ],
      ),
    );
  }
}

// Helper widget for a single note card
class _NoteCard extends StatelessWidget {
  final Note note;
  const _NoteCard({required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kCardTextColor,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                note.date,
                style: const TextStyle(color: kCardSubtextColor, fontSize: 13),
              ),
              const SizedBox(width: 8),
              const Text(
                '•',
                style: TextStyle(color: kCardSubtextColor, fontSize: 13),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  note.course,
                  style: const TextStyle(color: kCardSubtextColor, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}