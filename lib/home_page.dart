import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active), label: "Notifikasi"),
          BottomNavigationBarItem(
              icon: Icon(Icons.personal_injury), label: "Profil")
        ],
      ),
      body: SafeArea(
          child: Column(
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
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            )
                          ],
                        ),
                        Container(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.question_answer,
                              color: Colors.white,
                              size: 30,
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
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: [
                        Category(imagepath: "assets/bid.png", title: "Absensi",),
                        Category(imagepath: "assets/employee.png", title: "Pegawai",),
                        Category(imagepath: "assets/department.png", title: "Jabatan",),
                        Category(imagepath: "assets/letter.png", title: "Surat",),
                        
                      ],
                    ),
                  ),
                  
                  
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}

class Category extends StatelessWidget {
    final String imagepath;
    final String title;
  const Category({
    super.key,
    required this.imagepath, required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 70,
          width: 50,
          child: Column(
            children: [Image.asset(imagepath,
            width: 40,
            ),
            SizedBox(
              height: 8,
      
            ),
            Text(
              title,
              style: GoogleFonts.montserrat(fontSize: 10, ),
              
              ),
      
            ],
          ),
        ),
      ),
    );
  }
}
