# Shopping App

A Flutter mobile application for Android and iOS devices. 
The app includes the following features:
- **Product Grid**: Displays a grid view of available products fetched via the [DummyJSON API](https://dummyjson.com/products) using the `http` package.
- **Product Details**: Navigate to a detailed screen for each product.
- **Shopping Cart**: Allows users to add items to the cart, update quantities, and remove items.
  Items in the cart are stored locally on the device using SQLite for persistence.

## Technologies Used
- **Flutter**: Cross-platform UI framework.
- **Bloc (Cubit)**: State management.
- **SQLite**: Local database for cart persistence.
- **CachedNetworkImage**: To show images from the internet and keep them in the cache directory.
- **HTTP**: API communication.
- **GetIt**: Dependency injection.

## Prerequisites
Before running the application, ensure you have the following installed:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- A compatible IDE (e.g., Android Studio, VS Code, Xcode)
- An Android emulator / iOS simulator or device

## Setup and Run

### 1. Clone or download the Repository from https://github.com/DaryaYuryeva/products_flutter.git
### 2. Open project and Install Dependencies using a command 'flutter pub get'
### 3. Run the Application On Android Emulator/Device or iOS Simulator/Device
