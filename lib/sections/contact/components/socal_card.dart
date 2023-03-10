import 'package:flutter/material.dart';

class SocalCard extends StatefulWidget {
  const SocalCard({
    Key? key,
    required this.iconSrc,
    required this.name,
    required this.color,
    required this.press,
  }) : super(key: key);
  final String iconSrc, name;
  final Color color;
  final Function() press;

  @override
  State<SocalCard> createState() => _SocalCardState();
}

class _SocalCardState extends State<SocalCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 25,
          ),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (isHover)
                BoxShadow(
                  color: Color.fromARGB(255, 5, 110, 175).withOpacity(0.15),
                  offset: Offset(0, 50),
                  blurRadius: 50.0,
                ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                widget.iconSrc,
                height: 80,
                width: 80,
              ),
              SizedBox(
                width: 20,
              ),
              Text(widget.name),
            ],
          ),
        ),
      ),
    );
  }
}
