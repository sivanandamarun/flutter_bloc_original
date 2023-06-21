import 'package:flutter/material.dart';

class DashBoardMenu extends StatefulWidget {
  String title;
  Function onMenuClick;

  DashBoardMenu({
    Key? key,
    required this.title,
    required this.onMenuClick
  }) : super(key: key);

  @override
  State<DashBoardMenu> createState() => _DashBoardMenuState();
}

class _DashBoardMenuState extends State<DashBoardMenu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onMenuClick();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 150.0,
          height: 30.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0),
            color: Colors.blue
          ),
          child: Center(
            child: Text(widget.title,style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            ),
          ),
        ),
      ),
    );
  }
}
