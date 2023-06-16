# Ezfinanz

### Build Info

- Version: 1.0.0
- Android
    - package name : com.ezfinanz.business.mobile
    - min sdk      : 21
    - max sdk      : 32
- iOS

### Features

- Sign In  (username & password)
- Apply Loan
- Profile
- Loans (list and details)
- Notifications


### App folder structure
```
    app.dart
    main.dart
    shared/
        widgets/
        styles.dart
        constants.dart
    features/
        loans/
            data/
                model/
                    loan_dto.dart
                repo/
                    loan_repo_impl.dart
            domain/
                entity/
                    loan.dart
                repo/
                    loan_repo.dart
            presentation/
                bloc/
                    loans/
                        list/
                            loans_list_cubit.dart
                            loands_list_state.dart
                        apply/
                            new_loan_cubit.dart
                            new_loan_state.dart
                        blocs.dart
                screen
                    loans_screen.dart
                widget
                    loan_list.dart
                    loan_filter.dart
                    loan_card.dart
```

### fvm flutter doctor
```
[✓] Flutter (Channel stable, 2.8.1, on macOS 12.0.1 21A559 darwin-x64, locale en-IN)
[!] Android toolchain - develop for Android devices (Android SDK version 32.0.0)
    ✗ cmdline-tools component is missing
    Run `path/to/sdkmanager --install "cmdline-tools;latest"`
    See https://developer.android.com/studio/command-line for more details.
    ✗ Android license status unknown.
    Run `flutter doctor --android-licenses` to accept the SDK licenses.
    See https://flutter.dev/docs/get-started/install/macos#android-setup for more details.
[✗] Xcode - develop for iOS and macOS
    ✗ Xcode installation is incomplete; a full installation is necessary for iOS development.
    Download at: https://developer.apple.com/xcode/download/
    Or install Xcode via the App Store.
    Once installed, run:
    sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
    sudo xcodebuild -runFirstLaunch
    ✗ CocoaPods not installed.
    CocoaPods is used to retrieve the iOS and macOS platform side's plugin code that responds to your plugin usage on the Dart side.
    Without CocoaPods, plugins will not work on iOS or macOS.
    For more info, see https://flutter.dev/platform-plugins
    To install see https://guides.cocoapods.org/using/getting-started.html#installation for instructions.
[✓] Chrome - develop for the web
[✓] Android Studio (version 2020.3)
[✓] VS Code (version 1.63.2)
[✓] Connected device (1 available)
```

### Contributors

- Appala Reddy (appala@easycloud.in)