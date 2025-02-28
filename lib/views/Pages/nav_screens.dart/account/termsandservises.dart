import 'package:Matrix.sc/constants/constants.dart';
import 'package:flutter/material.dart';

class Termsandservises extends StatelessWidget {
  const Termsandservises({super.key});

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;

    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        centerTitle: true,
        title: Text("Terms and Service"),
      ),
      body: SafeArea(
        child: SizedBox(
          height: screenheight,
          width: screenwidth,
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Text.rich(TextSpan(children: <InlineSpan>[
                TextSpan(
                    text:
                        "Welcome to Matrix Supply Chain! By accessing or using our app or website, you agree to comply with and be bound by these Terms and Conditions (T&Cs). Please read them carefully. If you do not agree, you must not use our services.\n"),
                TextSpan(text: "1. Definitions\n"),
                TextSpan(
                    text:
                        "• 'Matrix Supply Chain' refers to the mobile app, website, and associated services provided by us.\n"),
                TextSpan(
                    text:
                        "• 'User' refers to any individual or entity accessing or using our platform.\n"),
                TextSpan(
                    text:
                        "• 'Content' includes all data, text, graphics, logos, software, and information available on our platform.\n"),
                TextSpan(text: "2. Eligibility\n"),
                TextSpan(text: "To use our platform, you must:\n"),
                TextSpan(
                    text:
                        "• Be at least 18 years old or have parental/guardian consent if under 18.\n"),
                TextSpan(
                    text:
                        "• Comply with all applicable laws, including but not limited to the Kenya Information and Communications Act (KICA) and the Data Protection Act, 2019.\n"),
                TextSpan(text: "3. User Responsibilities\n"),
                TextSpan(text: "As a user, you agree to:\n"),
                TextSpan(
                    text:
                        "• Provide accurate and complete information during registration.\n"),
                TextSpan(
                    text:
                        "• Maintain the confidentiality of your account credentials.\n"),
                TextSpan(
                    text: " • Use the platform for lawful purposes only.\n"),
                TextSpan(text: "• Refrain from uploading, sharing,\n"),
                TextSpan(
                    text:
                        "• Refrain from uploading, sharing, or distributing illegal, harmful, or inappropriate content.\n"),
                TextSpan(text: "4. Privacy Policy\n"),
                TextSpan(
                    text:
                        "We prioritize your privacy and are committed to protecting your personal data."),
                TextSpan(
                    text:
                        "• Your data will be collected, processed, and stored in accordance with the Kenya Data Protection Act, 2019.\n"),
                TextSpan(
                    text:
                        "• We do not share your personal information with third parties without your consent, except as required by law.\n"),
                TextSpan(
                    text:
                        "• For detailed information, please refer to our Privacy Policy [Insert Link].\n"),
                TextSpan(text: "5. Prohibited Activities You agree not to:\n "),
                TextSpan(
                    text:
                        "• Use the platform to engage in fraud, spamming, hacking, or any other unlawful activity.\n"),
                TextSpan(
                    text:
                        "• Violate the intellectual property  rights of Matrix Supply Chain or  third parties.\n"),
                TextSpan(
                    text:
                        "• Interfere with the security, performance, or functionality of the platform.\n"),
                TextSpan(text: "6. Payments and Transactions\n"),
                TextSpan(
                    text:
                        "• All payments made through the platform must comply with Kenyan laws, including regulations from the Central Bank  of Kenya (CBK).\n"),
                TextSpan(
                    text:
                        "• Users are responsible for ensuring the accuracy of payment details.\n"),
                TextSpan(
                    text:
                        "• Refunds and cancellations will be subject to our specific policy terms [Insert Link]\n."),
                TextSpan(text: "7. Liability Disclaimer\n"),
                TextSpan(
                    text:
                        "• Matrix Supply Chain does not guarantee uninterrupted or error-free service.\n"),
                TextSpan(
                    text:
                        "• We are not liable for any losses, damages, or harm resulting from your use of the platform, except as required by law.\n"),
                TextSpan(text: "8. Intellectual Propert\n"),
                TextSpan(
                    text:
                        "• All content and trademarks on the platform are the property of Matrix Supply Chain or licensed to us.\n"),
                TextSpan(
                    text:
                        "• Unauthorized use, reproduction, or distribution of our intellectual property is strictly prohibited.\n"),
                TextSpan(text: "9. Termination of Use\n"),
                TextSpan(
                    text:
                        "We reserve the right to terminate or suspend your account without prior notice if:\n"),
                TextSpan(text: "• You violate these T&Cs.\n"),
                TextSpan(
                    text:
                        "• You engage in fraudulent or harmful activities.\n"),
                TextSpan(text: "10. Amendments\n"),
                TextSpan(
                    text:
                        "We may update these T&Cs at any time. Significant changes will be communicated to users via the platform or email. Continued use after updates constitutes acceptance of the revised terms.\n"),
                TextSpan(text: "11. Governing Law\n"),
                TextSpan(
                    text:
                        "These T&Cs are governed by the laws of Kenya, and any disputes will be resolved under Kenyan jurisdiction.\n"),
                TextSpan(text: "12. Contact Us\n"),
                TextSpan(
                    text:
                        "If you have any questions about these Terms and Conditions, you can contact us at:\n"),
                TextSpan(text: "• Email: [Insert Email Address]\n"),
                TextSpan(text: "• Phone: [Insert Phone Number]\n"),
                TextSpan(text: "• Address:[Insert Address]\n"),
                TextSpan(
                    text:
                        "By using the Matrix Supply Chain app or website, you acknowledge  that you have read, understood, and agreed to these Terms and Conditions.\n")
              ]))
            ],
          )),
        ),
      ),
    );
  }
}
