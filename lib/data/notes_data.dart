import 'package:debtrak/core/utils/constants.dart';
import 'package:debtrak/data/models/notes_model.dart';

class NotesData {
  final notes = [
    NotesModel(
      title: "Payment Reminder",
      note: "Follow up with the debtor regarding the pending ₱2,500 payment.",
      datePosted: "2025-01-04 09:15",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "Updated Agreement",
      note: "Debtor agreed to adjust weekly payment schedule to every Friday.",
      datePosted: "2025-01-06 14:22",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "Contact Attempt",
      note: "Called debtor but no response. Will retry tomorrow morning.",
      datePosted: "2025-01-08 10:05",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "Partial Payment Received",
      note: "Received ₱1,000 partial payment. Balance updated accordingly.",
      datePosted: "2025-01-10 16:40",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "Verification Needed",
      note:
          "Debtor claimed to have sent payment via GCash. Awaiting screenshot.",
      datePosted: "2025-01-11 11:28",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "Deadline Extension",
      note: "Extended payment deadline by 3 days due to medical emergency.",
      datePosted: "2025-01-12 08:50",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "New Agreement Signed",
      note: "Debtor agreed to a revised monthly plan with interest reduction.",
      datePosted: "2025-01-14 15:33",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "Missed Payment",
      note: "No payment received for 5 days. Prepare follow-up message.",
      datePosted: "2025-01-15 17:10",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "Phone Number Updated",
      note: "Debtor provided a new contact number for future communication.",
      datePosted: "2025-01-17 12:47",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "GCash Transfer Delay",
      note: "Debtor reported GCash outage causing delayed remittance.",
      datePosted: "2025-01-18 09:18",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "Payment Confirmed",
      note: "Confirmed ₱3,000 payment. Updated remaining balance.",
      datePosted: "2025-01-19 13:55",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "Reminder Sent",
      note: "Sent a polite reminder for upcoming due date next week.",
      datePosted: "2025-01-20 18:04",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "Debt Inquiry",
      note: "Debtor asked for updated balance statement. Sent via SMS.",
      datePosted: "2025-01-21 09:41",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "Overdue Notice",
      note: "Marked account as overdue after missing 2 consecutive payments.",
      datePosted: "2025-01-23 11:59",
      status: NoteStatus.active,
    ),
    NotesModel(
      title: "Final Follow-Up",
      note: "Sent final follow-up before escalating case for review.",
      datePosted: "2025-01-24 16:20",
      status: NoteStatus.active,
    ),
  ];
}
