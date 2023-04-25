import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

import 'util/routes.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splashscreen,
            getPages: Routes.pages,
            builder: (context, child) {
              return Scaffold(
                body: GestureDetector(
                  onTap: () {
                    var currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    }
                  },
                  child: child,
                ),
              );
            },
          );
        }
    );
  }
}

//Platform  Firebase App Id
// web       1:366951219724:web:802402f6227cb9e8752429
// android   1:366951219724:android:075fc89e1c2a354a752429
// ios       1:366951219724:ios:c76a3884f9e96b90752429

