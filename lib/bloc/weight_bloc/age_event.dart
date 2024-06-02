import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'age_cubit.dart';

class WeightWidget extends StatefulWidget {
  @override
  State<WeightWidget> createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        width: size.width * 0.3,
        height: size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<WeightCubit, int>(
              builder: (context, age) {
                return Text(
                  "$age",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                );
              },
            ),
            const Text(
              'Weight',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            WeightButton(
              onPressed: () => context.read<WeightCubit>().increment(),
              icon: Icons.add,
              label: '    Add   ',
            ),
            WeightButton(
              onPressed: () => context.read<WeightCubit>().decrement(),
              icon: Icons.remove,
              label: 'Subtract',
            ),
          ],
        ),
      ),
    );
  }
}

class WeightButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  const WeightButton({
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
