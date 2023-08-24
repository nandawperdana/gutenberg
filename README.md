# gutenberg

# Gutenberg Free Books App

![Flutter Version](https://img.shields.io/badge/flutter-3.13.0-blue)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

Welcome to **Gutenberg Free Books App**, a mobile application built using the Flutter framework. This app utilizes the Gutenberg API to retrieve and display information about books.

## Features

- View a list of books from the Gutenberg API.
- Explore book details including title, author, and publication year.
- Search for books based on keywords.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Flutter 3.13.0: Make sure you have the latest stable release of Flutter installed. You can download it from [here](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/nandawperdana/gutenberg.git
   ```

2. Navigate to the project directory:

   ```bash
   cd gutenberg
   ```

3. Install dependencies:

   ```bash
   make init
   ```
   
   If you're using FVM
   ```bash
   make init fvm=1
   ```

### Usage

1. Start an Android emulator or connect a physical Android device.

2. Run the app:

   ```bash
   make run
   ```

   This will launch the app on the connected Android device or emulator.

3. Similarly, for iOS, start an iOS simulator or connect a physical iOS device and run:

   ```bash
   make run
   ```

### Screenshots
<img src="screenshots/iPhone Details.png" width="200"> <img src="screenshots/iPhone List.png" width="200">

### API Integration

This app uses the Gutenberg API to retrieve book data. You can find more information about the API [here](http://gutendex.com/).

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Happy Fluttering! 🚀