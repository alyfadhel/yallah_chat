import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallah_chat/core/resources/theme_manager.dart';
import 'package:yallah_chat/core/utils/constance/constance.dart';
import 'package:yallah_chat/core/utils/network/local.dart';
import 'package:yallah_chat/core/utils/observer/observer.dart';
import 'package:yallah_chat/core/utils/widgets/toast_state.dart';
import 'package:yallah_chat/modules/home/cubit/cubit.dart';
import 'package:yallah_chat/modules/home/screens/home_layout.dart';
import 'package:yallah_chat/modules/login/screens/login.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  showToast(text: 'On Message background App', state: ToastState.success);
}
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var token = await FirebaseMessaging.instance.getToken();
  print('Token $token');
  // when application is opened send message
  FirebaseMessaging.onMessage.listen((event) {
    print(event.data.toString());
    showToast(text: 'On Message', state: ToastState.success);
  });
  // when application is opened in foreground send message
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data.toString());
    showToast(text: 'On Message opened App', state: ToastState.success);
  });
  // when application is closed in background send message
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

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
        BlocProvider(create: (context) => HomeCubit()
          ..getUserData()
          ..getPosts(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationLightTheme(),
        home: startWidget,

      ),
    );
  }
}


