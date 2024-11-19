import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color strokeColor;
  final double borderRadius;
  final double width;
  final double height;
  final Color onTapColor;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xff09A811),
    this.textColor = Colors.white,
    this.strokeColor = const Color(0xff09A811),
    this.borderRadius = 8.0,
    this.width = double.infinity,
    this.height = 60.0,
    this.onTapColor = const Color(0xff76E47E),
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.backgroundColor; // Set initial background color
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _currentColor = widget.onTapColor;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _currentColor = widget.backgroundColor;
    });
  }

  void _onTapCancel() {
    setState(() {
      _currentColor = widget.backgroundColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: _currentColor, // Gunakan warna saat ini (yang berubah)
          borderRadius: BorderRadius.circular(widget.borderRadius),
          // border: Border.all(color: widget.strokeColor, width: 2),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
