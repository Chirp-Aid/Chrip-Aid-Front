import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final List<String> options;
  final ValueChanged<int> onChanged; // 선택된 인덱스를 전달할 콜백 함수

  const CustomToggleButton({
    Key? key,
    required this.options,
    required this.onChanged, // 필수로 콜백을 받아야 함
  }) : super(key: key);

  @override
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  int selectedIndex = 0; // 선택된 항목을 인덱스로 저장

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // 그림자 위치 조정
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.options.length, (index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index; // 선택된 버튼의 인덱스 갱신
              });
              widget.onChanged(index); // 선택된 인덱스를 부모 위젯으로 전달
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.green[300] : Colors.white,
                borderRadius: _getBorderRadius(index),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                widget.options[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.green[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  BorderRadius _getBorderRadius(int index) {
    if (index == 0) {
      // 첫 번째 버튼
      return BorderRadius.horizontal(left: Radius.circular(30));
    } else if (index == widget.options.length - 1) {
      // 마지막 버튼
      return BorderRadius.horizontal(right: Radius.circular(30));
    } else {
      return BorderRadius.zero;
    }
  }
}
