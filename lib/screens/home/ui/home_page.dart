import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:space_pod/models/chat_message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/login/bloc/auth_log_bloc.dart';
import '../../profile/view_profile/ui/profil_page.dart';
import '../bloc/chat_bloc.dart';

class MyHomePage extends StatefulWidget {
  final AuthLogBloc authLogBloc;

  const MyHomePage({super.key, required this.authLogBloc});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final ChatBloc chatBloc = ChatBloc();
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).messages;
              return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)

                    // image: DecorationImage(
                    //     image: AssetImage('assets/space_bg.png'
                    //     ),
                    //     fit: BoxFit.fill)
                    ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,

                        children: [
                          Expanded(
                            child: Text(
                              "Chat Pod AI",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance.signOut().then((value) {
                                return Navigator.popUntil(
                                    context, (route) => route.isFirst);
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 5,right: 15),
                              child: Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                child: messages[index].role == 'user'
                                    ? const Icon(Icons.person)
                                    : const Image(
                                        image: AssetImage('assets/google.png')),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: messages[index].role == 'user'
                                        ? Colors.grey.withOpacity(0.1)
                                        : Colors.grey.withOpacity(0.5)),
                                child: Text(
                                  // textAlign: messages[index].role == 'user'? TextAlign.right : TextAlign.left,
                                  messages[index].parts.first.text,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: messages.length,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      height: 120,
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: controller,
                            style: TextStyle(color: Colors.black),
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                                hintText: 'Write a Message..',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                        color:
                                            Theme.of(context).primaryColor))),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.text.isNotEmpty) {
                                String text = controller.text;
                                controller.clear();
                                chatBloc.add(ChatGenerateNewTexMessageEvent(
                                    inputMessage: text));
                              }
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Center(
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );

            default:
              return SizedBox(
                child: Text('LogOut Error'),
              );
          }
        },
      ),
    );
  }
}
