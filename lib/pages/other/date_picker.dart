import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  var nowDate = DateTime.now();
  var nowTime = TimeOfDay.now();

  var thirdNowDate = DateTime.now();
  var thirdNowTime = DateTime.now();
  var thirdNowDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日期页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('系统组件'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        formatDate(nowDate, [yyyy, '-', mm, '-', dd]),
                        textAlign: TextAlign.center,
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: _showDatePicker,
                ),
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        nowTime.format(context),
                        textAlign: TextAlign.center,
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: _showTimePicker,
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text('第三方组件'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        formatDate(thirdNowDate, [yyyy, '-', mm, '-', dd]),
                        textAlign: TextAlign.center,
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: _showThirdDatePicker,
                ),
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        formatDate(thirdNowTime, [HH, ':', nn, ':', ss]),
                        textAlign: TextAlign.center,
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: _showThirdTimePicker,
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        formatDate(thirdNowDateTime, [yyyy, '-', mm, '-', dd, '  ', HH, ':', nn]),
                        textAlign: TextAlign.center,
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: _showThirdDateTimePicker,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // void _showDatePicker() {
  //   showDatePicker(
  //           context: context,
  //           initialDate: nowDate,
  //           firstDate: DateTime(1980),
  //           lastDate: DateTime(2100))
  //       .then((value) => print(value));
  // }

  void _showDatePicker() async {
    var result = await showDatePicker(
      context: context,
      initialDate: nowDate,
      firstDate: DateTime(1980),
      lastDate: DateTime(2030),
      // locale: const Locale("zh"),
    );

    setState(() {
      if (result != null) {
        nowDate = result;
      }
    });
  }

  void _showTimePicker() async {
    var result = await showTimePicker(context: context, initialTime: nowTime);

    setState(() {
      if (result != null) {
        nowTime = result;
      }
    });
  }

  void _showThirdDatePicker() {
    DatePickerBdaya.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1980),
      maxTime: DateTime(2030),
      onChanged: (date) {
        // print('change $date');
      },
      onConfirm: (date) {
        setState(() {
          thirdNowDate = date;
        });
      },
      currentTime: thirdNowDate,
      locale: LocaleType.zh,
      theme: const DatePickerThemeBdaya(
        // headerColor: Colors.orange,
        // backgroundColor: Colors.blue,
        // itemStyle: TextStyle(
        //     color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        doneStyle: TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }

  void _showThirdTimePicker() {
    DatePickerBdaya.showTimePicker(
      context,
      showTitleActions: true,
      onChanged: (date) {
        // print('change $date in time zone ' +
        //     date.timeZoneOffset.inHours.toString());
      },
      onConfirm: (date) {
        setState(() {
          thirdNowTime = date;
        });
      },
      currentTime: thirdNowTime,
      locale: LocaleType.zh,
      theme: const DatePickerThemeBdaya(
        // headerColor: Colors.orange,
        // backgroundColor: Colors.blue,
        // itemStyle: TextStyle(
        //     color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        doneStyle: TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }

  void _showThirdDateTimePicker() {
    DatePickerBdaya.showDateTimePicker(
      context,
      showTitleActions: true,
      onChanged: (date) {
        // print('change $date in time zone ' +
        //     date.timeZoneOffset.inHours.toString());
      },
      onConfirm: (date) {
        setState(() {
          thirdNowDateTime = date;
        });
      },
      currentTime: thirdNowDateTime,
      locale: LocaleType.zh,
      theme: const DatePickerThemeBdaya(
        // headerColor: Colors.orange,
        // backgroundColor: Colors.blue,
        // itemStyle: TextStyle(
        //     color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        doneStyle: TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }
}
