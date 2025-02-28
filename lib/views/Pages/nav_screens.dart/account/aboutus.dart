import 'package:Matrix.sc/constants/constants.dart';
import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

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
                    text: "Matrix Supply Chain ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                TextSpan(
                    text:
                        "is a dynamic economic app-based organization headquartered in Eldoret, Kenya. It focuses on revolutionizing logistics, transportation, and supply chain management for businesses and individuals. The platform connects sellers, buyers, and transporters, creating a seamless network that enhances trade efficiency and reduces operational barriers.\n"),
                TextSpan(text: "Core Functions of Matrix Supply Chain\n"),
                TextSpan(text: "1.Transportation Services"),
                TextSpan(
                    text:
                        "• The app offers real-time solutions for the transportation of goods,connecting users with reliable transport providers. This connecting users with reliable transport providers.This ensures timely delivery and efficient logistics operations \n• Users can track shipments, schedule deliveries, and receive notifications through the app.\n"),
                TextSpan(text: "2. Seller Coordination"),
                TextSpan(
                    text:
                        "• Matrix Supply Chain brings together various sellers, streamlining the distribution of goods. It acts as a virtual marketplace where businesses and individuals can list and sell products efficiently.\n• The platform facilitates inventory management and order processing.\n"),
                TextSpan(text: "3. Selling and Distribution\n"),
                TextSpan(
                    text:
                        "• The app enables sellers to reach a wider audience by providing a digital marketplace integrated with logistics support.\n"),
                TextSpan(
                    text:
                        "• Buyers can compare prices, browse products, and place orders, all within the platform.\n"),
                TextSpan(text: "4. Buyer-Seller-Transporter Collaboration\n"),
                TextSpan(
                    text:
                        "• By acting as an intermediary, Matrix Supply Chain ensures that sellers, transporters, and buyers coordinate effectively.\n"),
                TextSpan(
                  text:
                      "• This eliminates middlemen and reduces costs, providing an economical solution for all stakeholders.\n",
                ),
                TextSpan(
                    text: "Key Features of the App\n ",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        "• Real-time Tracking: Buyers and sellers can monitor shipments and ensure timely deliveries.\n"),
                TextSpan(
                    text:
                        "• Payment Integration: Secure payment gateways that facilitate smooth transactions between parties.\n"),
                TextSpan(
                    text:
                        "• Data Analytics: Insights into sales, demand, and transportation metrics to help businesses make informed decisions.\n"),
                TextSpan(
                    text:
                        "• User-friendly Interface: Intuitive app design that simplifies navigation for sellers, buyers, and transporters.\n"),
                TextSpan(text: "Economic Impact in Eldoret and Beyond\n"),
                TextSpan(
                    text:
                        "• Boosting Local Businesses: The platform has empowered small and medium enterprises (SMEs) in Eldoret, helping them expand their market reach.\n"),
                TextSpan(
                    text:
                        "• Job Creation: By connecting transport providers, the app generates employment opportunities for drivers, loaders, and other logistics personnel.\n"),
                TextSpan(
                    text:
                        "• Supply Chain Optimization: It reduces inefficiencies in traditional supply chains, lowering operational costs and boosting profitability.\n"),
                TextSpan(
                    text:
                        "• Increased Trade Volume: By boosting profitability.\n"),
                TextSpan(
                    text:
                        "• Increased Trade Volume: By enabling seamless transactions, the app contributes to the economic growth of Eldoret and surrounding regions.\n"),
                TextSpan(
                    text: "Vision for the Future\n ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                TextSpan(
                    text:
                        "Matrix Supply Chain aims to expand its services across Kenya and the broader East African region. Its focus is on integrating advanced technologies like Al for route optimization, blockchain for secure transactions, and loT for enhanced tracking capabilities.\n"),
                TextSpan(
                    text:
                        "By fostering collaboration and enhancing economic efficiency, Matrix Supply Chain is poised to become a leader in the digital transformation of logistics and supply chain management in Africa.")
              ]))
            ],
          )),
        ),
      ),
    );
  }
}
