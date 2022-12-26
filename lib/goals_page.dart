import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroofy/app_cubit.dart';
import 'package:masroofy/app_states.dart';
import 'package:masroofy/consts.dart';

class GoalsPage extends StatelessWidget {
  GoalsPage({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (contex) => AlertDialog(
                    content: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                              controller: titleController,
                              decoration: const InputDecoration(
                                labelText: 'New goal',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Title must not be empty';
                                }
                                return null;
                              }),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: amountController,
                            decoration: const InputDecoration(
                              labelText: 'Budget',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Budget must not be empty";
                              }

                              if (double.tryParse(value.toString()) == null) {
                                return "Budget must be numeric";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    title: const Text("Add new Goal"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            bottom: 16, end: 16),
                        child: FloatingActionButton.extended(
                          label: const Text("ADD"),
                          backgroundColor: primaryColor,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.insertGoal(
                                  title: titleController.text,
                                  amount: double.parse(
                                      amountController.text.toString()));
                              titleController.clear();
                              amountController.clear();
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              backgroundColor: primaryColor,
              child: const Icon(Icons.add),
            ),
            body: cubit.goals.isEmpty?
            Center(
              child: Text("Add goals to display them"),
            ): 
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        "Goals",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: AppCubit.get(context).goals.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cubit.goals[index]["title"],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  cubit.goals[index]["amount"].toString(),
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Checkbox(
                              value: AppCubit.get(context).goals[index]
                                          ["is_done"] ==
                                      0
                                  ? false
                                  : true,
                              onChanged: (value) {
                                AppCubit.get(context).updateGoal(
                                    id: cubit.goals[index]["id"],
                                    isDone: value! ? 1:0);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
