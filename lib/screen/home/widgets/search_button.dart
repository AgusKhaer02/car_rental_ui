import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  color: Colors.black87,
                ),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Choose',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' a Car'),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("Search");
              },
            ),
          ],
        ),
      ),
    );
  }
}