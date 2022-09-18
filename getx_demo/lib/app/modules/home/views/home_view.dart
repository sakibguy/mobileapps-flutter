import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/app/modules/home/controllers/home_controller.dart';
import 'package:getx_demo/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.LOGIN),
              icon: Icon(Icons.arrow_forward_ios_rounded))
        ],
      ),
      body: controller.obx((data) {
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (_, index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(data![index]['picture']['large']),
                    ),
                    title: Text(data![index]['name']['title'] +
                        " " +
                        data![index]['name']['first'] +
                        " " +
                        data![index]['name']['last']),
                    subtitle: Text(data![index]['email']),
                    trailing: Text("Age: ${data![index]['dob']['age']}"),
                  )
                ],
              ),
            );
          },
        );
      }, onError: (err) => Center(child: Text(err!))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}