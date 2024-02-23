import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pusher_chat_app_controller.dart';

class PusherChatAppView extends GetView<PusherChatAppController> {
  const PusherChatAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.isPusherConnected.value
              ? 'Pusher Channels Example'
              : controller.channelName.text,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return ListView(
            controller: controller.listViewController,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              if (!controller.isPusherConnected.value)
                Form(
                    key: controller.channelFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.channelName,
                          validator: (String? value) {
                            return (value != null && value.isEmpty)
                                ? 'Please enter your channel name.'
                                : null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Channel',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: controller.onConnectPressed,
                          child: const Text('Connect'),
                        )
                      ],
                    ))
              else
                Form(
                  key: controller.eventFormKey,
                  child: Column(
                    children: [
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller
                              .pusher
                              .channels[controller.channelName.text]
                              ?.members
                              .length,
                          itemBuilder: (context, index) {
                            final member = controller.pusher
                                .channels[controller.channelName.text]?.members;
                            return ListTile(
                              title: Text(member.toString()),
                              subtitle: Text(member.toString()),
                            );
                          }),
                      TextFormField(
                        controller: controller.eventName,
                        validator: (String? value) {
                          return (value != null && value.isEmpty)
                              ? 'Please enter your event name.'
                              : null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Event',
                        ),
                      ),
                      TextFormField(
                        controller: controller.data,
                        decoration: const InputDecoration(
                          labelText: 'Data',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: controller.onTriggerEventPressed,
                        child: const Text('Trigger Event'),
                      ),
                    ],
                  ),
                ),
              const SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text("test"),
              ),
            ],
          );
        }),
      ),
    );
  }
}
