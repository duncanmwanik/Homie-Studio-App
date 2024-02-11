import 'package:flutter/material.dart';

import '../../../../../ble/ble_service.dart';
import '../../../../../data/shared_prefs.dart';
import '../../../../../models/segments.dart';
import '../../../../../theme/theme.dart';
import '../../../../../widgets/back_button.dart';
import 'segments_color_list_dialog.dart';

class SegmentScreen extends StatefulWidget {
  const SegmentScreen({required this.segments, super.key});

  final int segments;

  @override
  State<SegmentScreen> createState() => _SegmentScreenState();
}

class _SegmentScreenState extends State<SegmentScreen> {
  List<String> segList = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      segList = sharedPrefs.getStringList("seg${widget.segments}") ?? segmentsMap[widget.segments]!;
    });
    bleService.sendMessageToDevice("g${widget.segments}|${segList.reversed.toList().join('|')}|");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: backButton(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Text(
            "Tap on a segment to change its color",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white38,
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20, top: 20),
                width: 30,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.transparent, boxShadow: const [BoxShadow(offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.segments, (index) {
                    return Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await showModalBottomSheet(
                            context: context,
                            backgroundColor: const Color(0xff202020),
                            elevation: 10,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                            ),
                            builder: (BuildContext context) {
                              return segColorDialogList(context);
                            },
                          ).then((value) async {
                            if (value != null) {
                              print(value);
                              setState(() {
                                segList[index] = value;
                              });
                              sharedPrefs.setStringList("seg${widget.segments}", segList);
                              bleService.sendMessageToDevice("g${widget.segments}|${segList.reversed.toList().join('|')}|");
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(int.parse(segList[index].replaceAll("0x", "0xff"))),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                        child: Text(
                          "",
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
