import 'package:flutter/material.dart';

import 'common_input_widget.dart';

///@Description TODO
///@Author jd
class UserAddWidget extends StatelessWidget {
  UserAddWidget({Key? key}) : super(key: key);

  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 500,
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '人员信息添加',
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
            _buildTextField('姓      名', controller: _nameEditingController),
            _buildTextField('手  机  号', controller: _phoneEditingController),
            Container(
              margin: const EdgeInsets.only(left: 0, top: 20, right: 0),
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  _submitAction();
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                child: const Text(
                  '提交',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTextField(String title,
      {IconData? iconData, TextEditingController? controller}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: CommonInputWidget(
        title,
        '请填写完整的名称',
        controller: controller,
        titleWidth: 80,
      ),
    );
  }

  _submitAction() {
    if (_formKey.currentState!.validate()) {}
  }
}
