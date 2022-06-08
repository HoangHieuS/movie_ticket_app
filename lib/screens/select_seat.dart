import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_ticket_app_ui/constants/constants.dart';
import 'package:movie_ticket_app_ui/models/models.dart';
import 'package:movie_ticket_app_ui/screens/screens.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';
import 'package:movie_ticket_app_ui/widgets/widgets.dart';

class SelectSeat extends StatefulWidget {
  const SelectSeat({Key? key}) : super(key: key);

  @override
  State<SelectSeat> createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, top: 16),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, top: 2),
                child: const Text(
                  'Ralph Breaks the Internet',
                  style: TxtStyle.heading1HalfBold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, top: 8),
                child: const Text(
                  'FX Sudirman XXI',
                  style: TxtStyle.heading3Light,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 32, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _SeatStatusBar(
                      status: 'Avaible',
                      color: DarkTheme.darkBackground,
                    ),
                    _SeatStatusBar(
                      status: 'Booked',
                      color: DarkTheme.greyBackground,
                    ),
                    _SeatStatusBar(
                      status: 'Your Seat',
                      color: DarkTheme.blueMain,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _SeatColumn(
                        seatNumber: seatNumberC1,
                        seatNumberSub: seatNumberC1Sub,
                        isColumn1: true,
                      ),
                      const SizedBox(width: 40),
                      _SeatColumn(
                        seatNumber: seatNumberC2,
                        seatNumberSub: seatNumberC2Sub,
                      ),
                      const SizedBox(width: 40),
                      _SeatColumn(
                        seatNumber: seatNumberC3,
                        seatNumberSub: seatNumberC3Sub,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Screen',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    height: 1.2,
                    color: Color(0xFFB5B5B5),
                  ),
                ),
              ),
              Image.asset(AssetPath.screenx2),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Total Price',
                          style: TxtStyle.heading4Light,
                        ),
                        Text(
                          '150.000 VND',
                          style: TxtStyle.heading3Bold,
                        ),
                      ],
                    ),
                    CustomElevatedButton(
                      height: size.height / 16,
                      width: size.width / 3,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckoutScreen(),
                          ),
                        );
                      },
                      text: 'Book Ticket',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SeatColumn extends StatelessWidget {
  final bool isColumn1;
  final List<String> seatNumber;
  final List<String> seatNumberSub;

  const _SeatColumn({
    Key? key,
    this.isColumn1 = false,
    required this.seatNumber,
    required this.seatNumberSub,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isColumn1 == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              children: seatRow
                  .map(
                    (row) => Builder(
                      builder: (context) {
                        return Row(
                          children: seatNumber.map(
                            (number) {
                              return ToggleButton(
                                child: Text(
                                  row + number,
                                  style: TxtStyle.heading3,
                                ),
                              );
                            },
                          ).toList(),
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: seatRow2
                  .map(
                    (row) => Builder(
                      builder: (context) {
                        return Row(
                          children: seatNumberSub.map(
                            (number) {
                              return ToggleButton(
                                child: Text(
                                  row + number,
                                  style: TxtStyle.heading3,
                                ),
                              );
                            },
                          ).toList(),
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}

class _SeatStatusBar extends StatelessWidget {
  final String status;
  final Color color;

  const _SeatStatusBar({
    Key? key,
    required this.status,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            status,
            style: TxtStyle.heading4,
          ),
        ),
      ],
    );
  }
}

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  TicketStates _ticketStates = TicketStates.idle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 52,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _ticketStates = _ticketStates == TicketStates.idle
                ? TicketStates.active
                : TicketStates.idle;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 8, left: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _ticketStates == TicketStates.idle
                  ? DarkTheme.darkBackground
                  : DarkTheme.blueMain),
          child: widget.child,
        ),
      ),
    );
  }
}
