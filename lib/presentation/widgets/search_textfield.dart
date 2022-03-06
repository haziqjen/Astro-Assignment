import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width* 0.9,
      child: TextField(
        autofocus: false,
        cursorColor: Colors.grey[700],
        cursorWidth: 1.5,
        decoration: InputDecoration(
            hintText: 'Search Food',
            hintStyle: GoogleFonts.roboto(color: Colors.black45, fontSize: 14),
            fillColor: Colors.grey[100],
            prefixIcon: const Icon(Icons.search),
            filled: true,
            enabled: true,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 0, horizontal: 15.0),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.grey[100]!),
                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.grey[100]!),
                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.grey[100]!),
                borderRadius: const BorderRadius.all(Radius.circular(20.0)))
        ),
        onChanged: (String val) => {},
        onSubmitted: (String val) {},
      ),
    );
  }
}
