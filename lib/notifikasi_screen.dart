// File: lib/notifikasi_screen.dart

import 'package:flutter/material.dart';
import 'notifikasi_model.dart'; // Impor model dan data

const Color kDarkBlue = Color(0xFF002F6C);
const Color kScaffoldBackground = Color(0xFFF0F4F8);

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kDarkBlue,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
            const SizedBox(width: 8),
            const Text(
              'Notifikasi',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.9),
              child: const Icon(Icons.person, color: kDarkBlue),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: mockNotifikasiData.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return _buildNotificationCard(mockNotifikasiData[index]);
        },
      ),
    );
  }

  Widget _buildNotificationCard(NotifikasiItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon dengan titik notifikasi (jika ada)
          _buildIconWithDot(item),
          const SizedBox(width: 16),
          // Konten Notifikasi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey.shade500),
                    const SizedBox(width: 4),
                    Text(
                      item.timestamp,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper untuk membuat ikon dengan titik hijau
  Widget _buildIconWithDot(NotifikasiItem item) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          item.icon,
          size: 28,
          color: Colors.black87,
        ),
        if (item.hasUnreadDot)
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade400,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
            ),
          ),
      ],
    );
  }
}