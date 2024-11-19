import 'package:flutter/material.dart';
import 'package:smartbin/shared/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 92),
        child: Column(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: greenTransparentColor),
            ),
            SizedBox(height: 30),
            Container(
              child: Column(
                children: [
                  Text(
                    'Sign In',
                    style: greenTs.copyWith(fontWeight: semiBold, fontSize: 32),
                  ),
                  SizedBox(height: 16),
                  Text(
                    textAlign: TextAlign.center,
                    'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.',
                    style: greyTs.copyWith(fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
