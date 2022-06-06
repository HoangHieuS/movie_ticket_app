import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_ticket_app_ui/constants/constants.dart';
import 'package:movie_ticket_app_ui/models/models.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';
import 'package:movie_ticket_app_ui/widgets/select_cinema_widgets/select_cinema_widget.dart';

class SelecteCinema extends StatelessWidget {
  const SelecteCinema({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height * 1.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: size.height / 8,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 26),
                        child: Center(
                          child: Text(
                            'Ralph Breaks the\nInternet',
                            style: TxtStyle.heading1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 16),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 31),
                  height: size.height / 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: DarkTheme.white),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Select Your Country',
                            hintStyle: TxtStyle.hintText,
                            icon: const Padding(
                              padding: EdgeInsets.only(left: 14),
                              child: ImageIcon(
                                AssetImage(AssetPath.iconLocation),
                                color: DarkTheme.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 36,
                            color: DarkTheme.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const CustomSelectTitle(title: 'Choose Date'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: days
                          .map(
                            (e) => Builder(
                              builder: (context) => Container(
                                margin: const EdgeInsets.only(right: 16),
                                height: size.height / 8,
                                width: size.width / 5,
                                decoration: BoxDecoration(
                                  color:
                                      _colorChange(dateStates[days.indexOf(e)]),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      e,
                                      style: TxtStyle.heading3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        (21 + days.indexOf(e)).toString(),
                                        style: TxtStyle.heading3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: CustomSelectTitle(title: 'Central Park CGV'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 13, left: 24, bottom: 24),
                  height: size.height / 15,
                  child: ListView.builder(
                    itemCount: times.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        _customSelectTime(size, index, timeStates_1),
                  ),
                ),
                const CustomSelectTitle(title: 'FX Sudirman XXI'),
                Container(
                  margin: const EdgeInsets.only(top: 13, left: 24, bottom: 24),
                  height: size.height / 15,
                  child: ListView.builder(
                    itemCount: times.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        _customSelectTime(size, index, timeStates_2),
                  ),
                ),
                const CustomSelectTitle(title: 'Kelapa Gading IMAX'),
                Container(
                  margin: const EdgeInsets.only(top: 13, left: 24),
                  height: size.height / 15,
                  child: ListView.builder(
                    itemCount: times.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        _customSelectTime(size, index, timeStates_3),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Ink(
                    width: size.height / 10,
                    height: size.height / 10,
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(), color: DarkTheme.darkBackground),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _customSelectTime(Size size, int index, List<TicketStates> states) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: size.width / 4,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _colorChange(
          states[index],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        times[index],
        style: TxtStyle.heading3,
      ),
    );
  }
}

Color _colorChange(TicketStates state) {
  switch (state) {
    case TicketStates.idle:
      return DarkTheme.darkBackground;
    case TicketStates.busy:
      return DarkTheme.greyBackground;
    case TicketStates.active:
      return DarkTheme.blueMain;
  }
}
