# Covid-19 Tracker Guide

## Getting Started

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/teamboilerplate/covid19-flutter.git
```

**Step 2:**

Go to project root and execute the following commands in console to get the required dependencies: 

``` 
flutter pub get
flutter pub upgrade
```

### Building a release APK

Go to project root and execute the following commands in console to clean build the release APK: 

``` 
flutter clean
flutter build appbundle --target-platform android-arm,android-arm64
```

### Before you push a commmit

* Make sure that all the code is commented and legible variable names are used. Do not have any unnecessary overheads or redundant code.
* The code is formatted using the in-built dart formatter for the respective IDE being used with commas (,) placed at the appropriate positions to enhance readability.
* All local imports are replaced with the complete path to the file (example :- `import 'package:covid19/constants/app_theme.dart';`)
* Always import flutter core libaries, followed by any external library and then the local files in the end.

### When to create a new Branch

A new branch is to be created for new feature with an appropriate name. For example, when adding the blog feature, one should create a new branch from the main branch named hautr-blog (There is no set naming nomenclature that one has to follow. Just use legible branch name)

### When to merge a branch

**Get your code reviewed:**

To get feedback on your code, create a pull request. From there, you can wait for one of the collabrators to review your code to make sure everything is good to go before merging

**Resolve Feedback:**

Once a collabrator comments, resolve their commetns locally, commit and push the changes

**Merge your branch:**

Before you merge your branch, you may have to resolve merge conflicts if others have made changes to the repo. When you pull request is approved and conflict free, it'll be merged.


### Libraries & Tools Used
<b>To be updated when one uses a new tool or library</b>

* [Bloc](https://pub.dev/packages/bloc)
* [Flutter Bloc](https://pub.dev/packages/bloc)
* [HTTP](https://pub.dev/packages/http)
* [File Paths](https://pub.dev/packages/path_provider)
* [Provider](https://pub.dev/packages/provider)
* [Cached network image](https://pub.dev/packages/cached_network_image)
* [Cache Manager](https://pub.dev/packages/flutter_cache_manager)
* [FL Charts](https://pub.dev/packages/fl_chart)

### Folder Structure
Here is the core folder structure which flutter provides.

```
covid19/
|- android
|- assets
|- build
|- ios
|- lib
|- test
```

Here is the folder sturcture for assets

```
assets/
|- animation/
|- fonts/
|- images/
```

```
1- animation - Contains all the animations used in the application 
2- fonts — Contains all the custom fonts used in the application 
3- images — Contains the graphics used in the application. 
Try to avoid stroing local assets if they can be queries from the network without breaking the UX.
```

Here is the folder structure we have been using in this project

```
lib/
|- constants/
|- data/
|- models/
|- res/
|- stores/
|- ui/
|- utils/
|- widgets/
|- main.dart
|- routes.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `dimentions`, `font family`, `colors`, `text styles` and `strings`.
2- data - Contains the data layer of the project, namely, directories for network and repository.
3- model - Containts all the object classes of the project, contains sub directory for each section of the application.
4- res - Contains files generated using spider - https://pub.dev/packages/spider
5- stores - Contains all the notifiers to handle the appropriate states, contains sub directo
6- ui — Contains all the ui of the project, contains sub directory for each screen.
7- util — Contains the utilities/common functions of the application.
8- widgets — Contains the common widgets for the applications. For example, CircularProgressIndicator, Button etc.
8- routes.dart — This file contains all the routes for the application.
9- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- app_theme.dart
|- colors.dart
|- dimens.dart
|- font_family.dart
|- map_style.dart
|- strings.dart
|- text_styles.dart
```

### Data

All the business logic of your application will go into this directory, it represents the data layer of your application. It is sub-divided into two directories `hive` and `network`, each containing the domain specific logic. Since each layer exists independently, that makes it easier to unit test. The communication between UI and data layer is handled by using central repository.

```
data/
|- network/
    |- constants/
        |- endpoints.dart
    |- exceptions/
        |- network_exceptions.dart
    
|- repository.dart
    |- base_repository.dart
    |- test_repository.dart
    |- base_repository.dart

```

### UI

This directory contains all the ui of your application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen specific widgets will be placed in `widgets` directory under the relevant as shown in the example below:

> All dart files under the UI folder (except widgets) should be suffixed with`screen`

```
ui/
|- home
    |- home_screen.dart
    |- widgets
```

### Utils

Contains the common file(s) and utilities used in a project. The folder structure is as follows: 

```
utils/
|- device
    |- device_utils.dart
```

### Widgets

Contains the common widgets that are shared across multiple screens. For example, Button, TextField etc.

> All dart files under the widgets folder should be suffixed with`widget`

```
widgets/
|- progress_indicator_widget.dart
```

### Routes

This file contains the static routes for the application.


### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
