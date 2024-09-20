import 'package:flutter/material.dart';
import '../components/Navbar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.cyan,
      ),
      body: const SafeArea(
        child: Column(
          children: [
            // Center(
            //     child: Text(
            //   'Welcome!!! \n'
            //   'Champion',
            //   style: Theme.of(context).textTheme.displayMedium,
            // )),
            Expanded(
              child: NavBar(),
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(),
                accountName: Text('Jeeva'),
                accountEmail: Text('jeeva@gmail.com'),
              ),
              Divider(
                height: 1.0,
              ),
              ListTile(
                title: Text('My Profile'),
                leading: Icon(Icons.person_pin_rounded),
              ),
              ListTile(
                title: Text('My Goals'),
                leading: Icon(Icons.follow_the_signs_sharp),
              ),
              ListTile(
                title: Text('My Events'),
                leading: Icon(Icons.edit_calendar_rounded),
              ),
              ListTile(
                title: Text('My Physique'),
                leading: Icon(Icons.sports_gymnastics_outlined),
              ),
              Divider(
                height: 1.0,
              ),
              ListTile(
                title: Text('Academy Change'),
                leading: Icon(Icons.change_circle_outlined),
              ),
              // Divider(
              //   height: 1.5,
              // ),
              ListTile(
                title: Text('Change Password'),
                leading: Icon(Icons.key),
              ),
              ListTile(
                title: Text('Delete Account'),
                leading: Icon(Icons.delete_forever),
              ),
              Divider(
                height: 1.0,
              ),
              ListTile(
                  title: Text('Settings'), leading: Icon(Icons.settings_sharp)),
              ListTile(
                title: Text('Help'),
                leading: Icon(Icons.help_outline),
              ),
              ListTile(
                title: Text('Mentoring Videos'),
                leading: Icon(Icons.video_collection_outlined),
              ),
              ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.logout_rounded),
              ),
            ],
          ),
          // backgroundColor: (Colors.cyan),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _userNameTextController = TextEditingController();

  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _userNameTextController
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }
    setState(() {
      _formProgress = progress;
    });
  }

  void _showHomeScreen() {
    Navigator.of(context).pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress),
          Text('Sign Up', style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: const InputDecoration(hintText: 'First Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: const InputDecoration(hintText: 'Last Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _userNameTextController,
              decoration: const InputDecoration(hintText: 'User Name'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.blue;
              }),
            ),
            onPressed: _formProgress == 1 ? _showHomeScreen : null,
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  final double value;
  const AnimatedProgressIndicator({
    super.key,
    required this.value,
  });

  @override
  State<AnimatedProgressIndicator> createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _curveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    final colorTween = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.red, end: Colors.orange), weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.yellow, end: Colors.green),
          weight: 1),
    ]);

    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => LinearProgressIndicator(
        value: _curveAnimation.value,
        backgroundColor: _colorAnimation.value?.withOpacity(0.4),
      ),
    );
  }
}
