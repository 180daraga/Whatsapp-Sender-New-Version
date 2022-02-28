import 'package:first/layout/180_daraga/cubit/cubit.dart';
import 'package:first/layout/180_daraga/cubit/states.dart';
import 'package:first/shared/styles/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DaragaCubit cubit = DaragaCubit.get(context);
    return BlocConsumer<DaragaCubit, DaragaStates>(
      listener: (context, state) {},
      builder: (context, state) => Drawer(
        child: Container(
          color: ThirdColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 100,
                child: DrawerHeader(
                  child: Text(
                    'WhatsApp sender Menu',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              for (int i = 0; i < cubit.screens.length; i++)
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  title: Container(
                    padding: EdgeInsets.all(10),
                    color: cubit.selectedPage == i ? PrimaryColor : null,
                    child: Text(
                      '${cubit.titleScreen[i]}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  onTap: () =>
                      {cubit.changePage(i), Navigator.of(context).pop()},
                ),
            ],
          ),
        ),
      ),
    );
  }
}
