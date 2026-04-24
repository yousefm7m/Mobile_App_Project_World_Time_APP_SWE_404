# 🌍 World Time App

A Flutter app that shows the real current time for cities around the world. Pick a city, see the time instantly, and every search gets saved to a database so you can look back at your history.

---

<div align="center">
  <img src="https://github.com/user-attachments/assets/f41cd08e-1637-4861-a430-661cb928bfe2" width="250"/>
</div>

---

## What the app does

Shows the current real time for any city you pick — fetched live from an API
The background changes between a day photo and a night photo depending on the actual time in that city
Every city you search gets saved to MongoDB automatically
You can open the history page and see every city you've ever looked up
There's a search bar in the city picker so you can find a city in one second instead of scrolling


---

## Screens
Loading Screen
The first thing you see when you open the app. Dark gradient background, a spinning cube animation, and pulsing text while it loads the time for the default city (Berlin).
<div align="center">
  <img src="https://github.com/user-attachments/assets/1b132558-0917-4707-8f43-5b25ea229aa4" width="220"/>
</div>

---

## Home Screen
Shows the day of the week, the full date, the city name, and the current time — all inside a frosted glass card floating over the background photo. Two buttons at the bottom: one to pick a new city, one to open your search history.
<div align="center">
  <img src="https://github.com/user-attachments/assets/4a7d7af3-9584-47e9-8e9d-752282a84e7b" width="220"/>
  <img src="https://github.com/user-attachments/assets/f41cd08e-1637-4861-a430-661cb928bfe2" width="220"/>
</div>

---

## Location Picker
A dark grid of city cards, each one showing the country flag and the city name. There's a search bar at the top that filters the list as you type. When you tap a city a loading spinner pops up while the time is being fetched.
<div align="center">
  <img src="https://github.com/user-attachments/assets/20433c05-d64a-4846-929e-6352a3307ff5" width="220"/>
</div>

---

## Search History
Every city you tap gets saved to MongoDB Atlas. This page shows all of them — city name, the time you saw, and the date — sorted from newest to oldest.
<div align="center">
  <img src="https://github.com/user-attachments/assets/04b4a683-ea4c-433d-b65c-446832ec5a71" width="220"/>
</div>

---
## Built with

- [Flutter](https://flutter.dev/) — the framework
- [Dart](https://dart.dev/) — the language
- [timeapi.io](https://timeapi.io/) — the free API for fetching world times
- [mongo_dart](https://pub.dev/packages/mongo_dart) — to connect to MongoDB Atlas directly from the app
- [flutter_spinkit](https://pub.dev/packages/flutter_spinkit) — for the loading animation
- [intl](https://pub.dev/packages/intl) — for formatting the time and date nicely
- [MongoDB Atlas](https://www.mongodb.com/atlas) — cloud database for storing search history

---

## How to run it

1. Clone the repo
```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```

2. Install the packages
```bash
flutter pub get
```

3. Run it
```bash
flutter run
```

> Make sure you have Flutter installed and either an emulator running or a device connected.

---

## Project structure

```
lib/
├── main.dart                  # App entry point, connects to MongoDB on startup
├── pages/
│   ├── Loading.dart           # Loading screen with animation
│   ├── home.dart              # Home screen with the glass card UI
│   ├── choose_location.dart   # City grid with search bar
│   └── history.dart           # Search history page
└── services/
    ├── world_time.dart        # Fetches time from the API
    └── db_service.dart        # Handles all MongoDB operations
```

---

## Database

The app connects directly to **MongoDB Atlas** using the `mongo_dart` package. Every time you pick a city, it saves an entry with the location name, the time, the date, and a timestamp. The history page reads all of these back sorted by most recent.

No separate backend server needed — the app talks to Atlas directly.

---

## A few things to know

- The default city when you first open the app is **Berlin**
- The day/night background switches at **6am** (day starts) and **7pm** (night starts)
- If the API fails for some reason, the app shows an error message instead of crashing
- If the database can't be reached, the history page shows an empty state message

---

## Made by


Youssuf Alshafai — Altınbaş University, Software Engineering  
Mobile Application Development Project — April 2026
