// File: lib/pengaturan_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Jika file edit_profile_screen.dart tidak ada, Anda bisa comment baris ini
// atau buat file placeholder.
import 'package:moodle_app/edit_profile_screen.dart';

const Color kDarkBlue = Color(0xFF002F6C);
const Color kScaffoldBackground = Color(0xFFE3F2FD);

class PengaturanScreen extends StatelessWidget {
  const PengaturanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Pengaturan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kDarkBlue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSettingsItem(
                context: context,
                icon: Icons.manage_accounts_outlined,
                title: 'Edit Profil',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditProfilScreen()),
                  );
                },
              ),
              _buildSettingsItem(
                context: context,
                icon: Icons.description_outlined,
                title: 'Syarat dan Ketentuan',
                onTap: () {
                  _showTermsAndConditionsDialog(context);
                },
              ),
              _buildSettingsItem(
                context: context,
                icon: Icons.headset_mic_outlined,
                title: 'Pusat Bantuan',
                onTap: () {
                  _showHelpCenterDialog(context);
                },
              ),
              _buildSettingsItem(
                context: context,
                icon: Icons.share_outlined,
                title: 'Undang Teman',
                onTap: () {
                  _showInviteFriendDialog(context);
                },
              ),
              _buildSettingsItem(
                context: context,
                icon: Icons.logout,
                title: 'Keluar',
                onTap: () {
                  // === Memanggil dialog keluar yang sudah di-style ===
                  _showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  // =======================================================================
  // === FUNGSI DIALOG KELUAR YANG TELAH DIPERBARUI ========================
  // =======================================================================
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF074584),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Anda yakin ingin keluar?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAEB8F1), // Warna biru muda/lavender
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Tidak', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Implementasi logika keluar aplikasi di sini
                          Navigator.of(context).pop(); // Tutup dialog setelah aksi
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.4), // Warna abu-abu
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Yakin', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Implementasi dialog-dialog lainnya...
  void _showTermsAndConditionsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF074584),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                IconButton(padding: EdgeInsets.zero, constraints: const BoxConstraints(), icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.of(context).pop()),
                const SizedBox(width: 16),
                const Text('Syarat dan Ketentuan', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 24),
              Flexible(child: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Moodle App - elearning.uad.ac.id', style: TextStyle(color: Colors.white, fontSize: 14)),
                const SizedBox(height: 8),
                const Text('Dengan menggunakan aplikasi Moodle App Universitas Ahmad Dahlan, Anda setuju untuk mematuhi syarat dan ketentuan berikut:', style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5)),
                const SizedBox(height: 16),
                _buildTermPoint('1. Penggunaan Aplikasi', ['Aplikasi ini hanya digunakan untuk kepentingan pembelajaran di lingkungan Universitas Ahmad Dahlan.', 'Pengguna wajib menjaga kerahasiaan akun dan bertanggung jawab atas seluruh aktivitas pada akun tersebut.']),
                _buildTermPoint('2. Hak dan Kewajiban Pengguna', ['Pengguna berhak mengakses materi pembelajaran dan mengikuti aktivitas kelas.', 'Pengguna dilarang menyebarluaskan materi tanpa izin dan wajib menjaga etika dalam penggunaan aplikasi.']),
                _buildTermPoint('3. Hak dan Tanggung Jawab Pengelola', ['Pengelola berhak melakukan pembaruan, perubahan, atau penghentian layanan kapan saja.', 'Pengelola tidak bertanggung jawab atas kerugian akibat kesalahan penggunaan aplikasi oleh pengguna.']),
                _buildTermPoint('4. Perlindungan Data', ['Data pengguna akan dijaga kerahasiaannya sesuai dengan kebijakan privasi yang berlaku.']),
              ]))),
            ]),
          ),
        );
      },
    );
  }

  Widget _buildTermPoint(String title, List<String> points) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 8),
        ...points.map((point) => Padding(padding: const EdgeInsets.only(left: 12.0, bottom: 8.0), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('•  ', style: TextStyle(color: Colors.white, fontSize: 14)),
          Expanded(child: Text(point, style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4))),
        ]))).toList(),
      ]),
    );
  }

  void _showHelpCenterDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF074584),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                IconButton(padding: EdgeInsets.zero, constraints: const BoxConstraints(), icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.of(context).pop()),
                const SizedBox(width: 16),
                const Text('Pusat Bantuan', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 24),
              Flexible(child: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Jika Anda mengalami kendala, memiliki pertanyaan, atau membutuhkan informasi lebih lanjut terkait penggunaan Moodle App Universitas Ahmad Dahlan, silakan menghubungi:', style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5)),
                const SizedBox(height: 20),
                const Text('Pusat Layanan E-Learning UAD', style: TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 8),
                _buildContactInfo(context, 'Email: ', 'elearning@uad.ac.id'),
                _buildContactInfo(context, 'Telepon: ', '+62-888-234-753-8095'),
                _buildContactInfo(context, 'Jam Operasional: ', '24 jam'),
                const SizedBox(height: 20),
                const Text('Kami akan berusaha memberikan respon dan solusi terbaik atas setiap pertanyaan atau permasalahan yang Anda sampaikan.', style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5)),
              ]))),
            ]),
          ),
        );
      },
    );
  }

  Widget _buildContactInfo(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 8.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('•  ', style: TextStyle(color: Colors.white, fontSize: 14)),
        Expanded(child: RichText(text: TextSpan(style: TextStyle(fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily, color: Colors.white, fontSize: 14, height: 1.4), children: [
          TextSpan(text: label),
          TextSpan(text: value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ]))),
      ]),
    );
  }

  void _showInviteFriendDialog(BuildContext context) {
    const String urlToCopy = 'elearningmoodleapp.uad.ac.id';

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF074584),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Undang teman',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Salin URL',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          urlToCopy,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.copy_outlined, color: Colors.white),
                      onPressed: () {
                        Clipboard.setData(const ClipboardData(text: urlToCopy));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('URL disalin ke clipboard!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}