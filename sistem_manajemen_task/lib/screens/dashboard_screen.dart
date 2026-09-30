import 'package:flutter/material.dart';
import '../models/task_item.dart';
import '../widgets/priority_badge.dart';
import 'task_detail_screen.dart';

class DashboardScreen extends StatefulWidget {
  final List<TaskItem> tasks;
  final Function(TaskItem) onTaskToggle;
  final Function(TaskItem) onTaskAdded;

  const DashboardScreen({
    super.key,
    required this.tasks,
    required this.onTaskToggle,
    required this.onTaskAdded,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _titleController = TextEditingController();
  String _selectedPriority = 'Sedang';

  void _submitTask() {
    if (_titleController.text.trim().isEmpty) return;
    final newTask = TaskItem(
      id: DateTime.now().toString(),
      title: _titleController.text,
      priority: _selectedPriority,
      category: 'Umum',
    );
    widget.onTaskAdded(newTask);
    _titleController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Form Input Task
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '+ Tambah Tugas Baru',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: 'Judul tugas...',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedPriority,
                        items: ['Tinggi', 'Sedang', 'Rendah'].map((p) {
                          return DropdownMenuItem(
                            value: p,
                            child: Text('Prioritas $p'),
                          );
                        }).toList(),
                        onChanged: (val) => setState(() => _selectedPriority = val!),
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      ),
                      onPressed: _submitTask,
                      child: const Text('Simpan'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // List Task
        ...widget.tasks.map((task) {
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Checkbox(
                value: task.isCompleted,
                onChanged: (_) => widget.onTaskToggle(task),
              ),
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    PriorityBadge(priority: task.priority),
                  ],
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetailScreen(task: task),
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}