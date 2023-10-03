import 'package:dorah/data/repository/repository.dart';
import 'package:dorah/data/utils/format.dart';
import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/presentations/widgets/shimmer.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:dorah/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});
  static const routeName = '/message-screen';

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final LocalStorage storage = LocalStorage('messages.json');
  final List<Map<String, String>> userLists = [];
  final List<Map<String, String>> messageLists = [];
  String chatId = '';
  bool isShimmer = true;

  void fecthData() async {
    final userResponse = await Repository().getRequests();
    final messageResponse = await Repository().getMessages();

    for (var item in userResponse) {
      userLists.add({
        'id': item.id,
        'name': item.name,
        'image': item.image,
        'chatId': item.chatId,
      });
    }

    for (var item in messageResponse) {
      messageLists.add({
        'id': chatId,
        'ask': item.ask,
        'answer': item.answer,
        'createDate': item.createDate,
      });
    }

    setState(() {
      storage.setItem('user', userLists);
      storage.setItem('message', messageLists);
    });
  }

  Future<void> loadLocalStorage() async {
    if (await storage.ready) {
      if (userLists.isEmpty && messageLists.isEmpty) {
        final user = storage.getItem('user');
        final message = storage.getItem('message');
        setState(() {
          userLists.addAll(
            user.map((e) => {
                  'id': e['id'],
                  'name': e['name'],
                  'image': e['image'],
                  'chatId': e['chatId'],
                }),
          );
          messageLists.addAll(
            message.map((e) => {
                  'id': e['id'],
                  'ask': e['ask'],
                  'answer': e['answer'],
                  'createDate': e['createDate'],
                }),
          );
        });
      }
    }
  }

  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 1), () => setState(() => isShimmer = false));
    loadLocalStorage();
    fecthData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSimpleAppBar(appBarTitle: 'Messages'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => customVerticalSpace(height: 8),
          itemCount: userLists.length,
          itemBuilder: (context, messageIndex) => isShimmer
              ? shimmerListView()
              : InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                        userLists[messageIndex]['image']!,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: customText(
                      customTextValue: userLists[messageIndex]['name']!,
                      customTextStyle: heading3,
                    ),
                    subtitle: customText(
                      customTextValue: messageLists[messageIndex]['ask']!,
                      customTextStyle: body2.copyWith(color: text40),
                      customMaxLines: 1,
                      customTextOverflow: TextOverflow.ellipsis,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customText(
                          customTextValue: formatTimeAgo(
                              messageLists[messageIndex]['createDate']!),
                          customTextStyle: body2.copyWith(color: text40),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: primary60,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: customText(
                            customTextValue: messageLists[messageIndex]['ask']!
                                .length
                                .toString(),
                            customTextStyle:
                                heading5.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
