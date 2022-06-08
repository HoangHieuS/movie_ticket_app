import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_ticket_app_ui/constants/constants.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';
import 'package:movie_ticket_app_ui/widgets/custom_elevated_button.dart';
import 'package:movie_ticket_app_ui/widgets/movie_info.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: size.height / 8,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Center(
                        child: Text(
                          'Checkout\nMovie',
                          style: TxtStyle.heading1HalfBold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, top: 20),
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
                margin: const EdgeInsets.only(left: 24, top: 40, right: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 18),
                      width: size.width / 4,
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        AssetPath.posterRalphx2,
                        scale: 1.2,
                      ),
                    ),
                    const Expanded(
                      child: MovieInfo(
                        title: 'Ralph Breaks the Internet',
                        style: TxtStyle.headerTextWhite,
                      ),
                    ),
                  ],
                ),
              ),
              const _CustomDivider(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                child: Column(
                  children: const [
                    _TicketInfo(
                      title: 'ID Order',
                      info: '22081996',
                    ),
                    SizedBox(height: 18),
                    _TicketInfo(
                      title: 'Cinema',
                      info: 'FX Sudirman XXI',
                    ),
                    SizedBox(height: 18),
                    _TicketInfo(
                      title: 'Date & Time',
                      info: 'Sun May 22, 16:40',
                    ),
                    SizedBox(height: 18),
                    _TicketInfo(
                      title: 'Seat Number',
                      info: 'D7,D8,D9',
                    ),
                    SizedBox(height: 18),
                    _TicketInfo(
                      title: 'Price',
                      info: 'Rp 50.000 x 3',
                    ),
                    SizedBox(height: 18),
                    _TicketInfo(
                      title: 'Total',
                      info: 'Rp 150.000',
                      isTotal: true,
                    ),
                  ],
                ),
              ),
              const _CustomDivider(),
              Container(
                padding: const EdgeInsets.only(top: 6, left: 24, right: 24),
                child: const _TicketInfo(
                  info: 'IDR 200.000',
                  title: 'Your Wallet',
                  isYourWallet: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: CustomElevatedButton(
                  onTap: () {},
                  text: 'Checkout',
                  width: 260,
                  height: 60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TicketInfo extends StatelessWidget {
  final String title;
  final String info;
  final bool isTotal;
  final bool isYourWallet;

  const _TicketInfo({
    Key? key,
    required this.title,
    required this.info,
    this.isTotal = false,
    this.isYourWallet = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TxtStyle.headingWhite80,
        ),
        Text(
          info,
          style: isYourWallet == true
              ? TxtStyle.headerText.copyWith(color: DarkTheme.blueMain)
              : (isTotal == true)
                  ? TxtStyle.headerText
                  : TxtStyle.heading3,
        ),
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Divider(
        thickness: 1,
        color: DarkTheme.white,
        endIndent: 24,
        indent: 24,
      ),
    );
  }
}
