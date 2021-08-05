
import 'package:flutter_ui_kit/sixvalley/data/model/response/support_ticket_model.dart';

class SixSupportTicketRepo {

  List<SupportTicketModel> getSupportTicketList() {
    List<SupportTicketModel> supportTicketList = [
      SupportTicketModel(id: 1, customerId: '1', status: 'pending', subject: 'A bug found', type: 'Bug', priority: 'low', description: 'There is a big problem with product'),
    ];
    return supportTicketList;
  }
}