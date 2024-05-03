import 'package:flutter/material.dart';
import 'package:oydeeedashboard/src/core/core.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dashboard",
                    style: AppTextStyles.text30PxSemiBold,
                  ),
                  Row(
                    children: [
                      IconButton.filled(onPressed: () {}, icon: const Icon(Icons.search)),
                      10.horizontalSpace,
                      IconButton.filled(onPressed: () {}, icon: const Icon(Icons.notifications)),
                      10.horizontalSpace,
                      IconButton.filled(onPressed: () {}, icon: const Icon(Icons.mood_rounded)),
                      10.horizontalSpace,
                      IconButton.filled(onPressed: () {}, icon: const Icon(Icons.logout_outlined)),
                      10.horizontalSpace,
                    ],
                  ),
                ],
              ),
              30.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "All Posts",
                  style: AppTextStyles.text25PxSemiBold,
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HomeCard(
                      index: index,
                    );
                  },
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Users",
                  style: AppTextStyles.text25PxSemiBold,
                ),
              ),
              const HomeCard(index: 3),
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Reports",
                  style: AppTextStyles.text25PxSemiBold,
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HomeCard(
                      index: index + 4,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 250,
      child: Card(
        elevation: 0.5,
        color: AppColors.brandBackground,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    size: 60,
                    getIconData(records.keys.elementAt(index)),
                    color: AppColors.primary,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${records.keys.elementAt(index).toUpperCase()} : ${records[records.keys.elementAt(1)]["total"]}",
                        style: AppTextStyles.text14PxSemiBold,
                      ),
                      15.verticalSpace,
                      Text(
                        "Today: ${records[records.keys.elementAt(1)]["today"]}",
                        style: AppTextStyles.text14PxSemiBold,
                      ),
                      15.verticalSpace,
                      Text(
                        "Yesterday: ${records[records.keys.elementAt(1)]["yesterday"]}",
                        style: AppTextStyles.text14PxSemiBold,
                      ),
                    ],
                  ),
                ],
              ),
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
  "jobs": {
    "total": "1100",
    "today": "100",
    "yesterday": "221",
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
};

IconData getIconData(String key) {
  IconData iconData;
  switch (key) {
    case "posts":
      iconData = Icons.post_add;
      break;
    case "rooms":
      iconData = Icons.home;
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
