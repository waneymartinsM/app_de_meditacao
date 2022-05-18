import 'package:app_de_meditacao/constants.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
      ),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //spacebetween
        children: [
          BottomNavItem(
            title: "Dia",
            image: "assets/icons/calendar.png",
            press: () { },
          ),
          BottomNavItem(
            title: "Todos os exercícios",
            image: "assets/icons/gym.png",
            isActive: true,
            press: () { },
          ),
          BottomNavItem(
            title: "Configuração",
            image: "assets/icons/Settings.png",
            press: () { },
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  final VoidCallback press;
  final String image;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            color: isActive
                ? kActiveIconColor
                : kTextColor,
            height: 35,
            width: 35,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive
                    ? kActiveIconColor
                    : kTextColor
            ),
          ),
        ],
      ),
    );
  }
}
