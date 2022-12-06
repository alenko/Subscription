/// <summary>
/// Page CustomerBalanceReport (ID 50348).
/// </summary>
page 50348 "CustomerBalanceReport"
{
    PageType = ListPart;
    SourceTable = Customer;
    layout
    {
        area(content)
        {
            repeater("Customer Balance")
            {
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                }
                field("Balance"; Rec."Balance")
                {
                    ApplicationArea = All;

                }

            }
        }


    }
    actions
    {
        // Adds the action called "My Actions" to the Action menu 
        area(Processing)
        {
            action(GeneratePDF)
            {
        var
            CustomerBalances: Record "Customer Balance";
            PDFDocument: Codeunit "PDF Generator";

            CustomerBalances.SetRange("Balance", ">", 0);
        PDFDocument.GenerateFromPage(CustomerBalances, 50100);
        PDFDocument.SaveToIncomingDocuments("My Custom Name.pdf");
    }
        }

    }