import 'package:get/get.dart';

import '../modules/add_note/bindings/add_note_binding.dart';
import '../modules/add_note/views/add_note_view.dart';
import '../modules/add_task/bindings/add_task_binding.dart';
import '../modules/add_task/views/add_task_view.dart';
import '../modules/detail_note/bindings/detail_note_binding.dart';
import '../modules/detail_note/views/detail_note_view.dart';
import '../modules/detail_task/bindings/detail_task_binding.dart';
import '../modules/detail_task/views/detail_task_view.dart';
import '../modules/edit_note/bindings/edit_note_binding.dart';
import '../modules/edit_note/views/edit_note_view.dart';
import '../modules/edit_task/bindings/edit_task_binding.dart';
import '../modules/edit_task/views/edit_task_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/note/bindings/note_binding.dart';
import '../modules/note/views/note_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/task/bindings/task_binding.dart';
import '../modules/task/views/task_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TASK,
      page: () => AddTaskView(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NOTE,
      page: () => AddNoteView(),
      binding: AddNoteBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TASK,
      page: () => DetailTaskView(),
      binding: DetailTaskBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_TASK,
      page: () => EditTaskView(),
      binding: EditTaskBinding(),
    ),
    GetPage(
      name: _Paths.NOTE,
      page: () => NoteView(),
      binding: NoteBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_NOTE,
      page: () => DetailNoteView(),
      binding: DetailNoteBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_NOTE,
      page: () => EditNoteView(),
      binding: EditNoteBinding(),
    ),
  ];
}
