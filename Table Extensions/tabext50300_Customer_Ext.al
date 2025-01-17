tableextension 50300 "CSD Customer" extends Customer
{
    fields
    {
        field(50300; "CSD Customer Subscription"; Boolean)
        {
            Caption = 'Customer Subscription';
            FieldClass = FlowField;
            CalcFormula = exist("CSD Customer Subscription" where("Customer No." = field("No."), Active = const(true)));
            Editable = false;
        }
        field(50301; "PBA"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50302; "PBA2"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50303; "Gender"; Text[50])
        {
            DataClassification = CustomerContent;
        }
    }
}