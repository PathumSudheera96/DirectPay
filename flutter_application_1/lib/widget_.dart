import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.white60, fontSize: 18.sp),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  );
}

AppBar myappBar() {
  return AppBar(
    toolbarHeight: 80.h,
    backgroundColor: Colors.blue.shade900,
    title: const Text(
      "Todo App",
      style: TextStyle(
        fontSize: 20,
      ),
    ),
  );
}

class TodoItem extends StatefulWidget {
  //final _formKey=GlobalKey<FormState>();
  final String _title;
  final String _description;
  final Function _function;
  const TodoItem(this._title, this._description, this._function);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: data.size.width - 20.w,
      //height: 200.h ,
      child: Container(
        margin: EdgeInsets.only(bottom:16.h),
        decoration: BoxDecoration(
            color: Colors.blue.shade900,
            border: Border.all(color: Colors.blue.shade900, width: 3.w),
            borderRadius: BorderRadius.circular(10.sp)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 18.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(left: 10.w),
                width: 270.w,
                child: Text(
                  widget._title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              IconButton(
                  onPressed: () {
                    print('clicked');
                    widget._function(widget._title, widget._description);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ))
            ]),
            SizedBox(
              height: 18.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              width: data.size.width - 40.w,
              child: Text(
                widget._description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    "date",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  child: Text(
                    "High",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
          ],
        ),
      ),
    );
  }
}

