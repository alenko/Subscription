codeunit 50300 "CSD Subscription Mgt"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', true, true)]
    local procedure UpdateSubscriptions(SalesInvHdrNo: Code[20])
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        CustomerSubscription: Record "CSD Customer Subscription";
        Subscription: Record "CSD Subscription";
    begin
        OnBeforeUpdateSubscriptions(SalesInvHdrNo);
        SalesInvoiceLine.SetFilter("Document No.", SalesInvHdrNo);
        if SalesInvoiceLine.FindSet() then
            repeat
                OnBeforeUpdateCustomerSubscriptions(CustomerSubscription);
                CustomerSubscription.SetRange("Customer No.", SalesInvoiceLine."Sell-to Customer No.");
                CustomerSubscription.SetRange("Item No.", SalesInvoiceLine."No.");
                if CustomerSubscription.FindFirst() then begin
                    CustomerSubscription."Last Invoice Date" := SalesInvoiceLine."Posting Date";
                    Subscription.GET(CustomerSubscription."Subscription Code");
                    CustomerSubscription."Next Invoice Date" := CalcDate(Subscription."Invoicing Frequence", CustomerSubscription."Last Invoice Date");
                    CustomerSubscription.Modify();
                end;
            until SalesInvoiceLine.Next() = 0;
    end;

    local procedure PBA()
    var
        myInt: Integer;
    begin

    end;

    [IntegrationEvent(false, false)]

    local procedure OnBeforeUpdateSubscriptions(SalesInvHdrNo: Code[20])


    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateCustomerSubscriptions(CustomerSubscriptions: Record "CSD Customer Subscription")
    begin
    end;
}