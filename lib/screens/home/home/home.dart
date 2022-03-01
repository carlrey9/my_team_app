import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_team_app/screens/home/home/home_controller.dart';
import 'package:my_team_app/util/my_colors.dart';
import '../../../generated/l10n.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double _height;
  late double _width;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _declaraciones();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).teams),
        backgroundColor: MyColors.primaryColor,
      ),
      body: _body(),
      floatingActionButton: _button(),
    );
  }

  Center _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _tittleNoTeams(),
          AnimationHome(),
        ],
      ),
    );
  }

  Widget _tittleNoTeams() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        "No hay equipos",
        style: TextStyle(
          color: MyColors.secundaryText,
        ),
      ),
    );
  }

  Widget _button() {
    return FloatingActionButton.extended(
      isExtended: true,
      backgroundColor: MyColors.acentColor,
      elevation: 10,
      onPressed: () {
        HomeController().tapCreateTeam(context);
      },
      label: Text(
        S.of(context).createTeam,
        style: (TextStyle(fontSize: 16)),
        maxLines: 1,
      ),
    );
  }

  void _declaraciones() {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
  }
}

class AnimationHome extends StatefulWidget {
  const AnimationHome({Key? key}) : super(key: key);

  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/img/animation_home.json',
      controller: _controller,
      onLoaded: (composition) {
        // Configure the AnimationController with the duration of the
        // Lottie file and start the animation.
        _controller
          ..duration = composition.duration
          ..forward();
      },
    );
  }
}
