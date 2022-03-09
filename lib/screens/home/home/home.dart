import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_team_app/screens/home/home/home_controller.dart';
import 'package:my_team_app/util/my_colors.dart';
import '../../../generated/l10n.dart';
import '../../../models/team_vo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double _height;
  late double _width;
  List<TeamVo> _listTeams = [];

  @override
  void initState() {
    super.initState();
    _getMyTeams();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _declaraciones();

    return Scaffold(
      appBar: _appbar(context),
      body: _body(),
      floatingActionButton: _button(),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      title: Text(S.of(context).teams),
      backgroundColor: MyColors.primaryColor,
      actions: [
        InkWell(
          onTap: () async {
            _getMyTeams();
            setState(() {});
          },
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Icon(Icons.restart_alt_outlined)),
        )
      ],
    );
  }

  Center _body() {
    return Center(
      child: _listTeams.length <= 0 ? _dataWithoutTeams() : _dataWithTeams(),
    );
  }

  Column _dataWithoutTeams() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _tittleNoTeams(),
        AnimationHome(),
      ],
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

  void _getMyTeams() async {
    _listTeams = await HomeController().getMyTeams();
  }

  Widget _dataWithTeams() {
    List<Widget> _listWidgetMyTeams = [];
    for (TeamVo i in _listTeams) {
      _listWidgetMyTeams.add(_individualTeam(i));
    }
    return Column(children: _listWidgetMyTeams);
  }

  Widget _individualTeam(TeamVo teamVO) {
    return InkWell(
      onTap: () {
        _goToContentTeam(teamVO, context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _encabezadoCard(teamVO.name),
                _bodyCard(),
              ],
            ),
          ),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Container _bodyCard() {
    return Container(
      padding: EdgeInsets.all(10),
      height: _height / 6,
    );
  }

  Container _encabezadoCard(String name) {
    return Container(
      color: /* teamVO.color ?? */ Colors.amber,
      padding: EdgeInsets.all(10),
      height: _height / 15,
      width: double.infinity,
      child: Text(
        name,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 16,
          color: MyColors.primaryText,
        ),
      ),
    );
  }

  void _goToContentTeam(TeamVo teamVO, BuildContext context) {
    HomeController().goToContentTeam(context, teamVO);
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
