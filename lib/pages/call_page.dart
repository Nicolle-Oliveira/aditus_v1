import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID, required this.userID, required this.userName}) : super(key: key);
  final String callID;
    final String userID;
      final String userName;


  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
          379480690, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          '92b48f3cd9ae3fa5c5426b80c709d163469d6c6e6d1e8bbb5e65c4982e4aefb7', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userID,
      userName: userName,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (_) => Navigator.of(context).pop(),
    );
  }
}