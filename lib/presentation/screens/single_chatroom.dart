// import 'package:flutter/material.dart';
// import 'package:self_chat/data/models/chatroom.dart';
// import 'package:self_chat/data/models/message_model.dart';
// import 'package:self_chat/data/models/persona.dart';

// class SingleChatroomScreen extends StatefulWidget {
//   const SingleChatroomScreen(
//       {super.key,
//       required this.chatroom,
//       required this.activePersona,
//       required this.onPersonaChanged});

//   final Chatroom chatroom;
//   final Persona activePersona;
//   final Function(Persona) onPersonaChanged;

//   @override
//   State<SingleChatroomScreen> createState() => _SingleChatroomScreenState();
// }

// class _SingleChatroomScreenState extends State<SingleChatroomScreen> {
//   late String _otherPersonaName;

//   String _tempMessage = '';
//   final List<Message> _messages = <Message>[];
//   final TextEditingController _messagerController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Set the initial name of the other member
//     _setOtherPersonaName();
//   }

//   @override
//   void didUpdateWidget(SingleChatroomScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.activePersona.id != widget.activePersona.id) {
//       _setOtherPersonaName();
//     }
//   }

//   void setMessage(String message) {
//     setState(() {
//       _tempMessage = message;
//     });
//   }

//   void sendMessage() {
//     setState(() {
//       _messages.add(Message(
//         id: '1',
//         chatroomId: '1',
//         personaId: widget.activePersona.id,
//         timestamp: DateTime.now(),
//         content: _tempMessage,
//       ));
//       _tempMessage = '';
//       _messagerController.clear();
//     });
//   }

//   void switchPersona() {
//     // final newPersona = widget.chatroom.members
//     //     .firstWhere((member) => member.id != widget.activePersona.id);
//     final newPersona = Persona(id: '2', name: "Michael");
//     widget.onPersonaChanged(newPersona);
//   }

//   void _setOtherPersonaName() {
//     // final otherPersona = widget.chatroom.members
//     //     .firstWhere((member) => member.id != widget.activePersona.id);
//     _otherPersonaName = 'Other Persona';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(_otherPersonaName),
//         ),
//         body: SafeArea(
//             child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 24.0),
//           child: Column(
//             children: [
//               IconButton(
//                   onPressed: switchPersona,
//                   icon: const Icon(Icons.swap_horizontal_circle)),
//               Expanded(
//                 child: ListView(
//                   // crossAxisAlignment: CrossAxisAlignment.end,
//                   children: _messages.map((message) {
//                     var isMe = message.personaId == widget.activePersona.id;
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: Column(
//                           crossAxisAlignment: isMe
//                               ? CrossAxisAlignment.end
//                               : CrossAxisAlignment.start,
//                           children: [
//                             Text(isMe ? 'You' : message.personaId),
//                             Text(message.content),
//                             Text(message.timestamp.toString())
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   Expanded(
//                       child: TextField(
//                     controller: _messagerController,
//                     decoration:
//                         const InputDecoration(hintText: 'Enter message'),
//                     onChanged: (value) {
//                       setMessage(value);
//                     },
//                     onSubmitted: (value) {
//                       sendMessage();
//                     },
//                   )),
//                   IconButton(
//                     icon: const Icon(Icons.send),
//                     onPressed: () {
//                       sendMessage();
//                     },
//                   )
//                 ],
//               )
//             ],
//           ),
//         )));
//   }

//   @override
//   void dispose() {
//     _messagerController.dispose();
//     super.dispose();
//   }
// }
