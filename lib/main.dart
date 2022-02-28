import 'package:first/shared/bloc_observer.dart';
import 'package:first/shared/network/remote/dio_helper.dart';
import 'package:first/shared/styles/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/180_daraga/cubit/cubit.dart';
import 'layout/180_daraga/cubit/states.dart';
import 'layout/180_daraga/daraga.dart';



void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DaragaCubit()..init(),
      child: BlocConsumer<DaragaCubit, DaragaStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: MyTheme.defaultTheme,
            home: DaragaLayout()
        ),
      ),
    );
  }

}
