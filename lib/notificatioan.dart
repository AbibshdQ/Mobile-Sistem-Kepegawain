import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String content;
  final String time;

  NotificationCard({required this.title, required this.content, required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Contoh penggunaan NotificationCard di dalam ListView:
class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NotificationCard(
          title: 'Pemberitahuan Kehadiran',
          content: 'Harap mengisi absen pulang anda.',
          time: '2 jam yang lalu',
        ),
        NotificationCard(
          title: 'Pemberitahuan Surat Panggilan',
          content: 'Anda telah mengirim surat panggilan baru.',
          time: 'Kemarin',
        ),
        NotificationCard(
          title: 'Pemberitahuan Surat Usulan',
          content: 'Anda telah menerima surat usulan baru.',
          time: '3 hari yang lalu',
        ),
        // Tambahkan card sesuai dengan jumlah pemberitahuan yang ada.
      ],
    );
  }
}

// Penggunaan di dalam aplikasi Flutter:
class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: NotificationList(),
    );
  }
}