import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PusherChatAppController extends GetxController {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  RxBool isPusherConnected = false.obs;

  /// app_id = "1475592"
  /// key = "69ef518953032858d64d"
  /// secret = "b0f4e94b427b3b7529ce"
  /// cluster = "ap1"
  final String apiKey = '69ef518953032858d64d';
  final String cluster = 'ap1';

  /// Form Key
  final channelFormKey = GlobalKey<FormState>();
  final eventFormKey = GlobalKey<FormState>();

  /// Text Inputs
  final channelName = TextEditingController();
  final eventName = TextEditingController();
  final data = TextEditingController();

  /// Scroll Controller
  final ScrollController listViewController = ScrollController();

  Future<void> initPlatformState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    channelName.text = prefs.getString("channelName") ?? 'notifyChannel';
    eventName.text = prefs.getString("eventName") ?? 'client-event';
    data.text = prefs.getString("data") ?? 'test';
  }

  void onConnectPressed() async {
    if (!channelFormKey.currentState!.validate()) {
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("apiKey", apiKey);
    prefs.setString("cluster", cluster);
    prefs.setString("channelName", channelName.text);

    try {
      await pusher.init(
        apiKey: apiKey,
        cluster: cluster,
        useTLS: true,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        // authEndpoint: "https://icircles.app/broadcasting/auth",
        onAuthorizer: onAuthorizer,
      );

      await pusher.subscribe(channelName: channelName.text);
      await pusher.connect();
    } catch (e) {
      log("ERROR: $e");
    }
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
    isPusherConnected.value = true;
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    log("onEvent: $event");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.me;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onTriggerEventPressed() async {
    var eventFormValidated = eventFormKey.currentState!.validate();

    if (!eventFormValidated) {
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("eventName", eventName.text);
    prefs.setString("data", data.text);

    pusher.trigger(
      PusherEvent(
        channelName: channelName.text,
        eventName: eventName.text,
        data: data.text,
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    initPlatformState();
  }

  /// https://pub.dev/packages/crypto to get access to Hmac methods
  // getSignature(String value) {
  //   var key = utf8.encode('<your-pusher-app-secret>');
  //   var bytes = utf8.encode(value);
  //
  //   var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
  //   var digest = hmacSha256.convert(bytes);
  //   print("HMAC signature in string is: $digest");
  //   return digest;
  // }

  dynamic onAuthorizer(
      String channelName, String socketId, dynamic options) async {
    log("onAuthorizer $channelName : SocketId $socketId");
    const String token = "60056|XQmYLu4O6AHiqNiqxwDOMEIuMSHmLCZVMSlIs7Y2";
    var authUrl = "https://icircles.app/broadcasting/auth";

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);
    dynamic result;
    try {
      result = await http.post(
        Uri.parse(authUrl),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: 'socket_id=$socketId&channel_name=$channelName',
      );
    } catch (e) {
      log(e.toString());
    }

    var json = jsonDecode(result.body);
    return json;
  }
}
