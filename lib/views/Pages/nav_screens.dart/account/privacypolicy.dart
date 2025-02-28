import 'package:Matrix.sc/constants/constants.dart';
import 'package:flutter/material.dart';

class Privacypolicy extends StatelessWidget {
  const Privacypolicy({super.key});

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;

    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        centerTitle: true,
        title: Text("About us"),
      ),
      body: SafeArea(
        child: SizedBox(
          height: screenheight,
          width: screenwidth,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Matrix Supply Chain \n",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                TextSpan(text: "Key Privacy Laws in Kenya\n"),
                TextSpan(text: "1. Data Protection Act, 2019 (DPA)\n"),
                TextSpan(
                    text:
                        "• Establishes rights of data subjects (individuals) and obligations for data controllers/processors (like Matrix Supply Chain).\n"),
                TextSpan(
                    text:
                        "• Overseen by the Office of the Data Protection Commissioner (ODPC).\n"),
                TextSpan(text: "2. Constitution of Kenya, 2010\n"),
                TextSpan(
                    text:
                        "• Article 31 guarantees the right to privacy, including protection against unauthorized collection and misuse of personal data.\n"),
                TextSpan(
                    text: "3. Computer Misuse and Cybercrimes Act, 2018\n"),
                TextSpan(
                    text: "3. Computer Misuse and Cybercrimes Act, 2018\n"),
                TextSpan(
                    text:
                        "• Addresses cybercrimes like unauthorized access, hacking, and data breaches that could affect personal information.\n"),
                TextSpan(text: "4. Consumer Protection Act, 2012\n"),
                TextSpan(
                    text:
                        "• Protects consumers from unfair trade practices, including misuse of their personal information.\n"),
                TextSpan(text: " Key Principles Under the DPA \n"),
                TextSpan(
                    text:
                        "To comply, the app must adhere to the following principles:\n"),
                TextSpan(text: "1. Lawful Processing\n"),
                TextSpan(
                    text:
                        "• Collect data only with consent or another lawful basis (e.g.,contractual necessity or legal obligation).\n"),
                TextSpan(
                    text:
                        "• Inform users why their data is being collected, how it will be  used, and who it will be shared with.\n"),
                TextSpan(text: "2. Purpose Limitation\n"),
                TextSpan(
                    text:
                        "• Use personal data only for the purpose it was collected.\n"),
                TextSpan(text: "3. Data Minimization\n"),
                TextSpan(
                    text:
                        "• Collect only the data that is strictly necessary for the app's operations.\n"),
                TextSpan(text: "4. Accuracy\n"),
                TextSpan(
                    text:
                        "• Ensure all stored data is accurate and up to date.\n"),
                TextSpan(text: "4. Accuracy\n"),
                TextSpan(
                    text:
                        "• Ensure all stored data is accurate and up to date.\n"),
                TextSpan(text: "5. Storage Limitation\n"),
                TextSpan(
                    text:
                        "• Do not keep personal data longer than necessary.\n"),
                TextSpan(text: "6. Security\n"),
                TextSpan(
                    text:
                        "• Implement measures like encryption, secure servers, and regular audits to protect data from breaches.\n"),
                TextSpan(text: "7. Accountability\n"),
                TextSpan(
                    text:
                        "• Be able to demonstrate compliance with these principles\n"),
                TextSpan(
                    text: "How Matrix Supply Chain Can Protect User Privacy\n"),
                TextSpan(
                    text:
                        "Here's a guide on how to comply and effectively use the laws:\n"),
                TextSpan(text: "1. Develop a Privacy Policy\n"),
                TextSpan(
                    text:
                        "• Draft a clear, user-friendly privacy policy detailing:\n"),
                TextSpan(
                    text:
                        "► What data is collected.\n ► How data is used, stored, and shared.\n ► Users' rights under the DPA. \n• Ensure the privacy policy is accessible in the app.\n"),
                TextSpan(
                    text:
                        "2. Obtain Consent \n • Use opt-in mechanisms (e.g., checkboxes) to obtain explicit consent for data collection and sharing.\n"),
                TextSpan(
                    text:
                        "3. Secure Data \n • Use encryption (e.g., HTTPS, end-to-end encryption for sensitive data). \n • Store data on secure servers with restricted access. \n • Regularly update software to \n patch vulnerabilities.\n4. Limit Data Access \n • Grant access to personal data only to authorized employees\n"),
                TextSpan(
                    text:
                        "4. Limit Data Access \n• Grant access to personal data only to authorized employees or systems that need it for operations.\n• Implement role-based access controls.\n"),
                TextSpan(
                    text:
                        "5. Enable User Rights \n• Allow users to: \n► Access their data.\n ► Correct inaccurate information. \n ► Request data deletion (right to be forgotten). \n ► Object to certain types of processing (e.g., marketing).\n"),
                TextSpan(text: "6. Data Breach Management \n"),
                TextSpan(
                    text:
                        "6. Data Breach Management \n • Have a procedure to detect, report, and manage breaches. \n• Notify affected users and the ODPC within 72 hours of a breach.\n"),
                TextSpan(
                    text:
                        "7. Conduct Data Protection Impact Assessments (DPIAs) \n• Assess risks when introducing new features or processes involving personal data.\n"),
                TextSpan(
                    text:
                        "8. Train Employees \n• Train staff on data protection principles and the importance of user privacy.\n"),
                TextSpan(
                    text:
                        "Effective Usage of Privacy Practices To foster trust and maintain compliance:\n"),
                TextSpan(
                    text:
                        "• Transparency: Regularly update users on changes to privacy policies or new data practices.\n"),
                TextSpan(
                    text:
                        "• Customer Support: Provide a channel for users to inquire about data practices or exercise their rights.\n"),
                TextSpan(
                    text:
                        "• Continuous Compliance: Monitor legal updates and revise processes to align with new regulations.\n"),
                TextSpan(
                    text:
                        "By integrating these practices, Matrix Supply Chain can safeguard user data, enhance customer trust, and avoid penalties from the ODPC for non-compliance. ")
              ])),
            ],
          )),
        ),
      ),
    );
  }
}
