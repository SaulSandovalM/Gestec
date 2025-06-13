# Gestec

A new Flutter project.

This system is designed to **periodically integrate information** from historical reports presented during **Government Body Sessions**, enabling ongoing data **analysis and evaluation**. It operates under a robust **information security framework** that ensures the integrity and confidentiality of the data.

---

## Key Features

- Periodic integration of historical information.
- Management of session-based reports.
- Data analysis and evaluation module.
- Role-based access control and security layers.
- Modern, responsive interface built with Flutter Web.

---

## Technologies Used

- **Flutter** – Main framework for frontend development.
- **Firebase** – For authentication, database, and storage.
- **Provider** – State management.
- **GoRouter** – Routing and navigation.
- **GitHub Actions / Firebase Hosting** – CI/CD and deployment.

---

## Setup & Installation

1. **Clone the repo**
```bash
git clone https://github.com/SaulSandovalM/creativoLabs.git
cd creativolabs
```

2. **Install dependencies**
```bash
flutter pub get
```

3. Add your .env file

Create a .env file in the root with the following keys:

```bash
FIREBASE_API_KEY=
FIREBASE_APP_ID=
FIREBASE_MESSAGING_SENDER_ID=
FIREBASE_PROJECT_ID=
FIREBASE_AUTH_DOMAIN=
FIREBASE_STORAGE_BUCKET=
FIREBASE_MEASUREMENT_ID=
```

---

## Run the app

```bash
flutter run -d chrome
```

---

## Environment Configuration

Sensitive config is managed using [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
Environment variables are defined in .env and must not be committed

---

## Architecture

This project follows a scalable, modular structure:

```bash
lib/
├── api/
├── core/
├── providers/
├── routes/
├── screens/
└── main.dart
```

---

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

---

## License

This project is licensed under the [MIT License](https://github.com/SaulSandovalM/creativoLabs/blob/main/LICENSE)

---

## Author

**Saúl Sandoval Mondragón**
Cyberpunk developer. Building the future with code and caffeine.

[Portafolio](https://saulsandovalm.github.io/Portfolio/) • [Facebook](https://www.facebook.com/SaulSandovalM) • [X](https://x.com/SaulSandovalM) • [Instagram](https://www.instagram.com/saulsandovalm/) • [YouTube](https://www.youtube.com/@saulsandovalm)

---

> **Deploy Destroy Repeat**