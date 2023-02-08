import 'package:flutter/material.dart';

class SensorScreenMain extends StatelessWidget {
  final Size size;
  SensorScreenMain({required this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 231, 243, 249),
            Color.fromARGB(255, 253, 243, 253),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
                      Icon(Icons.arrow_back_ios, size: 22, color: Colors.grey),
                ),
                Container(
                  height: size.height * 0.045,
                  width: size.width * 0.095,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(3, 3),
                        )
                      ]),
                  child: InkWell(
                    onTap: () {
                      _showMessageBox(context);
                    },
                    child: Icon(Icons.notifications_none, color: Colors.grey),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Center(
              child: ElevatedButton(
                child: const Text('Open form'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const FeedbackDialog());
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Enter your feedback here',
            filled: true,
          ),
          maxLines: 5,
          maxLength: 4096,
          textInputAction: TextInputAction.done,
          validator: (String? text) {
            if (text == null || text.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('Send'),
          onPressed: () async {
            //connect to database
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

void _showMessageBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Instruction"),
        content: Text(
          "1. send feedback to dev.\n2. display the time and brightness value.\n3. display the time and sound volume.",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        actions: [
          FloatingActionButton.small(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      );
    },
  );
}
