import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final double sizeIcon;
  final double sizeIcon2;
  final IconData? icon2;
  final String texto;
  final Color color1;
  final Color color2;
  @required
  final VoidCallback onPress;

  BotonGordo({
    this.icon = FontAwesomeIcons.circle,
    required this.texto,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
    required this.onPress,
    this.icon2,
    this.sizeIcon = 40,
    this.sizeIcon2 = 150,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _BotonGordoBackground(
            this.icon,
            this.color1,
            this.color2,
            this.icon2,
            this.sizeIcon2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140, width: 60),
              FaIcon(
                this.icon,
                color: Colors.white,
                size: this.sizeIcon,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  this.texto,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              SizedBox(width: 60),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final IconData? icon2;
  final double iconSize;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground(
    this.icon,
    this.color1,
    this.color2,
    this.icon2,
    this.iconSize,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                this.icon2 == null ? this.icon : this.icon2,
                size: this.iconSize,
                color: Colors.white.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(4, 6),
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: <Color>[
              this.color1,
              this.color2,
            ],
          )),
    );
  }
}
