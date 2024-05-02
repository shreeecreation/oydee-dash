import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oydeeedashboard/src/core/core.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              Text(
                "Home",
                style: AppTextStyles.text20PxBold,
              ),
              20.verticalSpace,
              Text(
                'Records of OYDEE',
                style: AppTextStyles.text16PxSemiBold,
              ),
              20.verticalSpace,
              Text("Posts"),
              // ListView.builder(
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) {
              //       return Card(
              //         child: ListTile(
              //           leading: Icon(
              //             getIconData(records.keys.elementAt(index)),
              //             color: getColor(records.keys.elementAt(index)),
              //           ),
              //           title: Text(records.keys.elementAt(index)),
              //           subtitle: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text("Total: ${records[records.keys.elementAt(index)]["total"]}"),
              //               Text("Today: ${records[records.keys.elementAt(index)]["today"]}"),
              //               Text("Yesterday: ${records[records.keys.elementAt(index)]["yesterday"]}"),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //     itemCount: records.length),

              Row(
                children: [
                  Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            size: 30,
                            getIconData(records.keys.elementAt(0)),
                            color: getColor(records.keys.elementAt(0)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              20.verticalSpace,
                              Text(
                                "Total: ${records[records.keys.elementAt(0)]["total"]}",
                                style: AppTextStyles.text12PxMedium,
                              ),
                              10.verticalSpace,
                              Text(
                                "Today: ${records[records.keys.elementAt(0)]["today"]}",
                                style: AppTextStyles.text12PxMedium,
                              ),
                              10.verticalSpace,
                              Text(
                                "Yesterday: ${records[records.keys.elementAt(0)]["yesterday"]}",
                                style: AppTextStyles.text12PxMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            size: 30,
                            getIconData(records.keys.elementAt(0)),
                            color: getColor(records.keys.elementAt(0)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              20.verticalSpace,
                              Text(
                                "Total: ${records[records.keys.elementAt(0)]["total"]}",
                                style: AppTextStyles.text12PxMedium,
                              ),
                              10.verticalSpace,
                              Text(
                                "Today: ${records[records.keys.elementAt(0)]["today"]}",
                                style: AppTextStyles.text12PxMedium,
                              ),
                              10.verticalSpace,
                              Text(
                                "Yesterday: ${records[records.keys.elementAt(0)]["yesterday"]}",
                                style: AppTextStyles.text12PxMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Map<String, dynamic> records = {
  "posts": {
    "total": "100",
    "today": "10",
    "yesterday": "20",
  },
  "rooms": {
    "total": "80",
    "today": "5",
    "yesterday": "10",
  },
  "users": {
    "total": "1000",
    "today": "5",
    "yesterday": "10",
  },
  "feedbacks": {
    "total": "100",
    "today": "5",
    "yesterday": "10",
  },
  "reports": {
    "total": "100",
    "today": "5",
    "yesterday": "10",
  },
  "jobs": {
    "total": "1100",
    "today": "100",
    "yesterday": "221",
  },
};

IconData getIconData(String key) {
  IconData iconData;
  switch (key) {
    case "posts":
      iconData = Icons.chrome_reader_mode;
      break;
    case "rooms":
      iconData = Icons.hotel;
      break;
    case "users":
      iconData = Icons.person;
      break;
    case "feedbacks":
      iconData = Icons.feedback;
      break;
    case "reports":
      iconData = Icons.description;
      break;
    case "jobs":
      iconData = Icons.work;
      break;
    default:
      iconData = Icons.error;
      break;
  }
  return iconData;
}

Color getColor(String key) {
  Color color;
  switch (key) {
    case "posts":
      color = Colors.blue;
      break;
    case "rooms":
      color = Colors.green;
      break;
    case "users":
      color = Colors.orange;
      break;
    case "feedbacks":
      color = Colors.purple;
      break;
    case "reports":
      color = Colors.red;
      break;
    case "jobs":
      color = Colors.deepPurple;
      break;
    default:
      color = Colors.grey;
      break;
  }
  return color;
}
