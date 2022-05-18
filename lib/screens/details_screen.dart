import 'package:app_de_meditacao/constants.dart';
import 'package:app_de_meditacao/widgets/bottom_nav_bar.dart';
import 'package:app_de_meditacao/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.60,
            decoration: const BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                  image: AssetImage("assets/images/meditation_bg.png"),
                  fit: BoxFit.fitWidth
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.05,),
                    Text(
                      "Meditação",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      "3-10 MIN de curso",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: size.width * 0.6,
                      child: const Text(
                          "Viva mais feliz e saudável aprendendo os fundamentos da meditação e da atenção plena"
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: const SearchBar(),
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        SessionCard(
                          sessionNum: 1,
                          isDone: true,
                          press: (){},
                        ),
                        SessionCard(
                          sessionNum: 2,
                          press: (){},
                        ),
                        SessionCard(
                          sessionNum: 3,
                          press: (){},
                        ),
                        SessionCard(
                          sessionNum: 4,
                          press: (){},
                        ),
                        SessionCard(
                          sessionNum: 5,
                          press: (){},
                        ),
                        SessionCard(
                          sessionNum: 6,
                          press: (){},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Meditação",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 17),
                                blurRadius: 23,
                                spreadRadius: -13,
                                color: kShadowColor
                            )]
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                              "assets/icons/Meditation.png"
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Básico",
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                const Text("Começar a praticar",
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: FaIcon(
                              FontAwesomeIcons.lock,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  const SessionCard({
    Key? key,
    required this.sessionNum,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  final int sessionNum;
  final bool isDone;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: kShadowColor,
                ),
              ]
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 43,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone
                            ? kBlueColor
                            : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                          Icons.play_arrow,
                          color: isDone
                              ? Colors.white
                              : kBlueColor
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      "Sessão $sessionNum",
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
