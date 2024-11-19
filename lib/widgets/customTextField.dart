import 'package:flutter/material.dart';
import 'package:smartbin/shared/theme.dart';

class CustomTextField extends StatefulWidget {
  final String initialText;
  final Function(String) onTextChanged;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final double heightField;

  CustomTextField({
    Key? key,
    this.initialText = '',
    required this.onTextChanged,
    this.hintText = 'Masukkan jawaban',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.heightField = 0,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late bool _obscureText;
  Color _borderColor = whiteColor;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
    _focusNode = FocusNode();
    _obscureText = widget.obscureText;

    _focusNode.addListener(() {
      setState(() {});
      _borderColor = _focusNode.hasFocus ? greenColor : whiteColor;
    });

    _controller.addListener(() {
      setState(() {
        _borderColor = _controller.text.isNotEmpty ? greenColor : whiteColor;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heightField == 0 ? null : widget.heightField,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(color: _borderColor),
          borderRadius: BorderRadius.circular(10),
          color: greenTransparentColor),
      child: Stack(
        children: [
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            obscureText: _obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: greyTs.copyWith(),
              contentPadding: EdgeInsets.symmetric(vertical: 16),
            ),
            style: TextStyle(color: blackColor),
            keyboardType: widget.keyboardType,
            onChanged: widget.onTextChanged,
          ),
          if (widget.keyboardType == TextInputType.visiblePassword)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: greyColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}
