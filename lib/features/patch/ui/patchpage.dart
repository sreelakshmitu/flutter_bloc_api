import 'package:flutter/material.dart';
import 'package:flutter_api/features/patch/bloc/patchbloc.dart';
import 'package:flutter_api/features/patch/bloc/patchevents.dart';
import 'package:flutter_api/features/patch/bloc/patchstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatchPage extends StatefulWidget {
  const PatchPage({Key? key}) : super(key: key);

  @override
  State<PatchPage> createState() => _PatchPageState();
}

class _PatchPageState extends State<PatchPage> {
  final TextEditingController fieldController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    patchbloc.add(PatchInitialEvent());
  }
  final PatchBloc patchbloc=PatchBloc();

  @override
  Widget build(BuildContext context) {
    const List<String> list = ['customerid', 'title', 'body'];

    return BlocConsumer<PatchBloc, PatchState>(
      bloc:patchbloc ,
      listener:(context,state){},
      builder: (context, state) {
        
        switch(state.runtimeType) {
          case PatchDataSelectedState:
          final patchstate=state as PatchDataSelectedState;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              centerTitle: true,
              title: const Text('Patch Posts'),
            ),
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: DropdownButton<String>(
                    items: list.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      patchbloc.add(
                            DropdownItemSelectedEvent(selectedvalue: newValue!)
                          );
                    },
                    hint: const Text('Select a field to patch'),
                    value: null,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: fieldController,
                  decoration: const InputDecoration(
                    hintText: 'Enter new value',
                  ),
                ),
                const SizedBox(height:20),
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                    hintText: 'Enter id value',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    patchbloc.add(
                          PatchButtonClickedEvent(
                            chosenvalue: patchstate.selectedvalue,
                            value: fieldController.text,
                            id: idController.text,
                          ),
                        );
                  },
                  child: const Text('Patch Data', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
          default:
          return const SizedBox();
        } 
        }
    );
      }
  }
