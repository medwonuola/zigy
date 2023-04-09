import 'package:flutter/material.dart';

import '../model/user.dart';
import '../services/fetch_users.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<User>> _futureUsers;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _futureUsers = fetchUsers(1);
  }

  void _changePage(int page) {
    setState(() {
      _currentPage = page;
      _futureUsers = fetchUsers(page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF020202),
        title: const Text('Zigy API Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: FutureBuilder<List<User>>(
                future: _futureUsers,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: snapshot.hasData
                          ? ListView.builder(
                              key: ValueKey(_currentPage),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final user = snapshot.data![index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(user.avatar),
                                  ),
                                  title: Text(
                                      '${user.firstName} ${user.lastName}',
                                      style:
                                          const TextStyle(color: Colors.black)),
                                  subtitle: Text(user.email,
                                      style:
                                          const TextStyle(color: Colors.grey)),
                                );
                              },
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _currentPage == 1
                      ? const Color(0xFF020202)
                      : const Color(0xFFE0E0E0),
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _changePage(1),
                child: const Text('1'),
              ),
              const SizedBox(width: 16),
              TextButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _currentPage == 2
                      ? const Color(0xFF020202)
                      : const Color(0xFFE0E0E0),
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _changePage(2),
                child: const Text('2'),
              ),
            ],
          ),
          const SizedBox(height: 32)
        ],
      ),
    );
  }
}
