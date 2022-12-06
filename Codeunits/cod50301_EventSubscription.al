codeunit 50301 "CSD Event Subscriptions"
{
    //################ Sales Subs. ################
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', true, true)]
    local procedure SendEmailOnAfterPostShipment(var SalesHeader: Record "Sales Header"; SalesShptHdrNo: Code[20])
    var
        SalesShipmentHdr: Record "Sales Shipment Header";
        MailFunctions: Codeunit "Mail Functions";
    begin
        if not SalesHeader.Ship then
            exit;
        if SalesShipmentHdr.Get(SalesShptHdrNo) then
            MailFunctions.SendDeliveryNoteByMail(SalesShipmentHdr);


    end;







    //################   Purch Subs.###############
    //################### FINANCE ###################
}