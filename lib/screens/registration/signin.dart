import 'package:ev_ui_admin/constants/colors.dart';
import 'package:ev_ui_admin/services/admin_service.dart';
import 'package:ev_ui_admin/screens/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String loginerror = '';
  TextEditingController identitynoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AdminService adminService =
        Provider.of<AdminService>(context, listen: false);
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: tertiaryColor,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 45.w),
          height: kToolbarHeight,
          child: Image.asset('assets/ev4.png'),
        ),
        toolbarHeight: kToolbarHeight,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image(
              image: AssetImage('assets/ev3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 25.w,
                ),
                Text(
                  'THE COMFORT OF \nASIA\'S FIRST \nEDUCATION CITY.',
                  style: TextStyle(color: tertiaryColor, fontSize: 9.sp),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Card(
                  shadowColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(5.sp)),
                  elevation: 3,
                  child: Container(
                    height: 36.h,
                    width: 25.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'ADMIN SIGN IN',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 3.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          loginerror,
                          style: TextStyle(color: Colors.red),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: identitynoController,
                                validator: (val) => val!.isEmpty
                                    ? 'Identity No. can\'t be empty'
                                    : null,
                                style: TextStyle(
                                  color: Color(0xff107163),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Identity No.',
                                  hintStyle:
                                      TextStyle(color: Color(0xffA5A3A3)),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                      color: Color(0xff107163),
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 2,
                                        style: BorderStyle.solid,
                                        color: Color(0xff107163),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 2,
                                        style: BorderStyle.solid,
                                        color: Color(0xff107163),
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Color(0xff107163),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              TextFormField(
                                controller: passwordController,
                                validator: (val) => val!.isEmpty
                                    ? 'Password can\'t be empty'
                                    : null,
                                style: TextStyle(
                                  color: Color(0xff107163),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle:
                                      TextStyle(color: Color(0xffA5A3A3)),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                      color: Color(0xff107163),
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                      color: Color(0xff107163),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                      color: Color(0xff107163),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Color(0xff107163),
                                    ),
                                  ),
                                ),
                                obscureText: true,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(width: 2.w),
                              Container(
                                height: 4.h,
                                width: 5.w,
                                decoration: BoxDecoration(
                                    color: Color(0xff107163),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      String? res = adminService.login(
                                        idNo: identitynoController.text,
                                        pwd: passwordController.text,
                                      );

                                      if (mounted && res != null) {
                                        setState(() {
                                          loginerror = res;
                                        });
                                      }
                                    } else {
                                      print('error credentials');
                                    }
                                  },
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontSize: 2.2.sp, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
