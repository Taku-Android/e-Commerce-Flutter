import 'package:e_commerce/base/base_state.dart';
import 'package:e_commerce/ui/home/home_viewModel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  HomeViewModel initViewModel() {
    // TODO: implement initViewModel
    return HomeViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
