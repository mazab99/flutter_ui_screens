
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widget/general/animated_3d_car.dart';
import '../widget/home/bottom_home_layout.dart';
import '../widget/unlocking/bottom_unlock_layout.dart';
import '../widget/unlocking/top_unlock_layout.dart';

class CarScreen extends StatefulWidget {
  const CarScreen({super.key});

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  var _isOpen = false;
  int _flex1 = 1;
  int _flex2 = 3;
  int _flex3 = 1;
  var _carAnimation = CarAnimationType.zoomedIn;
  var _homeUiState = HomeUiState.loading;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.transparent),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;
              var height1 = (_flex1 * height) / (_flex1 + _flex2 + _flex3);
              var height2 = (_flex2 * height) / (_flex1 + _flex2 + _flex3);
              var height3 = (_flex3 * height) / (_flex1 + _flex2 + _flex3);
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    AnimatedContainer(
                      height: height1,
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 1),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        switchInCurve: Curves.easeInOut,
                        switchOutCurve: Curves.easeInOut,
                        child: Builder(
                          key: ValueKey('top_layout_${_homeUiState.index}'),
                          builder: (context) {
                            if (_homeUiState == HomeUiState.unlock) {
                              return TopUnlockLayout(
                                isOpen: _isOpen,
                                onBackTapped: _onBackTapped,
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      height: height2,
                      width: width,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Animated3DCar(
                          key: const ValueKey('animated_3d_car'),
                          animationType: _carAnimation,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      height: height3,
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 1),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 750),
                        switchInCurve: Curves.easeInOut,
                        switchOutCurve: Curves.easeInOut,
                        child: Builder(
                          key: ValueKey('bottom_layout_${_homeUiState.index}'),
                          builder: (context) {
                            if (_homeUiState == HomeUiState.dashboard) {
                              return BottomHomeLayout(
                                isOpen: _isOpen,
                                onDoorsTapped: _onDoorsTapped,
                              );
                            }
                            if (_homeUiState == HomeUiState.unlock) {
                              return BottomUnLockLayout(
                                isOpen: _isOpen,
                                onUnLockTapped: _onUnlockTapped,
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _getData() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    await _goToHome();
  }

  Future<void> _onDoorsTapped() async {
    setState(() => _homeUiState = HomeUiState.animating);
    await Future.delayed(const Duration(milliseconds: 200));
    if (!mounted) return;
    setState(() {
      _flex1 = 1;
      _flex2 = 1;
      _flex3 = 1;
      _carAnimation = CarAnimationType.topView;
    });
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() => _homeUiState = HomeUiState.unlock);
  }

  Future<void> _onBackTapped() async => _goToHome();

  Future<void> _goToHome() async {
    setState(() {
      _flex1 = 0;
      _flex2 = 1;
      _flex3 = 2;
      _homeUiState = HomeUiState.animating;
      _carAnimation = CarAnimationType.sideView;
    });
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() => _homeUiState = HomeUiState.dashboard);
  }

  void _onUnlockTapped() {
    setState(() {
      _carAnimation = CarAnimationType.topViewOpen;
      _isOpen = !_isOpen;
    });
  }
}

enum HomeUiState {
  loading,
  dashboard,
  animating,
  unlock,
}
