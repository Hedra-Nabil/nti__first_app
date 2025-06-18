# BMI Calculator App 📱💪

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![BLoC](https://img.shields.io/badge/BLoC-3178C6?style=for-the-badge&logo=flutter&logoColor=white)

**A beautiful and modern BMI (Body Mass Index) calculator built with Flutter using BLoC/Cubit state management.**

*My first complete Flutter application developed during NTI (National Technology Institute) Flutter course*

[![GitHub stars](https://img.shields.io/github/stars/Hedra-Nabil/nti__first_app?style=social)](https://github.com/Hedra-Nabil/nti__first_app/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/Hedra-Nabil/nti__first_app?style=social)](https://github.com/Hedra-Nabil/nti__first_app/network/members)

</div>

---

## 🌟 Features

- ✨ **Beautiful UI Design**: Modern and clean interface with custom colors and SVG illustrations
- 📊 **Real-time BMI Calculation**: Accurate BMI calculation using external API
- 👥 **Gender Selection**: Support for both male and female users with visual indicators
- 🎯 **Health Categories**: Displays BMI categories (Underweight, Normal, Overweight, Obese)
- 💡 **Health Advice**: Provides personalized health recommendations based on BMI results
- 🏗️ **State Management**: Built with BLoC/Cubit for efficient and scalable state management
- 📱 **Responsive Design**: Works perfectly on different screen sizes and orientations
- 🔄 **Loading States**: Smooth loading indicators and error handling
- 🌐 **API Integration**: Real-time data fetching from health API
- 🎨 **Custom Widgets**: Reusable components for better code organization

## 🛠️ Tech Stack

- **Framework**: Flutter 3.0+
- **Language**: Dart
- **State Management**: BLoC/Cubit Pattern
- **HTTP Client**: Dio
- **UI Components**: Material Design 3
- **Icons**: SVG Assets
- **Architecture**: Clean Architecture principles

## 🚀 Getting Started

### Prerequisites

Before running this application, make sure you have:

- 📱 Flutter SDK (>=3.0.0)
- 🎯 Dart SDK (>=2.17.0)
- 💻 Android Studio / VS Code
- 📲 Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Hedra-Nabil/nti__first_app.git
   ```

2. **Navigate to the project directory**
   ```bash
   cd nti__first_app
   ```

3. **Get the dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### 🔧 Additional Setup

For the best experience, ensure you have:
- Enabled developer options on your Android device
- Connected your device via USB or set up an emulator
- Stable internet connection for API calls

## 📂 Project Structure

```
lib/
└── BMI_APP/
    └── Core/
        └── features/
            ├── data/
            │   └── model/
            │       ├── bmi_data_model.dart
            │       └── bmi_model.dart
            └── presentation/
                ├── Ui_screen/
                │   ├── bmi_welcome_screen.dart
                │   ├── bmi_home_screen.dart
                │   └── bmi_result.dart
                ├── controllers/
                │   └── git_bmi/
                │       └── cubit/
                │           ├── bmi_result_cubit.dart
                │           └── bmi_result_state.dart
                └── components/
                    ├── theme/
                    │   └── app_color.dart
                    ├── constants/
                    │   └── app_image.dart
                    ├── cutsom_text_field.dart
                    └── iamge_container.dart
main.dart
```

### 📁 Directory Explanation

| Directory | Description |
|-----------|-------------|
| `data/model/` | Data models for API responses and app data structures |
| `presentation/Ui_screen/` | All the app screens (Welcome, Home, Results) |
| `presentation/controllers/` | BLoC/Cubit state management files |
| `presentation/components/` | Reusable UI components and widgets |
| `components/theme/` | App colors and theme configuration |
| `components/constants/` | App constants like image paths |

## 🎯 Learning Outcomes

This project helped me master:

### 🏗️ Flutter Fundamentals
- Scaffold structure and navigation
- Widget composition and lifecycle
- Material Design implementation
- Custom widget development

### ⚡ State Management
- BLoC/Cubit pattern implementation
- State handling (loading, success, error)
- Event-driven architecture
- Reactive programming concepts

### 🌐 API Integration
- RESTful API consumption
- JSON parsing and data modeling
- Error handling and retry logic
- Asynchronous programming

### 🎨 UI/UX Design
- Responsive layout design
- Custom styling and theming
- User input validation
- Accessibility considerations

## 🔄 App Flow

1. **Welcome Screen**: Beautiful introduction with app branding
2. **Input Screen**: User enters name, gender, height, and weight
3. **API Call**: Real-time BMI calculation using external health API
4. **Results Screen**: Displays BMI value, health category, and recommendations

## 🌐 API Integration

This app uses external health API for accurate BMI calculations:
- **Endpoint**: BMI Calculator API
- **Method**: GET request with query parameters
- **Response**: JSON with BMI value, health category, and recommendations
- **Error Handling**: Comprehensive error states and user feedback

## 📱 Screenshots

<div align="center">

| Welcome Screen | Input Screen | Results Screen |
|:--------------:|:------------:|:--------------:|
| ![Welcome](https://github.com/Hedra-Nabil/nti__first_app/blob/main/1.jpg) | ![Input](https://github.com/Hedra-Nabil/nti__first_app/blob/main/2.jpg) | ![Results](https://github.com/Hedra-Nabil/nti__first_app/blob/main/3.jpg) |
| *Welcoming users with beautiful design* | *Easy data input with validation* | *Comprehensive health insights* |

</div>

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Hedra Nabil**

<div align="center">

[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Hedra-Nabil)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/hedra-nabil-6043221a4/)

</div>

## 🙏 Acknowledgments

- **NTI (National Technology Institute)** for the comprehensive Flutter course
- **Flutter Community** for amazing resources and documentation
- **API Provider** for reliable health calculation services
- **Material Design** for beautiful UI guidelines

## 📊 Project Stats

<div align="center">

![GitHub repo size](https://img.shields.io/github/repo-size/Hedra-Nabil/nti__first_app)
![GitHub language count](https://img.shields.io/github/languages/count/Hedra-Nabil/nti__first_app)
![GitHub top language](https://img.shields.io/github/languages/top/Hedra-Nabil/nti__first_app)

</div>

---

<div align="center">

**⭐ Star this repository if you found it helpful!**

*Made with ❤️ and Flutter*

</div>
