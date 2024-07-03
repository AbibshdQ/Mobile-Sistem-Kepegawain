<<<<<<< HEAD
import 'package:android_simpeg/notificatioan.dart';
=======
>>>>>>> 61d8bcdf941b74ab1ec7d36a14351e32e68ea454
import 'package:android_simpeg/pegawai_pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:android_simpeg/pages/presensi_pages.dart'; // Sesuaikan dengan lokasi PresensiPage

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    // Daftar halaman yang ditampilkan di BottomNavigationBar
    Text('Home Page'),
    NotificationScreen(),
    Text('Profil Page'),
  ];

  void _onItemTapped(int index) {
    // Mengubah state untuk memilih item di BottomNavigationBar
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi berdasarkan index item yang dipilih
    switch (index) {
      case 0:
        // Navigasi ke halaman Home
        // Contoh: Navigator.pushNamed(context, '/home');
        break;
      case 1:
        // Navigasi ke halaman Notifikasi
        // Contoh: Navigator.pushNamed(context, '/notifications');
        break;
      case 2:
        // Navigasi ke halaman Profil
        // Contoh: Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_upload_outlined), label: "Update Data"),
          BottomNavigationBarItem(
              icon: Icon(Icons.personal_injury), label: "Profil")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped, // Menggunakan fungsi _onItemTapped untuk menangani onTap
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  color: Colors.blueGrey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://studiolorier.com/wp-content/uploads/2018/10/Profile-Round-Sander-Lorier.jpg")),
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 2))),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Halo Habib, Selamat Datang !",
                                style: GoogleFonts.montserrat(color: Colors.white),
                              )
                            ],
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => NotificationScreen()),
                                  );
                                },
                                child: Icon(
                                  Icons.notifications_active,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFF5F5F7),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextField(
                          cursorHeight: 20,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
<<<<<<< HEAD
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 205, 205, 205),
                                    width: 2),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigasi ke halaman Presensi (ubah sesuai kebutuhan)
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => attendence()),
                              );
                            },
                            child: Category(
                              imagepath: "assets/bid.png",
                              title: "Absensi",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PegawaiPages()),
                              );
                            },
                            child: Category(
                              imagepath: "assets/employee.png",
                              title: "Pegawai",
                            ),
                          ),
                          Category(
                            imagepath: "assets/department.png",
                            title: "Jabatan",
                          ),
                          Category(
                            imagepath: "assets/letter.png",
                            title: "Ajukan",
                          ),
                        ],
                      ),
=======
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(30)),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: Colors.grey, width: 2),
                                //   borderRadius: BorderRadius.circular(30),
                                // ),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: Colors.blue, width: 2),
                                //   borderRadius: BorderRadius.circular(30),
                                // ),        
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: [
                        Category(imagepath: "assets/bid.png", title: "Absensi",),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PegawaiPages()),
                            );
                          },
                          child: Category(
                            imagepath: "assets/employee.png",
                            title: "Pegawai",
                          ),
                        ),
                        Category(imagepath: "assets/department.png", title: "Jabatan",),
                        Category(imagepath: "assets/letter.png", title: "Surat",),
                        
                      ],
>>>>>>> 61d8bcdf941b74ab1ec7d36a14351e32e68ea454
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imagepath;
  final String title;
  const Category({required this.imagepath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 70,
          width: 50,
          child: Column(
            children: [
              Image.asset(
                imagepath,
                width: 40,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
