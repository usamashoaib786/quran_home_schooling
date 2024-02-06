import 'package:flutter/material.dart';
import 'package:quran/Utils/utils.dart';
import 'package:quran/Utils/widgets/others/app_text.dart';
import 'package:quran/View/Maryam_Lectures/Lesson_1/part_1.dart';
import 'package:quran/View/Maryam_Lectures/Lesson_2/part_1.dart';

class MaryamContentScreen extends StatefulWidget {
  const MaryamContentScreen({super.key});

  @override
  State<MaryamContentScreen> createState() => _MaryamContentScreenState();
}

class _MaryamContentScreenState extends State<MaryamContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 72, 82),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 73, 114, 147),
            leading: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 20),
              title: AppText.appText('Maryam', textColor: Colors.black),
              centerTitle: true,
              background: Image.asset(
                "assets/images/img1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              GestureDetector(
                onTap: () {
                  push(context, Lesson1Part1());
                },
                child: customColumn(
                    txt: "1. The Daughter of Imran",
                    img: "assets/images/img3.jpeg"),
              ),
              GestureDetector(
                onTap: () {
                  push(context, Lesson2Part1());
                },
                child: customColumn(
                    txt: "2. The Birth of Maryam",
                    img: "assets/images/img2.jpeg"),
              ),
              customColumn(
                  txt: "3. The Care of Maryam", img: "assets/images/img3.jpeg"),
              customColumn(
                  txt: "4. Maryam's Blessings", img: "assets/images/img2.jpeg"),
              customColumn(
                  txt: "5. The Dua of Zakariyyah",
                  img: "assets/images/img3.jpeg"),
              customColumn(
                  txt: "6. The Choosen One", img: "assets/images/img2.jpeg"),
              customColumn(
                  txt: "7. The Good News", img: "assets/images/img3.jpeg"),
              customColumn(
                  txt: "8. The Son of Maryam", img: "assets/images/img2.jpeg"),
              customColumn(
                  txt: "9. The Birth of Isa", img: "assets/images/img3.jpeg"),
              customColumn(
                  txt: "10. The Vow of Silence ",
                  img: "assets/images/img2.jpeg"),
              customColumn(
                  txt: "11. The City's Reaction",
                  img: "assets/images/img3.jpeg"),
              customColumn(
                  txt: "12. The Miracle", img: "assets/images/img2.jpeg"),
            ]),
          ),
        ],
      ),
    );
  }

  Widget customColumn({txt, img}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("$img"), fit: BoxFit.cover),
                shape: BoxShape.circle,
                color: Colors.amber),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.appText("$txt",
                  textColor: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 9,
              ),
              SizedBox(
                width: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 7,
                      width: 15,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(100),
                          )),
                    ),
                    Container(
                      height: 7,
                      width: 15,
                      color: Colors.green,
                    ),
                    Container(
                      height: 7,
                      width: 15,
                      color: Colors.green,
                    ),
                    Container(
                      height: 7,
                      width: 15,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(100),
                          )),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
