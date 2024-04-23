import 'package:flutter/material.dart';
import 'package:flutter_api/features/update/bloc/updatebloc.dart';
import 'package:flutter_api/features/update/bloc/updateevent.dart';
import 'package:flutter_api/features/update/bloc/updatestate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  void initState() {
    updatebloc.add(UpdateInitialEvent());
    super.initState();
  }
  final UpdateBloc updatebloc=UpdateBloc();
  @override
  Widget build(BuildContext context) {
    final TextEditingController useridcontroller=TextEditingController();
    final TextEditingController idcontroller=TextEditingController();
    final TextEditingController titlecontroller=TextEditingController();
    final TextEditingController bodycontroller=TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body:BlocConsumer<UpdateBloc,UpdateState>(
        bloc:updatebloc,
        listener:(context,state){},
        builder: (context,state) { 
            return Center(
            child: Container(
            padding:const EdgeInsets.only(left:10,right:10,bottom:10),
            width:double.maxFinite,
            height:400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: useridcontroller,
                  decoration: const InputDecoration(
                    hintText: 'Enter userid',
                    border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),),
                ),
                const SizedBox(height:10),
                TextField(
                  controller: idcontroller,
                  decoration: const InputDecoration(
                    hintText: 'Enter id',
                    border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),),
                ),
                const SizedBox(height:10),
                TextField(
                  controller: titlecontroller,
                  decoration: const InputDecoration(
                    hintText: 'Enter title',
                    border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),),
                ),
                const SizedBox(height:10),
                TextField(
                  maxLines: null,
                  controller: bodycontroller,
                  decoration: const InputDecoration(
                    hintText: 'Enter body',
                    border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),),
                ),
                const SizedBox(height:10),
                ElevatedButton(
                onPressed: () {
                updatebloc.add(UpdateButtonClickedEvent(
                id: idcontroller.value.text,
                userid: useridcontroller.value.text,
                title: titlecontroller.value.text,
                body: bodycontroller.value.text,
                ));
    
   
               idcontroller.clear();
               useridcontroller.clear();
               titlecontroller.clear();
               bodycontroller.clear();
               },
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child: const Text('Update Data', style: TextStyle(color: Colors.white)),
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