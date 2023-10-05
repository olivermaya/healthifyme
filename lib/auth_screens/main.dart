// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:playholic/dashboard_screen.dart';
// import 'package:playholic/routed/transition_route_observer.dart';

// import 'login_screen.dart';

// void main() {
//   SystemChrome.setSystemUIOverlayStyle(
//     SystemUiOverlayStyle(
//       systemNavigationBarColor:
//           SystemUiOverlayStyle.dark.systemNavigationBarColor,
//     ),
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
    
//     ScreenUtilInit(
//         designSize: const Size(360, 700),
//         // designSize:  Size(1.sw, 1.sh),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (context, child) {
//           return
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'PLAYHOLIC',
//       theme: ThemeData(
//         primaryColor: Colors.black,
//         //  primarySwatch: Colors.lightBlue,
//         textSelectionTheme:
//             const TextSelectionThemeData(cursorColor: Color.fromARGB(255, 255, 0, 0)),
//         // fontFamily: 'SourceSansPro',
//         textTheme: TextTheme(
//           headline3: const TextStyle(
//             fontFamily: 'OpenSans',
//             fontSize: 45.0,
//             // fontWeight: FontWeight.w400,
//             color: Color.fromARGB(255, 255, 68, 0),
//           ),
//           button: const TextStyle(
//             // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
//             fontFamily: 'OpenSans',
//           ),
//           caption: TextStyle(
//             fontFamily: 'NotoSans',
//             fontSize: 12.0,
//             fontWeight: FontWeight.normal,
//             color: Color.fromARGB(255, 193, 205, 117),
//           ),
//           headline1: const TextStyle(fontFamily: 'Quicksand'),
//           headline2: const TextStyle(fontFamily: 'Quicksand'),
//           headline4: const TextStyle(fontFamily: 'Quicksand'),
//           headline5: const TextStyle(fontFamily: 'NotoSans'),
//           headline6: const TextStyle(fontFamily: 'NotoSans'),
//           subtitle1: const TextStyle(fontFamily: 'NotoSans'),
//           bodyText1: const TextStyle(fontFamily: 'NotoSans'),
//           bodyText2: const TextStyle(fontFamily: 'NotoSans'),
//           subtitle2: const TextStyle(fontFamily: 'NotoSans'),
//           overline: const TextStyle(fontFamily: 'NotoSans'),
//         ),
//         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
//             .copyWith(secondary: Color.fromARGB(255, 255, 0, 0)),
//       ),
//       navigatorObservers: [TransitionRouteObserver()],
//       initialRoute:  
//       // BottomNavigations.routeName,
//       SplashScreenView.routeName,
//       routes: {
//         BottomNavigations.routeName: (context) =>  BottomNavigations(),
//         SplashScreenView.routeName: (context) => const SplashScreenView(),
//         DashboardScreen.routeName: (context) => const DashboardScreen(),
//       },
//     );});
//   }
// }










// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get.dart';
// // import 'package:playholic/views/otp_view.dart/codeScreen.dart';
// // import 'package:playholic/views/splash_screen.dart';
// // import 'package:sizer/sizer.dart';

// // import 'views/signup.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return 
// // ScreenUtilInit(
// //         designSize: const Size(360, 700),
// //         // designSize:  Size(1.sw, 1.sh),
// //         minTextAdapt: true,
// //         splitScreenMode: true,
// //         builder: (context, child) {
// //           return
// //      GetMaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Playholic',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home:SplashScreenView()//const SplashScreenView()
// //       );});
// //   }
// // }
