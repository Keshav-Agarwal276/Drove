# Drove
<p>
With the increasing demand for vehicles, there’s been a drastic hike in road accidents. Accidents due to driver’s drowsiness are one of the main and threatening reasons for road accidents.</p> 
	<p>In order to reduce accidents due to the driver’s drowsiness, We’ve developed an app to prevent the driver from falling asleep. The app uses machine learning to identify whether the driver is alert or drowsy. In the case, the driver is drowsy the app alerts the driver with a beep. 
The app also has an emergency contact section for the user to fill their emergency contact details in case of unforeseen circumstances.</p> 


<a href="https://github.com/Keshav-Agarwal276/Drove/blob/master/UI/logo.png">
         <img alt="Qries" src="https://github.com/Keshav-Agarwal276/Drove/blob/master/UI/logo.png"
         width=1000" height="600"></a>

## Getting Started ##
 __Note:__ Make sure your Flutter environment is setup. If not please read <a href="https://flutter.dev/docs">Flutter Documentation</a>.

__Installation__
In the command terminal, run the following commands:
```git
$ git clone https://github.com/Keshav-Agarwal276/Drove.git
$ cd Drove
$ flutter doctor
$ flutter pub get
$ flutter run
```
## Stimulate for iOS ##

###### Method One ######
```
Open the project in Xcode from ios/Runner.xcodeproj.
Hit the play button.
```

###### Method Two ######
In the command terminal, run the following commands:
```
$ open -a Simulator
$ flutter doctor
$ flutter pub get
$ flutter run
```

## Stimulate for Android ##
Make sure you have an _Android Emulator_ installed and running.
Run the following command in your terminal.
```
$ flutter doctor
$ flutter pub get
$ flutter run
```

## Digitisation Features:

* Splash
* Sign In
* Sign Up with email or google
* Detection(Dashboard)
* Profile
* Update Profile

### Up-Coming Features:
* Automatically detect accident occurance and alert the nearest Hospital.

### Libraries & Tools Used
 * [cupertino_icons](https://pub.dev/packages/cupertino_icons)
 * [giffy_dialog](https://pub.dev/packages/giffy_dialog)
 * [curved_navigation_bar](https://pub.dev/packages/custom_dialog)
 * [firebase_core](https://pub.dev/packages/firebase_core)
 * [cloud_firestore](https://pub.dev/packages/cloud_firestore)
 * [firebase_auth](https://pub.dev/packages/firebase_auth)
 * [page_transition](https://pub.dev/packages/page_transition)
 * [google_sign_in](https://pub.dev/packages/google_sign_in)
 * [tflite](https://pub.dev/packages/tflite)
 * [image_picker](https://pub.dev/packages/image_picker)
 * [camera](https://pub.dev/packages/camera)
 * [percent_indicator](https://pub.dev/packages/percent_indicator)
 * [flutter_spinkit](https://pub.dev/packages/flutter_spinkit)
 * [firebase_database](https://pub.dev/packages/firebase_database)
 * [http](https://pub.dev/packages/http)
 * [shared_preferences](https://pub.dev/packages/shared_preferences)
 * [path](https://pub.dev/packages/path)
 * [modal_progress_hud](https://pub.dev/packages/modal_progress_hud)



### Folder Structure
Here is the core folder structure which flutter provides.

```
Digitisation/
|- ML Model
|- UI
|- android
|- assets/
|- images/
|- ios
|- lib
```


Here is the folder structure we have been using in this project for __*ML Model Development*__

```
ML Model/
|- dataset/
|- model
```

Now, lets dive into the ML Model folder which has the code for the application.
```
1- dataset — This is the dataset of the model in which our ml model is running, it contains two parts firstly the Alert and sencondly the Drowsy.
2- model — This model is used to predict whether the user(driver) is awake or drowsey as soon as the user will start showing its symptoms it will immediately alert the user. This folder contain two item the tf-lite ml model and it corresponding labels
```
Here is the folder structure we have been using in this project for __*UI UX Development*__

```
UI UX/
|- Create Account.png
|- Dashbourd.png
|- Forget Password.png
|- Profile.png
```

Here is the folder structure we have been using in this project for __*Flutter App*__

```
lib/
|- helper/
|- models/
|- screens/
|- services/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- helper — In this folder all the helper function and classes are present this folder which helps to provide support to the ml model running in background.
2- models — In this folder all the sub-helper function and classes are present this folder which helps to provide support to the main app.
3- services — It contain firebase linked file which help us to keep our application in contact with Firebase and Firebase Real Time Database.
4- screens — Contains all the frontened of your project, contains sub directory for each screen.
5- main.dart — This is the starting point of the application. All the application level configurations are defined in this file i.e, dashboard,profile,splash,etc.
```
### Helper

This directory contains all the helper of the ml model application. In this folder all the sub-helper function and classes are present this folder which helps to provide support to the tf lite model. It basically has 3 dart files firstly, the app_helper.dart which consists the caller method function.Secondly the camera_helper.dart which consists the the all the camera module and by default its set to Front Camera and finally the tflite_helper.dart which gives the stream of result from the tflite-model

```
model/
|- app_helper
|- camera_helper
|- tflite_helper

```

### Model

This directory contains all the model of the application. In this folder all the sub-helper function and classes are present this folder which helps to provide support to the main app. It basically has 2 dart files firstly, the bottomnav.dart which consists the bottom navbar widget and making it globally for every screen and finally the result.dart which contains the stream of result received from the tflite-model

```
model/
|- bottom_navbar
|- result

```

### Services

This directory contains all the services required for the application. It contain firebase linked file which help us to keep our application in contact with Firebase and Firebase Real Time Database.

```
services/
|- auth
|- database
```

### Screens

This directory contains all the ui of your application. It helps to easily distinguished between frontened and backened

```
screens/
|- detect_screen
|- login_screen
|- profile
|- signup_screen
|- update_profile
|- welcome_screen

```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
import 'package:drove/screens/detect_screen.dart';
import 'package:drove/screens/profile.dart';
import 'package:drove/screens/update_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drove/screens/login_screen.dart';
import 'package:drove/screens/signup_screen.dart';
import 'package:drove/screens/welcome_screen.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:'/welcome_screen',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/welcome_screen':
              return PageTransition(
                child: WelcomeScreen(),
                type: PageTransitionType.leftToRight,
                settings: settings,
              );
              break;
            case '/login_screen':
              return PageTransition(
                child: LoginScreen(),
                type: PageTransitionType.leftToRight,
                settings: settings,
              );
              break;
            case '/signup_screen':
              return PageTransition(
                child: SignupScreen(),
                type: PageTransitionType.leftToRight,
                settings: settings,
              );
              break;
            case '/dashboard':
              return PageTransition(
                child:  DetectScreen(title: 'Drove'),
                type: PageTransitionType.leftToRight,
                settings: settings,
              );
              break;
            case '/profile_screen':
              return PageTransition(
                child: ProfileScreen(),
                type: PageTransitionType.leftToRight,
                settings: settings,
              );
              break;
            case '/update_profile':
              return PageTransition(
                child: UpdateProfileScreen(),
                type: PageTransitionType.leftToRight,
                settings: settings,
              );
              break;
            default:
              return null;
          }
        });
  }
}

```

## Demo ##
<p>
<a href="https://github.com/Keshav-Agarwal276/Drove/tree/master/UI">
         <img alt="Qries" src="https://github.com/Keshav-Agarwal276/Drove/blob/master/UI/Log%20In%20%E2%80%93%201.png"
         width=300" height="500">
                                
<a href=" ">
         <img alt="Qries" src="https://github.com/Keshav-Agarwal276/Drove/blob/master/UI/SignIn.jpg"
         width=300" height="500">  
</p>
  
 <p> 
<a href="https://github.com/Keshav-Agarwal276/Drove/tree/master/UI">
         <img alt="Qries" src="https://github.com/Keshav-Agarwal276/Drove/blob/master/UI/Profile.jpg"
         width=300" height="500">
                                
                                
<a href="https://github.com/Keshav-Agarwal276/Drove/tree/master/UI">
         <img alt="Qries" src="https://github.com/Keshav-Agarwal276/Drove/blob/master/UI/Update_Profile.jpg"
         width=300" height="500">  
</p>
                                
<p> 
<a href=" ">
         <img alt="Qries" src="https://github.com/Keshav-Agarwal276/Drove/blob/master/UI/updated_profile_gif.gif"
         width=300" height="500">
</p>   
For more screenshot open folder Screenshots </a>

## Conclusion
<p>
In conclusion, this is just a small prototype of a massive idea. It has a lot of scope for scalability and upgrades. For future updates, we’ve planned to add a feature of the automatic alert system. In case of an accident, it will automatically send an alert to the nearest hospital and emergency contacts via the cloud. This will possible with the help of machine learning and on-board sensor data from the accelerometer and gyroscope. Based on the statistics, We predict to reduce road accidents by 11% within one year.</p>
<p>We thank you for investing your time to review our project. We highly value any feedback you give us. </p>
<p style="text-align:right;"><b>Regards</b></p>
<p style="text-align:right;"><b>Team Ninja Turtles.</b></p>
