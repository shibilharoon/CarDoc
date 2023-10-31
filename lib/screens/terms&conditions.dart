import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("CARDOC - Terms and Conditions"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            '''
Welcome to CARDOC, your trusted automobile service center. These Terms and Conditions outline the rules and regulations for using our mobile application.

1. Acceptance of Terms

By accessing or using the CARDOC mobile application, you agree to comply with and be bound by these Terms and Conditions. If you do not agree with any part of these terms, please refrain from using our services.

2. Service Description

CARDOC offers a wide range of automobile maintenance and repair services. While we strive for accuracy, the information provided on our app may not always be up to date. We reserve the right to modify or discontinue our services at any time without prior notice.

3. Service Appointments

To book an appointment, users are required to provide accurate and complete information. CARDOC will not be held responsible for any inaccuracies in appointment details. We recommend booking in advance to secure your preferred time slot.

4. Payment and Pricing

Pricing for our services is clearly displayed in the app. Payment is due upon completion of the service. CARDOC accepts various payment methods, including credit/debit cards and mobile payment systems. Prices are subject to change without notice.

5. Cancellation Policy

If you need to cancel or reschedule an appointment, please notify us at least 24 hours in advance. Failure to do so may result in a cancellation fee. CARDOC reserves the right to cancel appointments due to unforeseen circumstances.

6. Vehicle Safety and Liability

CARDOC is committed to providing high-quality service. However, we are not responsible for any damage or loss to your vehicle while it is in our care. We recommend removing valuable items from your vehicle before service.

7. User Conduct

Users are expected to conduct themselves respectfully and follow all guidelines provided by our staff. Any disruptive or inappropriate behavior may result in the termination of services and legal action, if necessary.

8. Privacy Policy

We take your privacy seriously. Please refer to our Privacy Policy to understand how we collect, use, and protect your personal information.

9. Intellectual Property

All content, including logos, trademarks, and graphics, on the CARDOC app is the intellectual property of CARDOC and is protected by copyright laws. Users are not authorized to use our intellectual property without prior written consent.

10. Termination

CARDOC reserves the right to terminate access to the app and services for any user who violates these Terms and Conditions. Termination may occur without prior notice.

11. Changes to Terms and Conditions

CARDOC may update these Terms and Conditions from time to time. Users will be notified of any changes. Continued use of our services after such modifications constitutes acceptance of the revised Terms and Conditions.

12. Contact Information

If you have any questions or concerns about these Terms and Conditions or our services, please contact us at [shibilharoon2001email.com].

Thank you for choosing CARDOC. We look forward to serving your automobile service needs with dedication and expertise.
            ''',
          ),
        ),
      ),
    );
  }
}
