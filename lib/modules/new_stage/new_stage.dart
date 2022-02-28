import 'package:first/layout/180_daraga/cubit/cubit.dart';
import 'package:first/layout/180_daraga/cubit/states.dart';
import 'package:first/shared/components/components.dart';
import 'package:first/shared/components/constrans.dart';
import 'package:first/shared/styles/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewStage extends StatefulWidget {
  @override
  _NewStageState createState() => _NewStageState();
}

class _NewStageState extends State<NewStage> {
  var message = TextEditingController();
  var api = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DaragaCubit cubit = DaragaCubit.get(context);

    return BlocConsumer<DaragaCubit, DaragaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return StandardContainer([
            Row(
              children: [
                Expanded(
                  child: defaultTextField(
                      textInputType: TextInputType.text,
                      validation: (value) {},
                      prefixIcon: null,
                      label: 'Api',
                      controller: api),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: defaultButton(
                      text: 'Get Data',
                      function: () {
                        cubit.getNumbersNewStage(api.text);
                      },
                      color: PrimaryColor,
                      textColor: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: defaultTextField(
                      textInputType: TextInputType.numberWithOptions(),
                      validation: (value) {},
                      prefixIcon: null,
                      label: 'From',
                      controller: cubit.from),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: defaultTextField(
                      textInputType: TextInputType.numberWithOptions(),
                      validation: (value) {},
                      prefixIcon: null,
                      label: 'To',
                      controller: cubit.to),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            defaultTextField(
                maxLines: 8,
                textInputType: TextInputType.multiline,
                validation: (value) {},
                prefixIcon: null,
                label: 'Message',
                controller: message),
            SizedBox(
              height: 30,
            ),
            defaultButton(
                text: 'Apply',
                function: () {
                  setState(() {});
                },
                color: PrimaryColor,
                textColor: Colors.white),
            SizedBox(
              height: 30,
            ),
            for (int i = (int.parse(cubit.from.text) - 1);
                i < cubit.numberNewStage.length && i < int.parse(cubit.to.text);
                i++)
              PhoneInfo(
                iState: cubit.numberNewStage[i].send!,
                iPhone: '${cubit.numberNewStage[i].phone}',
                iName: '${cubit.numberNewStage[i].name}',
                iFunction: () {
                  openWhatsapp('${message.text}',
                      cubit.numberNewStage[i].phone!, context);
                  cubit.numberNewStage[i].send = false;
                  setState(() {});
                },
              ),
          ]);
        });
  }
}
