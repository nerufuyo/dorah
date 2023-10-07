// ignore_for_file: deprecated_member_use

import 'package:dorah/data/repository/repository.dart';
import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:dorah/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageInputScreen extends StatefulWidget {
  const MessageInputScreen({
    super.key,
    required this.userTargetId,
    required this.userId,
  });
  static const routeName = '/message-input-screen';
  final String userTargetId;
  final String userId;

  @override
  State<MessageInputScreen> createState() => _MessageInputScreenState();
}

class _MessageInputScreenState extends State<MessageInputScreen> {
  final TextEditingController messageController = TextEditingController();
  final Map<String, String> profileInfo = {};
  final Map<String, String> userInfo = {};
  final List<Map<String, String>> chats = [];
  String chatId = 'CD001';
  int initialIndex = 0;

  void fetchData() async {
    final profile = await Repository().getUserById(id: widget.userId);
    final user = await Repository().getRequestByID(id: widget.userTargetId);
    final chat = await Repository().getMessageById(id: chatId);

    setState(() {
      profileInfo.addAll({
        'id': profile.id,
        'name': profile.name,
        'image': profile.image,
      });
      userInfo.addAll({
        'id': user.id,
        'name': user.name,
        'image': user.image,
      });
      chatId = chat.id;
      chats.addAll({
        {
          'id': '${initialIndex++}',
          'ask': chat.ask,
        }
      });
      chats.addAll({
        {
          'id': '${initialIndex++}',
          'answer': chat.answer,
        }
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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.775,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              chats.length,
              (index) => Align(
                alignment: chats[index]['answer'] != null
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: chats[index]['answer'] != null
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: chats[index]['ask'] != null,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.network(
                            userInfo['image'] ?? '',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: chats[index]['answer'] != null
                                ? primary60
                                : primary10,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          margin: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: customText(
                            customTextValue: chats[index]['answer'] ??
                                chats[index]['ask'] ??
                                '',
                            customTextStyle: heading5.copyWith(
                                color: chats[index]['answer'] != null
                                    ? Colors.white
                                    : text60),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: chats[index]['answer'] != null,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            profileInfo['image'] ?? '',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet: _buildInputMessage(context),
    );
  }

  Container _buildInputMessage(BuildContext context) {
    return Container(
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
      child: TextField(
        controller: messageController,
        onSubmitted: (value) {
          setState(() {
            chats.addAll({
              {'id': '${initialIndex++}', 'answer': value}
            });
          });
          messageController.clear();
        },
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
