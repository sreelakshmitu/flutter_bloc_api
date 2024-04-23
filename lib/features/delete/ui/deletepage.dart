import 'package:flutter/material.dart';
import 'package:flutter_api/features/delete/bloc/deletebloc.dart';
import 'package:flutter_api/features/delete/bloc/deleteevent.dart';
import 'package:flutter_api/features/delete/bloc/deletestate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final TextEditingController deletecontroller=TextEditingController();
  @override
  void initState() {
    deletebloc.add(DeleteInitialEvent());
    super.initState();
  }
  final DeleteBloc deletebloc=DeleteBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title:const Text('Delete Posts',style:TextStyle(color: Colors.white))
      ),
      body:BlocConsumer<DeleteBloc,DeleteState>(
        bloc:deletebloc,
        listener: (context, state) => {},
        builder: (context, state) {
        return Center(
          child:Container(
            margin: const EdgeInsets.only(top:50,left:20,right:20),
            child: Column(
               children: [
               TextField(
                controller:deletecontroller,
                decoration: const  InputDecoration(
                  hintText: 'Enter ID to delete',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.black),
                  )
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:(){
                  deletebloc.add(DeleteButtonClickedEvent(id: deletecontroller.value.text));
                  deletecontroller.clear();},
                style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)), 
                child: const Text('Delete Post',style:TextStyle(color:Colors.white)),
              ),
               ],
            ),
          ),
        
        );
        }
      )

    );
  }
}