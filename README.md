# ArticlesListViewSample

## 📌 Overview
**ArticlesListViewSample** is an iOS application that displays a list of articles retrieved from a local JSON file or an API. The app is built using Swift and follows the MVVM architecture.

---

## 🛠️ Requirements
- **Xcode**: 15.0 or later
- **iOS**: 16.0 or later
- **Swift**: 5.0+
- **CocoaPods**: (if using external dependencies)

---

## 🚀 Installation & Setup

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/yourusername/ArticlesListViewSample.git
cd ArticlesListViewSample
```

### 2️⃣ Open the Project in Xcode
```sh
open ArticlesListViewSample.xcodeproj
```

### 3️⃣ Install Dependencies (if required)
If the project uses CocoaPods, install dependencies using:
```sh
pod install
```
Then, open `ArticlesListViewSample.xcworkspace` instead of `.xcodeproj`.

### 4️⃣ Run the App
- Select a **simulator** or **connected device** in Xcode.
- Press `Cmd + R` or click **Run ▶** in Xcode.

---

## 📄 JSON Data Handling
The app loads articles from a local JSON file (`Articles.json`). Ensure that the file is correctly added to the project bundle.

For API-based fetching, update the API key in `ArticleViewModel.swift`:
```swift
let apiKey = "YOUR_API_KEY"
let urlString = "https://newsapi.org/v2/everything?q=tesla&apiKey=\(apiKey)"
```

---

## 🧪 Running Tests
To run unit tests:
```sh
Cmd + U
```
Or, in Xcode:
1. Select **Product** → **Test**
2. Ensure the test target is **ArticlesListViewSampleTests**

If using CLI:
```sh
xcodebuild test -scheme ArticlesListViewSample -destination 'platform=iOS Simulator,name=iPhone 15'
```

---

## ⚠️ Troubleshooting
### JSON File Not Found
Ensure `Articles.json` is included in the **target membership** of the test target.

### API Returning HTML Instead of JSON
- Verify your API key.
- Ensure the API URL is correct.
- Use `print(response)` inside `fetchArticlesFromLocalJSON()` to debug.

### Tests Failing Due to Empty Articles
- Check if `fetchArticlesFromLocalJSON()` correctly loads data.
- Try replacing API calls with a **mock JSON response** in tests.

---

## 👨‍💻 Author
**Pradip Kumar**  
📧 (mailto:pradip.iosdev@gmail.com)  
🔗 (https://github.com/MrPradip)

---

## 📜 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

