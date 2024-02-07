import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/model/BadgeModel.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';

class BadgeCalendarPageWidget extends StatefulWidget {
  final List<Badges> badges;

  BadgeCalendarPageWidget({required this.badges});

  @override
  _BadgeCalendarPageWidgetState createState() =>
      _BadgeCalendarPageWidgetState();
}

class _BadgeCalendarPageWidgetState extends State<BadgeCalendarPageWidget> {
  late DateTime _currentMonth;
  late List<DateTime> _daysInMonth;
  Map<DateTime, List<Badges>> _badgesMap = {};

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime.now();
    _daysInMonth = _getDaysInMonth(_currentMonth);
    _updateBadgesMap();
  }

  List<DateTime> _getDaysInMonth(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final startWeekday = firstDay.weekday;
    final daysBefore = startWeekday - 1;
    final firstVisibleDay = firstDay.subtract(Duration(days: daysBefore));
    final lastDay = DateTime(month.year, month.month + 1, 0);
    return List.generate(lastDay.day + daysBefore,
        (index) => firstVisibleDay.add(Duration(days: index)));
  }

  void _updateBadgesMap() {
    _badgesMap = {};
    for (var badge in widget.badges) {
      final dateKey = DateTime(
        DateTime.parse(badge.createdAt!).year,
        DateTime.parse(badge.createdAt!).month,
        DateTime.parse(badge.createdAt!).day,
      );
      if (_badgesMap[dateKey] == null) {
        _badgesMap[dateKey] = [];
      }
      _badgesMap[dateKey]!.add(badge);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            TopBar(content: "My Caregivers"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        _currentMonth = DateTime(
                            _currentMonth.year, _currentMonth.month - 1);
                        _daysInMonth = _getDaysInMonth(_currentMonth);
                        _updateBadgesMap();
                      });
                    },
                  ),
                  Text(
                    DateFormat('MMMM yyyy').format(_currentMonth),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      setState(() {
                        _currentMonth = DateTime(
                            _currentMonth.year, _currentMonth.month + 1);
                        _daysInMonth = _getDaysInMonth(_currentMonth);
                        _updateBadgesMap();
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  final weekday = DateFormat('EEE').format(
                    _daysInMonth[index].subtract(
                      Duration(days: _daysInMonth[index].weekday - 1),
                    ),
                  );
                  return Text(weekday,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white));
                }),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: _daysInMonth.length,
                itemBuilder: (context, index) {
                  final day = _daysInMonth[index];
                  final badges = _badgesMap[day] ?? [Badges()];
                  print(badges);

                  return Container(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        badges[0].type == null
                            ? Container(
                                width: 27,
                                height: 27,
                              )
                            : Image.asset(
                                width: 27,
                                height: 27,
                                "assets/images/${badgeTypes[badges[0].type]}"),
                        Text('${day.day}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
