# 🚀 Swipe Gesture Detector – Flutter (Single Widget)

A customizable Flutter widget to detect **up, down, left, and right swipe gestures** using a single `SwipeDetector` class with configurable thresholds and velocities.

---

## ✨ Features

- Detects swipe gestures: `up`, `down`, `left`, `right`
- Adjust thresholds:
  - Minimum velocity
  - Minimum displacement
  - Maximum perpendicular movement
- Use as a wrapper for any widget
- No dependencies – just a single file

---

## 📦 Installation

Copy the `SwipeDetector` class into your project. No package installation required.

---

## 🧪 Usage

```dart
SwipeDetector(
  child: YourWidget(),
  onSwipeUp: () => print("Swiped Up"),
  onSwipeDown: () => print("Swiped Down"),
  onSwipeLeft: () => print("Swiped Left"),
  onSwipeRight: () => print("Swiped Right"),
)
```

### Optional: Custom Configuration

```dart
SwipeDetector(
  child: YourWidget(),
  swipeConfiguration: SwipeConfiguration(
    verticalSwipeMinVelocity: 250,
    horizontalSwipeMinDisplacement: 120,
  ),
  onSwipeLeft: () => print("Swiped Left"),
)
```

---

## ⚙️ SwipeConfiguration Parameters

| Property                          | Description                                        | Default |
|----------------------------------|----------------------------------------------------|---------|
| `verticalSwipeMaxWidthThreshold` | Max horizontal deviation allowed in vertical swipe | `50.0`  |
| `verticalSwipeMinDisplacement`   | Min vertical movement for a swipe to trigger       | `100.0` |
| `verticalSwipeMinVelocity`       | Min vertical speed required                        | `300.0` |
| `horizontalSwipeMaxHeightThreshold`| Max vertical deviation in horizontal swipe       | `50.0`  |
| `horizontalSwipeMinDisplacement` | Min horizontal movement to trigger                 | `100.0` |
| `horizontalSwipeMinVelocity`     | Min horizontal speed required                      | `300.0` |

---

## 📄 License

MIT License — Free to use, distribute, and modify.

---

## 👨‍💻 Author

**Paresh Mangukiya**  
🔗 [LinkedIn](https://in.linkedin.com/in/pareshmangukiya)

> Contributions and improvements are welcome!
