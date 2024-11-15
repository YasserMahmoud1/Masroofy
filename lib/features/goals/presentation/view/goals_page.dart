import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroofy/consts.dart';
import 'package:masroofy/features/goals/presentation/manager/cubit/goal_cubit.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repos/goal_repo_impl.dart';

class GoalsPage extends StatelessWidget {
  GoalsPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoalCubit(getIt.get<GoalRepoImpl>())..getGoals(),
      child: SafeArea(
        child: BlocBuilder<GoalCubit, GoalState>(
          builder: (context, state) {
            return Scaffold(
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
                                GoalCubit.get(context).insertGoal(
                                    titleController.text,
                                    double.parse(
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
              body: const GoalsBody(),
            );
          },
        ),
      ),
    );
  }
}

class GoalsBody extends StatelessWidget {
  const GoalsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalCubit, GoalState>(
      builder: (context, state) {
        if (state is GoalSuccess) {
          if (state.doneGoals.isEmpty && state.unDoneGoals.isEmpty) {
            return const Center(child: Text("No goals added"));
          } else {
            return SingleChildScrollView(
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
                      itemCount: state.unDoneGoals.length,
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
                                  state.unDoneGoals[index].title,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "${state.unDoneGoals[index].amount}",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Checkbox(
                              value: state.unDoneGoals[index].isDone,
                              onChanged: (value) {
                                GoalCubit.get(context)
                                    .checkGoal(state.unDoneGoals[index]);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        "Done Goals",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.doneGoals.length,
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
                                  state.doneGoals[index].title,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "${state.doneGoals[index].amount}",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Checkbox(
                              value: state.doneGoals[index].isDone,
                              onChanged: (value) {
                                GoalCubit.get(context)
                                    .checkGoal(state.doneGoals[index]);
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
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
