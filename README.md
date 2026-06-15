# 🍔 Al-Tayebat Restaurant App

<p align="center">
  <!-- <img src="assets/logo.png" width="180"/> -->
    <img width="180" height="180" alt="logo" src="https://github.com/user-attachments/assets/9cc29226-a52d-4984-980a-7489446eb665" />

</p>

<p align="center">
  A modern Flutter restaurant application built using <b>BLoC Architecture</b> and Feature-First structure.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-blue"/>
  <img src="https://img.shields.io/badge/BLoC-State%20Management-blueviolet"/>
  <img src="https://img.shields.io/badge/Clean-Architecture-success"/>
  <img src="https://img.shields.io/badge/Platform-Android-green"/>
</p>

---

# 📱 Demo

<p align="center">
  <img src="https://github.com/user-attachments/assets/e484d5e8-9389-4159-a19c-b51d0fd6bb51" width="300">
</p>

---

# ✨ Features

### 🔐 Authentication

* Login
* Register
* Forgot Password

### 🏠 Home

* Featured Offers
* Categories
* Best Sellers
* Quick Navigation

### 🍽 Menu

* Category Tabs
* Dynamic Food List
* Search Ready Structure

### 🍔 Food Details

* Multiple Sizes
* Quantity Selector
* Add To Cart

### 🛒 Cart

* Add / Remove Items
* Quantity Management
* Total Price Calculation

### 📦 Orders

* Current Orders
* Previous Orders

### 👤 Profile

* User Information
* Settings

### 📞 Contact Us

* Phone Numbers
* Address
* Social Media Links
* Google Maps Integration

---

# 📸 Screenshots

## Authentication

| Login                                                                                                   | Register                                                                                                | Forgot Password                                                                                         |
| ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| <img src="https://github.com/user-attachments/assets/94117516-9000-4472-a2a3-198b42c82c2b" width="250"> | <img src="https://github.com/user-attachments/assets/e19ddd4c-9430-43ec-bba3-ccd09eaacdd3" width="250"> | <img src="https://github.com/user-attachments/assets/8444066f-87d2-401b-9b85-5e3e906e4e24" width="250"> |

---

## Main Screens

| Home                                                                                                    | Menu                                                                                                    | Food Details                                                                                            |
| ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| <img src="https://github.com/user-attachments/assets/e2a40781-78a8-4ba8-a065-ee3c4f8f6bf8" width="250"> | <img src="https://github.com/user-attachments/assets/c1b67726-b092-4754-8531-b6f1ca4e8a64" width="250"> | <img src="https://github.com/user-attachments/assets/639e1922-95d2-44de-b48e-3aaa56946d97" width="250"> |

---

## Additional Screens

| Cart                                                                                                    | Orders                                                                                                  | Profile                                                                                                 |
| ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| <img src="https://github.com/user-attachments/assets/1b52819f-72bd-4476-aa42-80ee0d7ea050" width="250"> | <img src="https://github.com/user-attachments/assets/aeac949d-bc24-4edb-bc04-785861c5aa20" width="250"> | <img src="https://github.com/user-attachments/assets/7e0a879c-9221-4799-9bf8-ad34e7de31be" width="250"> |

---

# 🏗 Architecture

The project follows:

```text
Feature First Architecture
        +
BLoC State Management
```

```text
lib/
│
├── core/
│
├── features/
│   ├── auth/
│   ├── home/
│   ├── menu/
│   ├── food_details/
│   ├── cart/
│   ├── orders/
│   ├── profile/
│   └── contact_us/
│
└── main.dart
```

---

# 🔄 BLoC Flow

```text
UI
 ↓
Event
 ↓
Bloc
 ↓
Repository
 ↓
State
 ↓
UI
```

---

# 🛠 Tech Stack

| Technology   | Usage                |
| ------------ | -------------------- |
| Flutter      | UI Framework         |
| Dart         | Programming Language |
| flutter_bloc | State Management     |
| Equatable    | State Comparison     |
| JSON         | Local Data Source    |

---

# 🚀 Getting Started

### Clone Repository

```bash
git clone https://github.com/basm1610/Altaypat.git
```

### Install Packages

```bash
flutter pub get
```

### Run Project

```bash
flutter run
```

---

# 📂 Assets

```text
assets/
├── images/
├── icons/
├── fonts/
└── data/
    └── menu.json
```

---

⭐ If you like the project, don't forget to give it a star.
