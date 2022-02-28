import 'package:bloc/bloc.dart';
import 'package:first/layout/180_daraga/cubit/states.dart';
import 'package:first/models/numbers/numbers.dart';
import 'package:first/modules/new_stage/new_stage.dart';
import 'package:first/modules/summer_camp/summer_camp.dart';
import 'package:first/shared/components/end_point.dart';
import 'package:first/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaragaCubit extends Cubit<DaragaStates> {

  int currentIndex = 0;

  DaragaCubit() : super(DaragaInitialState());

  static DaragaCubit get(context) => BlocProvider.of(context);

  int selectedPage = 0;

  List<String> titleScreen = [
    'New Stage',
    'Summer Camp',
  ];

  List<Widget> screens = [
    NewStage(),
    SummerCamp()
  ];

  void changePage(index) {
    selectedPage = index;
    emit(DaragaChangePageState());
  }

  var from = TextEditingController();

  var to = TextEditingController();

  void init() {
    from.text = '1';
    to.text = '1';
  }

  NumbersModel? numbersModelNewStage;
  List<Number> numberNewStage = [];

  void getNumbersNewStage(String Url) {
    emit(DaragaLoadState());
    DioHelper.getData(url: Url,query: {}).then((value) {
      numbersModelNewStage = NumbersModel.fromJson(value.data['message']);
      numbersModelNewStage!.numbers.forEach((element) {
        numberNewStage.add(element);
      });

      emit(DaragaGetSuccessPageState());
    }).catchError((error) {
      print(error);
      emit(DaragaErrorState());
    });
  }

}
