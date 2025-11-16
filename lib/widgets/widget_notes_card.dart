import 'package:date_time_format/date_time_format.dart';
import 'package:debtrak/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WidgetNotesCard extends StatelessWidget {
  final String title;
  final String note;
  final String datePosted;

  const WidgetNotesCard({
    super.key,
    required this.title,
    required this.note,
    required this.datePosted,
  });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(datePosted);

    return GestureDetector(
      onTap: () {
        final slidable = Slidable.of(context)!;
        final isClosed = slidable.actionPaneType.value == ActionPaneType.none;
        if (isClosed) {
          slidable.openStartActionPane();
        } else {
          slidable.close();
        }
      },
      child: Row(
        children: [
          _leftPartCard(dateTime, context),
          const SizedBox(width: 8),
          _centerPartCard(title, note, dateTime),
        ],
      ),
    );
  }

  Widget _leftPartCard(DateTime date, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: DebtrakPalette.ruby.deep,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateTimeFormat.format(date, format: 'M'),
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            DateTimeFormat.format(date, format: 'd'),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            DateTimeFormat.format(date, format: 'Y'),
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _centerPartCard(String title, String note, DateTime date) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(DateTimeFormat.format(date, format: 'h:i a')),
            ],
          ),
          Text(
            note,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
