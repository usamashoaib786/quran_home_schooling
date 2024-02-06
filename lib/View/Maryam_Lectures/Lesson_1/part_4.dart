import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quran/Utils/utils.dart';
import 'package:quran/View/Maryam_Lectures/maryam_contents.dart';

class Lesson1Part4 extends StatefulWidget {
  @override
  _Lesson1Part4State createState() => _Lesson1Part4State();
}

class _Lesson1Part4State extends State<Lesson1Part4> {
  FlutterTts flutterTts = FlutterTts();
  bool a1 = false;
  bool a2 = false;
  bool a3 = false;
  String verse = ''; // Store Quran verse here
  final List<String> chipWords1 = ['And', 'was', 'from'];
  List<String> highlightedWords = [
    'وَ',
    'كَانَتْ',
    'مِنَ',
  ];
  List<String> chipWords = [
    'what',
    'was',
    'her Lord',
    'the one who',
    "and",
    'From',
  ];
  int currentHighlightedIndex = 0;
  bool enableGestures = true;
  List<int> selectedChipIndices = [];
// Updated to store the accumulated text
  List<Widget> textWithChips = [];
  bool completeButton = false;
  @override
  void initState() {
    super.initState();
    fetchQuranVerse(); // Implement this method to fetch a Quran verse
    setTtsLanguage();
  }

  Future<void> fetchQuranVerse() async {
    setState(() {
      verse = "وَ كَانَتْ مِنَ الْقَانِتِينَ";
    });
  }

  Future<void> setTtsLanguage() async {
    await flutterTts.setLanguage('ar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 54, 74, 83),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            pushReplacement(context, MaryamContentScreen());
          },
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        title:LinearPercentIndicator(
            percent: 1,
            lineHeight: 10,
            barRadius: Radius.circular(30),
            linearGradient: LinearGradient(
                    colors: [Colors.blue, Colors.green], // Gradient colors
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Tap the boxes to translate the blue word",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: createHighlightedText(),
                  textDirection: TextDirection.rtl,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              DottedBorder(
                color: Colors.white,
                strokeWidth: 1,
                dashPattern: [15, 15],
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 147,
                        width: MediaQuery.of(context).size.width,
                        child: txt(
                            containerText:
                                a1 == false && a2 == false && a3 == false
                                    ? ""
                                    : a1 == true
                                        ? "And she"
                                        : a2 == true
                                            ? " was truly,"
                                            : "from the devot")),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              chips(),
              const SizedBox(
                height: 30,
              ),
              completeButton == true
                  ? GestureDetector(
                    onTap: () {
                      pushReplacement(context, MaryamContentScreen());
                    },
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "Completed",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }

  TextSpan createHighlightedText() {
    List<TextSpan> spans = [];
    List<String> words = verse.split(' ');

    for (int i = 0; i < words.length; i++) {
      final isHighlighted = highlightedWords.contains(words[i]) &&
          currentHighlightedIndex == highlightedWords.indexOf(words[i]);
      spans.add(TextSpan(
        text: '${words[i]} ',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w800,
          color: (isHighlighted
              ? Colors.blue
              : Color.fromARGB(255, 208, 203, 203)),
          decoration:
              isHighlighted ? TextDecoration.underline : TextDecoration.none,
        ),
        recognizer: isHighlighted && enableGestures
            ? (TapGestureRecognizer()
              ..onTap = () {
                pronounceWord(words[i]);
              })
            : null,
        // textDirection: TextDirection.rtl, // Set text direction to RTL
      ));
    }

    return TextSpan(children: spans);
  }

  Future<void> pronounceWord(String word) async {
    await flutterTts.speak(word);
  }

  void highlightNextWord() {
    setState(() {
      currentHighlightedIndex++;
    });
  }

  Widget chips() {
    return Wrap(
      spacing: 8.0,
      children: List.generate(chipWords.length, (index) {
        return GestureDetector(
          onTap: () {
            if (a1 == false && a2 == false && a3 == false) {
              if (index == 4) {
                setState(() {
                  selectedChipIndices.add(index);
                  a1 = true;
                  a2 = false;
                  a3 = false;

                  highlightNextWord();
                });
              }
            } else if (a1 == true) {
              if (index == 1) {
                setState(() {
                  print("object");
                  selectedChipIndices.add(index);
                  a1 = false;
                  a2 = true;
                  a3 = false;
                  highlightNextWord();
                });
              }
            } else if (a2 == true) {
              if (index == 5) {
                setState(() {
                  selectedChipIndices.add(index);
                  print("objectmofo$selectedChipIndices");
                  a1 = false;
                  a2 = false;
                  a3 = true;
                  completeButton = true;
                });
              }
            }
          },
          child: Chip(
            label: Text(
              chipWords[index],
              style: const TextStyle(
                fontSize: 14.0,
                color: // Change to your desired color
                    Colors.white,
              ),
            ),
            backgroundColor: selectedChipIndices.contains(index)
                ? const Color.fromARGB(255, 99, 125, 138)
                : const Color.fromARGB(255, 34, 48, 55),
          ),
        );
      }),
    );
  }

  Widget txt({containerText}) {
    List<String> words = containerText.split(' ');
    for (String word in words) {
      if (chipWords1
          .any((chipWord1) => word.toLowerCase() == chipWord1.toLowerCase())) {
        // Display chip if the word is in the chipWord1s list
        textWithChips.add(
          Chip(
            label: Text(
              word,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 53, 79, 100),
          ),
        );
      } else {
        // Display text if the word is not in the chipWord1s list
        textWithChips.add(
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                word + ' ',
                style: const TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: -5.0,
            children: textWithChips,
          ),
        ],
      ),
    );
  }
}
