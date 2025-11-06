import 'package:debtrak/core/utils/colors.dart';
import 'package:debtrak/data/notes_data.dart';
import 'package:debtrak/widgets/widget_notes_card.dart';
import 'package:debtrak/widgets/widget_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NotesPage extends StatelessWidget {
  final String? id;
  const NotesPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final data = NotesData().notes;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Blue gradient header
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [DebtrakPalette.blue.deep, DebtrakPalette.blue.dark],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          /// Scrollable content view
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 55),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      // Page title
                      Text(
                        "Notes",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NotesStatusLabel(
                            icon: LucideIcons.filePlus,
                            title: "New Notes",
                            count: 5,
                          ),
                          NotesStatusLabel(
                            icon: LucideIcons.history,
                            title: "Old Notes",
                            count: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 55),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(15, 26, 15, 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Notes",
                          style: GoogleFonts.outfit(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: WidgetNotesCard(
                            title: data[index].title,
                            note: data[index].note,
                            datePosted: data[index].datePosted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => Dialog.fullscreen(
            backgroundColor: Colors.white,
            child: WidgetShowDialog(),
          ),
        ),
        backgroundColor: DebtrakPalette.aqua.deep,
        child: Icon(LucideIcons.plus, size: 18, color: Colors.white),
      ),
    );
  }
}

class NotesStatusLabel extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;

  const NotesStatusLabel({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.white),
        const SizedBox(width: 6),
        Text(
          "$count",
          textAlign: TextAlign.left,
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          textAlign: TextAlign.left,
          style: GoogleFonts.roboto(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
