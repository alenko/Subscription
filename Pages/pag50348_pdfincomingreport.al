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


}