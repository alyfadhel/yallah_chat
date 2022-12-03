import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallah_chat/core/resources/theme_manager.dart';
import 'package:yallah_chat/core/utils/constance/constance.dart';
import 'package:yallah_chat/core/utils/network/local.dart';
import 'package:yallah_chat/core/utils/observer/observer.dart';
import 'package:yallah_chat/modules/home/cubit/cubit.dart';
import 'package:yallah_chat/modules/home/screens/home_layout.dart';
import 'package:yallah_chat/modules/login/screens/login.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  uId = CacheHelper.getData(key: 'uId');
  Widget widget ;

  if(uId != null){
    widget = const HomeLayout();
  }else{
    widget = const LoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key,required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getUserData()..getPosts(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationLightTheme(),
        home: startWidget,

      ),
    );
  }
}


