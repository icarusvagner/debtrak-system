import 'package:debtrak/widgets/widget_custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class WidgetShowDialog extends StatelessWidget {
  const WidgetShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          _DialogHeader(),
          const SizedBox(height: 75),
          WidgetCustomTextfield(
            controller: titleController,
            suffixIcon: LucideIcons.notebookPen,
            name: "Note Title",
          ),
          const SizedBox(height: 18),
          Expanded(
            child: WidgetCustomTextfield(
              controller: descController,
              suffixIcon: Icons.description,
              name: "Description",
              textInputType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }
}

class _DialogHeader extends StatelessWidget {
  const _DialogHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Create your new note",
            style: GoogleFonts.inter(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(2.5),
              child: Icon(Icons.close, size: 32),
            ),
          ),
        ],
      ),
    );
  }
}
