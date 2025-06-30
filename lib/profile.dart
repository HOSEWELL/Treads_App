// lib/profile.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For launching URLs (WhatsApp)
import 'help_page.dart'; // Import the new HelpPage
import 'explore_page.dart'; // Import the new ExplorePage

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Function to launch WhatsApp (simulated for now, but ready for url_launcher)
  void _launchWhatsApp(BuildContext context) async {
    const url = 'https://chat.whatsapp.com/YOUR_WHATSAPP_CHANNEL_LINK'; // Replace with your actual WhatsApp channel link
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not launch WhatsApp. (Simulated)")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
          children: [
            // --- Profile Picture (Initials) ---
            Container(
              padding: const EdgeInsets.all(8.0), // Padding around the avatar
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.shade100, // Light background for the avatar container
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.shade200.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 60, // Size of the avatar
                backgroundColor: Colors.green.shade600, // Background color for initials
                child: const Text(
                  "HK", // Initials for Hosewell Karanja
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Color of the initials
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // --- User Name ---
            Text(
              "Hosewell Karanja",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Trendsetter & Eco-Warrior", // A tagline
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 40),

            // --- Account Settings Section ---
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Account Settings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800, // Dark grey for section titles
                ),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.lock_outline, color: Colors.green.shade600),
                    title: const Text("Change Password"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Change Password feature (placeholder).")),
                      );
                      // Implement navigation to a password change screen here
                    },
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16, color: Colors.grey.shade300),
                  ListTile(
                    leading: Icon(Icons.info_outline, color: Colors.green.shade600),
                    title: const Text("About Trends of Change"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("About app info (placeholder).")),
                      );
                      // Implement navigation to an About page here
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // --- Support & Explore Section ---
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Help & Community",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.help_outline, color: Colors.green.shade600),
                    title: const Text("Get Help"),
                    subtitle: const Text("Contact support, FAQs"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HelpPage()),
                      );
                    },
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16, color: Colors.grey.shade300),
                  ListTile(
                    leading: Icon(Icons.explore_outlined, color: Colors.green.shade600),
                    title: const Text("Explore More"),
                    subtitle: const Text("Blog, community, news"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ExplorePage()),
                      );
                    },
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16, color: Colors.grey.shade300),
                  ListTile(
                    leading: Icon(Icons.chat, color: Colors.green.shade600),
                    title: const Text("Join WhatsApp Channel"),
                    subtitle: const Text("Get updates directly"),
                    trailing: const Icon(Icons.open_in_new, size: 16, color: Colors.grey),
                    onTap: () => _launchWhatsApp(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // --- Logout Button ---
            SizedBox(
              width: double.infinity, // Make button full width
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Logging out (simulated).")),
                  );
                  // Implement actual logout logic here (e.g., navigate to login screen)
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  "Log Out",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600, // Red for logout
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
              ),
            ),
            const SizedBox(height: 20), // Bottom padding
          ],
        ),
      ),
    );
  }
}