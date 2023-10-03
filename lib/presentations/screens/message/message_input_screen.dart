// ignore_for_file: deprecated_member_use

import 'package:dorah/data/repository/repository.dart';
import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:dorah/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageInputScreen extends StatefulWidget {
  const MessageInputScreen({super.key, required this.userId});
  static const routeName = '/message-input-screen';
  final String userId;

  @override
  State<MessageInputScreen> createState() => _MessageInputScreenState();
}

class _MessageInputScreenState extends State<MessageInputScreen> {
  final TextEditingController messageController = TextEditingController();
  final Map<String, String> userInfo = {};
  final Map<String, String> chatInfo = {};
  String chatId = 'CD001';

  void fetchData() async {
    final user = await Repository().getRequestByID(id: widget.userId);
    final chat = await Repository().getMessageById(id: chatId);

    setState(() {
      userInfo.addAll({'id': user.id, 'name': user.name, 'image': user.image});
      chatId = chat.id;
      chatInfo.addAll({
        'id': chat.id,
        'ask': chat.ask,
        'answer': chat.answer,
        'createDate': chat.createDate,
      });
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeader(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [],
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: _buildMessageInput(),
      ),
    );
  }

  TextField _buildMessageInput() {
    return TextField(
      controller: messageController,
      decoration: InputDecoration(
        isDense: true,
        hintText: 'Type something here',
        hintStyle: body2.copyWith(color: text60),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: text30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primary60),
        ),
      ),
    );
  }

  AppBar _buildHeader(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: text60)),
      centerTitle: false,
      title: customText(
        customTextValue: userInfo['name'] ?? '',
        customTextStyle: body1.copyWith(color: text60),
      ),
      actions: List.generate(
        2,
        (index) => IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            index == 0
                ? 'lib/assets/icons/phone_outlined.svg'
                : 'lib/assets/icons/video_outlined.svg',
            color: text60,
          ),
        ),
      ),
    );
  }
}
