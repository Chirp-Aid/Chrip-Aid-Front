import 'package:chrip_aid/orphanage/component/reason_box.dart';
import 'package:chrip_aid/orphanage/component/title_content_box.dart';
import 'package:flutter/material.dart';
import 'package:chrip_aid/common/styles/styles.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrphanageReservationBox extends StatelessWidget {
  final String name;
  final String age;
  final String sex;
  final String region;
  final String phoneNumber;
  final String writeDate;
  final String visitDate;
  final String reason;
  final String state;
  final String rejectReason;
  final void Function(String) onAnswer;

  const OrphanageReservationBox({
    super.key,
    required this.name,
    required this.age,
    required this.sex,
    required this.region,
    required this.phoneNumber,
    required this.writeDate,
    required this.visitDate,
    required this.reason,
    required this.state,
    required this.rejectReason,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final parsedWriteDate = DateTime.parse(writeDate);
    final formattedWriteDate =
        DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(parsedWriteDate);
    final parsedVisitDate = DateTime.parse(visitDate);
    final formattedVisitDate =
        DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(parsedVisitDate);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: CustomColor.backgroundMainColor,
            //borderRadius: BorderRadius.circular(kBorderRadiusSize),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          padding: const EdgeInsets.symmetric(
              // horizontal: kPaddingMiniMiniSize,
              vertical: kPaddingMiniMiniSize),
          margin: const EdgeInsets.only(
              top: 7, left: kPaddingSmallSize, right: kPaddingSmallSize),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: kPaddingMiniMiniSize),
                    Row(
                      children: [
                        const SizedBox(width: kPaddingMiniSize),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(kPaddingMiddleSize),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Text(name,
                                              style: kTextContentStyleMedium),
                                          Text("  $sex, $age세",
                                              style: kTextContentStyleSmall),
                                          Expanded(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: 110,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),

                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          kBorderRadiusMiniSize),
                                                  shape: BoxShape.rectangle,
                                                  //color: getStatusColor(state)
                                                ),
                                                child: Center(
                                                    child: state == 'APPROVED'
                                                        ? const Text("예약 승인",
                                                            style:
                                                                kTextContentStyleSmall)
                                                        : state == 'PENDING'
                                                            ? const Text(
                                                                "예약 대기",
                                                                style:
                                                                    kTextContentStyleSmall)
                                                            : state ==
                                                                    'REJECTED'
                                                                ? const Text(
                                                                    "예약 거절",
                                                                    style:
                                                                        kTextContentStyleSmall)
                                                                : const Text(
                                                                    "방문 완료",
                                                                    style:
                                                                        kTextContentStyleSmall)),
                                              )
                                            ],
                                          ))
                                        ],
                                      ),
                                      const SizedBox(height: kPaddingMiniSize),
                                      Row(
                                        children: [
                                          const Text('거주 지역         ',
                                              style:
                                                  kTextDetailSubContentStyleSmall),
                                          Text(region,
                                              style:
                                                  kTextDetailContentStyleSmall),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('연락처              ',
                                              style:
                                                  kTextDetailSubContentStyleSmall),
                                          Text(phoneNumber,
                                              style:
                                                  kTextDetailContentStyleSmall),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('방문 희망일      ',
                                              style:
                                                  kTextDetailSubContentStyleSmall),
                                          Text(formattedVisitDate,
                                              style:
                                                  kTextDetailPointStyleSmall),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('방문 신청일      ',
                                              style:
                                                  kTextDetailSubContentStyleSmall),
                                          Text(formattedWriteDate,
                                              style:
                                                  kTextDetailContentStyleSmall),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: const Divider(
                                          color: CustomColor.disabledColor,
                                          height: 2.0,
                                          thickness: 1.0,
                                        ),
                                      ),
                                      ReasonBox(reason: reason, title: "방문 사유"),
                                      state == "REJECTED"
                                          ? Column(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: const Divider(
                                                    color: CustomColor
                                                        .disabledColor,
                                                    height: 2.0,
                                                    thickness: 1.0,
                                                  ),
                                                ),
                                                ReasonBox(
                                                    reason: rejectReason,
                                                    title: "거절 사유"),
                                              ],
                                            )
                                          : Container(),
                                      state == "PENDING"
                                          ? Column(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          CustomButton(
                                                            label: "승인",
                                                            onPressed: () => onAnswer("APPROVED"),
                                                          ),
                                                          const SizedBox(
                                                              width: 20),
                                                          CustomButton(
                                                            label: "거절",
                                                            onPressed: () => onAnswer("REJECTED"),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Color getStatusColor(String state) {
  if (state == 'APPROVED') {
    return const Color(0xFFB9E68C);
  } else if (state == 'PENDING') {
    return const Color(0xFFB0D6D3);
  } else if (state == 'REJECTED') {
    return const Color(0xFFFFD2D2);
  } else {
    return CustomColor.disabledColor;
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: CustomColor.backgroundMainColor,
          side: BorderSide(color: CustomColor.disabledColor),
          elevation: 0,
        ),
        child: Text(
          label,
          style: kTextDetailContentStyleSmall,
        ),
      ),
    );
  }
}
