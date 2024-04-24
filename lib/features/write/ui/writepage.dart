import 'package:flutter/material.dart';
import 'package:flutter_api/features/write/bloc/writebloc.dart';
import 'package:flutter_api/features/write/bloc/writeevent.dart';
import 'package:flutter_api/features/write/bloc/writestate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  @override
  void initState() {
    writebloc.add(WriteInitialEvent());
    super.initState();
  }
  final WriteBloc writebloc=WriteBloc();
  @override
  Widget build(BuildContext context) {
    final TextEditingController useridcontroller=TextEditingController();
    final TextEditingController titlecontroller=TextEditingController();
    final TextEditingController bodycontroller=TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Write Post',style:TextStyle(color:Colors.white)),
        automaticallyImplyLeading: true,
      ),
      body:BlocConsumer<WriteBloc,WriteState>(
        bloc:writebloc,
        listener:(context,state){},
        builder: (context,state) { 

            return Center(
            child: Container(
            margin:const EdgeInsets.only(top:10),
            padding:const EdgeInsets.only(left:10,right:10,bottom:10),
            width:double.maxFinite,
            height:400,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
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
                writebloc.add(AddDataClickedEvent(
                userid: useridcontroller.value.text,
                title: titlecontroller.value.text,
                body: bodycontroller.value.text,
                ));
    
   
          
               useridcontroller.clear();
               titlecontroller.clear();
               bodycontroller.clear();
               },
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child: const Text('Add Data', style: TextStyle(color: Colors.white)),
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