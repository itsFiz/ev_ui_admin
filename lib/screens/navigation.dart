import 'dart:developer';
import 'dart:html';
import 'dart:io';
import 'package:ev_ui_admin/models/resident.dart';
import 'package:ev_ui_admin/screens/bookings.dart';
import 'package:ev_ui_admin/screens/dashboard.dart';
import 'package:ev_ui_admin/screens/pending.dart';
import 'package:ev_ui_admin/screens/settings.dart';
import 'package:ev_ui_admin/services/api_services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ev_ui_admin/services/admin_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:ev_ui_admin/constants/colors.dart';

class Navi extends StatefulWidget {
  const Navi({Key? key}) : super(key: key);

  @override
  State<Navi> createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int selectedPage = 0;
  String dropdownvalue = 'Pending';
  var items = [
    'Item 1',
    'Item 2',
  ];

  List<Resident> residents = [];
  getResidents() async {
    List<Resident> data = await ApiService.getResidents();
    setState(() {
      residents = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 5.h,
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.sp),
                            child: Image.asset('assets/ev4.png')),
                        VerticalDivider(),
                        Container(
                          padding: EdgeInsets.only(right: 4.h),
                          child: Text(
                            'ADMIN',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Divider(),
                  ),
                  navTile(
                    iconData: Icons.home,
                    label: 'Dashboard',
                    onTap: () {
                      setState(() {
                        selectedPage = 0;
                      });
                    },
                  ),
                  navTile(
                    iconData: Icons.done,
                    label: 'Pending Approval',
                    onTap: () {
                      setState(() {
                        selectedPage = 1;
                        getResidents();
                      });
                    },
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: tertiaryColor),
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                      onPressed: () {
                        AdminService adminService =
                            Provider.of(context, listen: false);
                        adminService.logout();
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 2.h, right: 2.w, left: 2.w),
                    child: const Divider(),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
              flex: 8,
              child: [
                dashboard(),
                Container(
                  color: Colors.blueGrey[200],
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                          'Note: Only approve user that have a valid Identity No. as residents of EV'),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 2.w),
                        color: Colors.white,
                        child: Table(
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              children: [
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2.h),
                                        child: Text('No.'))),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text('Identity No.')),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text('Name')),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text('Date Request')),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text('Approval Status')),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text(
                                      'Actions',
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                            ...residents.map((r) {
                              int i = residents.indexOf(r);
                              int index = i + 1;
                              return TableRow(
                                children: [
                                  TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Text(index.toString())),
                                  TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Text(r.idNo.toString())),
                                  TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Text(r.name.toString())),
                                  TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Text(r.dateTime.toString())),
                                  TableCell(
                                    child: Container(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Row(
                                            children: [
                                              DropdownButton(
                                                value: r.approval,
                                                items: const [
                                                  DropdownMenuItem(
                                                      child: Text(
                                                        'Pending',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange),
                                                      ),
                                                      value: 0),
                                                  DropdownMenuItem(
                                                      child: Text(
                                                        'Verified',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      value: 1),
                                                ],
                                                onChanged: (
                                                  int? value,
                                                ) async {
                                                  if (value != null) {
                                                    bool res = await ApiService
                                                        .verifyStatus(
                                                            userId:
                                                                r.id.toString(),
                                                            verified: value == 0
                                                                ? false
                                                                : true);

                                                    if (res == true) {
                                                      log('res');
                                                      setState(() {
                                                        residents[i].approval =
                                                            value;
                                                      });
                                                    }
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete_forever_rounded,
                                          size: 5.sp,
                                          color: Colors.redAccent,
                                        ),
                                        onPressed: () async {
                                          bool res =
                                              await ApiService.deleteResidents(
                                                  userId: r.id.toString());

                                          if (res == true) {
                                            setState(() {
                                              residents.removeAt(i);
                                            });
                                          }
                                        },
                                      )),
                                ],
                              );
                            }).toList()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ][selectedPage]),
        ],
      ),
    );
  }

  Widget dashboard() => Container(
        color: Colors.grey.shade200,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
        child: ListView(
          children: [
            Text(
              'Booking Status',
              style: TextStyle(
                fontSize: 4.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                statusBox(
                    label: 'AVAILABLE', count: 40, clr: Color(0xff4300FF)),
                SizedBox(width: 2.w),
                statusBox(label: 'BOOKED', count: 22, clr: Color(0xff056447)),
                SizedBox(width: 2.w),
                statusBox(
                    label: 'CANCELLED', count: 1, clr: Colors.red.shade900),
              ],
            ),
            SizedBox(height: 3.h),
            Text(
              'Announcement',
              style: TextStyle(
                fontSize: 4.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 1.h),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 6,
                crossAxisCount: 2,
                crossAxisSpacing: 2.w,
                mainAxisSpacing: 1.h,
              ),
              itemBuilder: (context, index) {
                if (index == 2) {
                  return Card(
                    elevation: 1.sp,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.sp)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2E9FF),
                        borderRadius: BorderRadius.circular(2.sp),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'New Announcement',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 4.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.purple,
                              size: 5.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return announcementBox(
                  header: 'COVID Case Alert',
                  subHeader: 'Badminton Court is closed temporarily',
                );
              },
            ),
          ],
        ),
      );

  announcementBox({
    required String header,
    required String subHeader,
  }) =>
      Card(
        elevation: 2.sp,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.sp)),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF2E9FF),
            borderRadius: BorderRadius.circular(2.sp),
          ),
          padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.5.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    header,
                    style: TextStyle(
                      fontSize: 4.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subHeader,
                    style: TextStyle(
                      fontSize: 3.sp,
                      fontWeight: FontWeight.w200,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 13.w,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.purple,
                  size: 6.sp,
                ),
              )
            ],
          ),
        ),
      );

  statusBox({required String label, required int count, required Color clr}) =>
      Card(
        elevation: 2.sp,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.sp)),
        child: Container(
          padding: EdgeInsets.all(1.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.sp),
              color: Colors.teal.shade50),
          width: 22.w,
          height: 15.h,
          child: Container(
            width: 20.w,
            height: 13.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.sp),
              color: Color(0xffB4D0DF),
            ),
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 3.sp,
                    color: clr,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: clr,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  ListTile navTile({
    required IconData iconData,
    required String label,
    required Function()? onTap,
  }) =>
      ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          color: primaryColor,
        ),
        title: Text(
          label,
          style: TextStyle(
            color: primaryColor,
          ),
        ),
      );
}
