import 'package:flutter/material.dart';

class CommonInputWidget extends StatelessWidget {
  const CommonInputWidget(
    this.title,
    this.placeholder, {
    Key? key,
    this.controller,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.enabled = true,
    this.border = true,
    this.titleWidth = 50,
  }) : super(key: key);
  final String title;
  final String placeholder;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final bool enabled;
  final bool border;
  final double titleWidth;

  @override
  Widget build(BuildContext context) {
    return _inputWidget();
  }

  /// 输入框
  Widget _inputWidget() {
    return Row(
      children: [
        SizedBox(
          width: titleWidth,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            validator: (value) {
              if (value?.isEmpty ?? false) {
                return '不能为空';
              }
              return null;
            },
            style: const TextStyle(
              fontSize: 12,
            ),
            decoration: InputDecoration(
              // isCollapsed: true, //重点，相当于高度包裹的意思，必须设置为true，不然有默认奇妙的最小高度
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 8), //内容内边距，影响高度
              border: border ? dividerBorder() : noBorder(),
              enabledBorder: border ? dividerBorder() : noBorder(),
              focusedBorder: border ? dividerBorder() : noBorder(),
              label: Text(
                placeholder,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 无边框
  InputBorder noBorder() {
    return const OutlineInputBorder(borderSide: BorderSide.none);
  }

  /// 与分隔线一样风格的边框
  InputBorder dividerBorder() {
    return UnderlineInputBorder(
      //选中时外边框颜色
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: Colors.black12,
      ),
    );
  }
}
