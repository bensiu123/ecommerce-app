import 'package:flutter/material.dart';

import '../constants.dart';
import '../shared/default_button.dart';
import '../size_config.dart';
import 'data.dart';
import 'splash_context.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const Scaffold(body: Body());
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: splashData.length,
                onPageChanged: (value) =>
                    setState(() => currentPageIndex = value),
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text']!,
                  image: splashData[index]['image']!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => DotIndicator(
                          isCurrentPage: currentPageIndex == index,
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                    DefaultButton(
                      label: 'Continue',
                      onPressed: () {},
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    required this.isCurrentPage,
  }) : super(key: key);

  final bool isCurrentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: isCurrentPage ? 20 : 6,
      decoration: BoxDecoration(
        color: isCurrentPage ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
