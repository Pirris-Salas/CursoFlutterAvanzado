import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  final IconData iconWithBorder;
  final IconData iconFilled;
  final VoidCallback onPressed;

  FloatingActionButtonGreen({
    Key key,
    @required this.iconWithBorder,
    @required this.iconFilled,
    @required this.onPressed,
});

@override
State<StatefulWidget> createState() {
  return _FloatingActionButtonGreen();
}

}

class _FloatingActionButtonGreen extends State <FloatingActionButtonGreen>
    with AutomaticKeepAliveClientMixin {

  bool icon;

  void onPressedFav() {
    setState(() {
      // ignore: unnecessary_statements
      icon = !icon;
    });
  }

  void initState() {
    super.initState();
    this.icon = false;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Favorite",
      onPressed: (){
        onPressedFav();
        widget.onPressed();
      },
      child: Icon(
        icon ? widget.iconFilled: widget.iconWithBorder,
        color: Colors.white,
      ),
      heroTag: null,
    );
  }


}