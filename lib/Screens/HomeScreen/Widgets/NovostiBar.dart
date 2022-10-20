import 'dart:async';
import '../../../Classes/Novosti.dart';
import 'package:flutter/material.dart';
import 'package:termo_vukovar/ListePodataka/ListaNovosti.dart';

class NovostiBar extends StatefulWidget {
  _NovostiBar createState() => _NovostiBar();
}

class _NovostiBar extends State<NovostiBar> {
  PageController pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int _maxPage = 2;

  List<Novosti> _urls = urlSlika;

  onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    changePageOnTimer();
    super.initState();
  }

  void changePageOnTimer() {
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _maxPage) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 250),
          curve: Curves.bounceIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            height: screenSize.height * 0.3,
            width: screenSize.width * 0.5,
            decoration: BoxDecoration(),
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: onPageChanged,
              itemCount: _urls.length,
              itemBuilder: (context, index) {
                return _urls[index];
              },
            ),
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          bottom: 10,
          top: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  if (_currentPage == 0) {
                    _currentPage = _maxPage;
                    pageController.jumpToPage(_maxPage);
                  } else {
                    pageController.previousPage(
                        duration: Duration(microseconds: 250),
                        curve: Curves.bounceOut);
                  }
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: screenSize.height * 0.3,
                  width: screenSize.width * 0.05,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black.withAlpha(150),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (_currentPage == _maxPage) {
                    _currentPage = 0;
                    pageController.jumpToPage(0);
                  } else {
                    pageController.nextPage(
                      duration: Duration(microseconds: 250),
                      curve: Curves.bounceIn,
                    );
                  }
                },
                child: Container(
                  height: screenSize.height * 0.3,
                  width: screenSize.width * 0.05,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black.withAlpha(150),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: -5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_urls.length, (int index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      height: 20,
                      width: (index == _currentPage) ? 30 : 15,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: (index == _currentPage)
                            ? Colors.blue.withOpacity(0.7)
                            : Colors.blue.withOpacity(0.1),
                      ),
                    );
                  }),
                ),
              ],
            ))
      ],
    );
  }
}
