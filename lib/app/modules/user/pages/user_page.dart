import 'package:flutter/material.dart';
import 'package:flutter_web_template/app/core/widgets/dc_textfield_text.dart';
import 'package:flutter_web_template/app/core/widgets/template_page.dart';
import 'package:flutter_web_template/app/modules/user/controller/user_controller.dart';
import 'package:flutter_web_template/main.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('You clicked');
        },
        child: const Icon(Icons.mouse),
      ),
    );
  }

  _body(BuildContext context) {
    UserController controller = injector<UserController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _fields(controller)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buttons(context),
          ],
        ),
      ]),
    );
  }

  Widget _title() {
    return const Text('Users',
        style: TextStyle(
          fontSize: 22.2,
          fontWeight: FontWeight.bold,
        ));
  }

  List<Widget> _fields(UserController controller) {
    return [
      DcTextFieldText(
        labelText: "Nome",
        initialValue: controller.model.name,
        onChanged: (value) =>
            controller.model = controller.model.copyWith(name: value),
      ),
      DcTextFieldText(
        labelText: "Email",
        widthFactor: 0.7, //70% screen width
        initialValue: controller.model.email,
        onChanged: (value) =>
            controller.model = controller.model.copyWith(email: value),
      ),
      //botoes
    ];
  }

  Row _buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () => _cancel(context),
          icon: const Icon(Icons.cancel),
          label: const Text("Cancel"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton.icon(
          onPressed: () => _save(context),
          icon: const Icon(Icons.save),
          label: const Text("Save"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }

  _save(BuildContext context) {
    debugPrint('Call Controler > saveUser');
  }

  _cancel(BuildContext context) {
    debugPrint('Cancel Save Record');
    context.go("/home");
  }
}
