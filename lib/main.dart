import 'package:app_de_meditacao/constants.dart';
import 'package:app_de_meditacao/screens/details_screen.dart';
import 'package:app_de_meditacao/widgets/bottom_nav_bar.dart';
import 'package:app_de_meditacao/widgets/category_card.dart';
import 'package:app_de_meditacao/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meditação diária",
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: const HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //isso nos dará a altura e a largura totais do seu dispositivo:
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * .60,
            decoration: const BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage(
                    "assets/images/undraw_pilates_gpdb.png"
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52, //52
                      width: 52,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.bars,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Olá, seja bem vindo!",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        CategoryCard(
                          title: "Recomendação de dieta",
                          image: "assets/icons/Hamburger.png",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Exercícios de Kegel",
                          image: "assets/icons/Excrecises.png",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Meditação",
                          image: "assets/icons/Meditation.png",
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context){
                                  return const DetailsScreen();
                                }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Yoga",
                          image: "assets/icons/yoga.png",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



