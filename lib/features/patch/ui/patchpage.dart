import 'package:flutter/material.dart';
import 'package:flutter_api/features/patch/bloc/patchbloc.dart';
import 'package:flutter_api/features/patch/bloc/patchevents.dart';
import 'package:flutter_api/features/patch/bloc/patchstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatchPage extends StatelessWidget {
  const PatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController fieldController = TextEditingController();
    final TextEditingController idController = TextEditingController();

    return BlocProvider(
      create: (context) => PatchBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text('Patch Posts'),
        ),
        body: BlocBuilder<PatchBloc, PatchState>(
          builder: (context, state) {
              return _buildPatchForm(context, fieldController, idController);
            } 
        ),
      ),
    );
  }

  Widget _buildPatchForm(BuildContext context, TextEditingController fieldController, TextEditingController idController) {
    final List<String> list = ['customerid', 'title', 'body'];
    final PatchBloc patchbloc = context.read<PatchBloc>();

    return Column(
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
              patchbloc.add(DropdownItemSelectedEvent(selectedvalue: newValue!));
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
        const SizedBox(height: 20),
        TextField(
          controller: idController,
          decoration: const InputDecoration(
            hintText: 'Enter id value',
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
          onPressed: () {
            final selectedValue = context.read<PatchBloc>().chosenvalue ?? '';
            patchbloc.add(
              PatchButtonClickedEvent(
                chosenvalue: selectedValue,
                value: fieldController.text,
                id: idController.text,
              ),
            );
          },
          child: const Text('Patch Data', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
      }
  }
