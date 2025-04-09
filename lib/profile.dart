import 'package:flutter/material.dart';

void main() {
  runApp(const EasyLifeApp());
}

class EasyLifeApp extends StatefulWidget {
  const EasyLifeApp({super.key});

  @override
  State<EasyLifeApp> createState() => _EasyLifeAppState();
}

class _EasyLifeAppState extends State<EasyLifeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Life Profile',
      theme: ThemeData.light(),
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            // Header
            Container(
              height: 160,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFDE006F), Color(0xFF902ED2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
               
              ),
              child: Container(
               
                decoration: BoxDecoration(
                   color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://via.placeholder.com/150'), // Replace with actual image
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Easy Life',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.yellow, size: 16),
                                  SizedBox(width: 4),
                                  Text('5.0 (0)',
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(width: 8),
                                  Text('16+ Products',
                                      style: TextStyle(color: Colors.white70)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(Icons.toggle_off,
                                  color: Colors.grey, size: 28),
                            ),
                            const SizedBox(height: 4),
                            const Text('Offline',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 12))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Theme and Language
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Switch(value: false, onChanged: (_) {}),
                    const Text('Theme Mode'),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.flag, size: 16),
                      SizedBox(width: 4),
                      Text('English'),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),

            // User Info
            InfoCard(
              title: 'User Info',
              children: const [
                InfoRow(label: 'Full Name', value: 'ramu Abedin'),
                InfoRow(label: 'Phone Number', value: '01100088800'),
                InfoRow(label: 'Gender', value: 'Male'),
                InfoRow(label: 'Email', value: 'shop@readyecommerc...'),
              ],
            ),
            const SizedBox(height: 20),

            // Shop Info
            InfoCard(
              title: 'Shop Info',
              children: const [
                InfoRow(label: 'Shop Name', value: 'Easy Life'),
                InfoRow(label: 'Shop Phone Number', value: '01100088800'),
                InfoRow(label: 'Address', value: 'Dhaka Bangladesh'),
                SizedBox(height: 10),
                Text(
                  'Welcome to Easy Life, your go-to electronics shop! We offer the latest gadgets and accessories to simplify your life. Our expert staff is here to help you find exactly what you need!',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Bottom Profile Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.pinkAccent.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_outline),
                  SizedBox(width: 8),
                  Text('Profile'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const InfoCard({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: Colors.grey))),
          Expanded(
              child: Text(value,
                  style: const TextStyle(fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}