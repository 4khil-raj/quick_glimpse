import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search',
            style: GoogleFonts.rubik(fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
                hintText: 'Type here', controller: searchController),
            SizedBox(
              height: 12,
            ),
            Text(
              'Results',
              style: GoogleFonts.poppins(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
