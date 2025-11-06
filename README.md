# Debtrak

A modern, lightweight, and intuitive **debt‑tracking fintech mobile app** built with **Flutter**. Debtrak helps users manage their personal loans, borrowings, and repayments with clarity and confidence.

---

## 📱 Overview

Debtrak provides a clean and structured way to record debts, monitor balances, and track repayment progress. Whether it’s personal loans, shared expenses, or business-related borrowings, Debtrak ensures users always know **how much they owe** and **how much is owed to them**.

---

## 🚀 Features

### ✅ Core Functionality

* Add, edit, and delete debt entries
* Track **borrowed** and **lent** transactions separately
* Auto-calculate remaining balances
* Categorize debts (personal, business, recurring, etc.)
* Mark full or partial repayments

### 📊 Analytics & Insights

* Summary dashboard for total owed / total owing
* Timeline view of repayments
* Visual charts (monthly activity, status breakdown)

### 🔔 Notifications

* Optional reminders for due dates
* Alerts for upcoming or overdue payments

### ☁️ Sync & Backup *(optional)*

* Local storage for offline use
* Cloud sync via Firebase or Supabase (configurable)

---

## 🛠️ Tech Stack

* **Flutter** (Dart)
* State management: Provider / Riverpod / Bloc *(project dependent)*
* Database: Hive / SQLite / DuckDB
* Charts: fl_chart
* Optional backend: Firebase / Supabase

---

## 📂 Project Structure

Typical project structure:

```
lib/
  core/
    utils/
    theme/
  data/
    models/
    repositories/
  features/
    debts/
    dashboard/
    settings/
  widgets/
  main.dart
```

---

## ▶️ Getting Started

### 1. **Clone the repository**

```bash
git clone https://github.com/icarusvagner/debtrak.git
cd debtrak
```

### 2. **Install dependencies**

```bash
flutter pub get
```

### 3. **Run the app**

```bash
flutter run -d <emulator_name>
```

---

## 🧪 Testing

```bash
flutter test
```

---

## 📦 Build Release

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

---

## 📜 License

`MIT` & `Apache` Licenses. See `MIT LICENSE` and `Apache-2.0 LICENSE` for details.

---

## 💡 Future Enhancements

* Multi-currency support
* Export to PDF/CSV
* Biometric lock (Face ID / Fingerprint)
* Shared debt groups for friends & family
* Budgeting and forecasting modules

---

**Debtrak** — Tracking your debts with clarity and ease.

