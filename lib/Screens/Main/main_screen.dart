import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/Bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:healthapp/Bloc/main_bloc/main_bloc.dart';
import 'package:healthapp/Core/Constants/app_assets.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Screens/HealthAdvice/health_advice_screen.dart';
import 'package:healthapp/Screens/Home/home_screen.dart';
import 'package:healthapp/Screens/Main/Widgets/app_bar_widget.dart';
import 'package:healthapp/Screens/Main/Widgets/bottom_navigationbar_item.dart';
import 'package:healthapp/Screens/Profile/profile_screen.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final List<Widget> screens = [
    HomeScreen(),
    HealthAdviceScreen(),
    ProfileScreen()
  ];
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {}
    if (state == AppLifecycleState.resumed) {}
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        NavigatorState? currentNavigator =
            navigatorKeys[context.read<MainBloc>().currentIndex].currentState;
        if (currentNavigator!.canPop()) {
          currentNavigator.pop();
        }
      },
      child: BlocBuilder<MainBloc, BottomNavigationBarState>(
        builder: (context, state) {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(
                    AppBar().preferredSize.height), // here the desired height
                child: const AppBarWidgetScreens(),
              ),
              backgroundColor: AppColors.primaryColor,
              key: scaffoldKey,
              body: BlocListener<ConnectivityBloc, ConnectedState>(
                  listener: (context, state) {
                    if (state.message == "Connecting To Wifi") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 5),
                        content: Text(
                          state.message,
                        ),
                      ));
                    }
                    if (state.message == "Connecting To Mobile Data") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 5),
                        content: Text(
                          state.message,
                        ),
                      ));
                    }
                    if (state.message == "Lost Internet Connection") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 5),
                        content: Text(
                          state.message,
                        ),
                      ));
                    }
                  },
                  child:

                      screenSelected()[context.read<MainBloc>().currentIndex],

                      // screenSelected(context.read<MainBloc>().currentIndex)

                  //     IndexedStack(
                  //   index: context.read<MainBloc>().currentIndex,
                  //   children: navigatorKeys.map((key) {
                  //     int index = navigatorKeys.indexOf(key);
                  //     return Offstage(
                  //       offstage:
                  //           context.read<MainBloc>().currentIndex != index,
                  //       child: Navigator(
                  //         key: key,
                  //         onGenerateRoute: (routeSettings) {
                  //           return MaterialPageRoute(
                  //             builder: (context) => screens[index],
                  //           );
                  //         },
                  //       ),
                  //     );
                  //   }).toList(),
                  // )
                  
                  
                  ),
              bottomNavigationBar: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.w),
                  topLeft: Radius.circular(8.w),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryColor,
                  unselectedItemColor: AppColors.seconedaryColor,
                  backgroundColor: AppColors.seconedaryColor,
                  currentIndex: context.read<MainBloc>().currentIndex,
                  useLegacyColorScheme: false,
                  onTap: (index) {
                    if (index != context.read<MainBloc>().currentIndex) {
                      context
                          .read<MainBloc>()
                          .add(SelectBottomNavigationBarItem(index: index));
                    } else {
                      navigatorKeys[index]
                          .currentState!
                          .popUntil((route) => route.isFirst);
                    }
                  },
                  items: [
                    bottomNavigationBarItem(context,
                        currentIndex: context.read<MainBloc>().currentIndex,
                        index: 0,
                        icon: AppAssets.homeIcon,
                        navBarName: "Home"),
                    bottomNavigationBarItem(
                      context,
                      currentIndex: context.read<MainBloc>().currentIndex,
                      index: 1,
                      navBarName: "Health Advice",
                      icon: AppAssets.healthcareIcon,
                    ),
                    bottomNavigationBarItem(context,
                        currentIndex: context.read<MainBloc>().currentIndex,
                        index: 2,
                        icon: AppAssets.personIcon,
                        navBarName: "Profile"),
                  ],
                ),
              ));
        },
      ),
    );
  }

  List<Widget> screenSelected() {
    return navigatorKeys.map((key) {
      int index = navigatorKeys.indexOf(key);
      return Offstage(
        offstage: context.read<MainBloc>().currentIndex != index,
        child: Navigator(
          key: key,
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (context) => screens[index],
            );
          },
        ),
      );
    }).toList();
  }
}

class SecandScreen extends StatelessWidget {
  const SecandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("hi"),
      ),
    );
  }
}
