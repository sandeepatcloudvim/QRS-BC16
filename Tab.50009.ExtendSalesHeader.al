tableextension 50009 ExtendSalesHeader extends "Sales Header"
{
    fields
    {
        field(50000; "User Defined No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'User Defined No. Series';
            ObsoleteState = Removed;
        }
    }

    var
        myInt: Integer;
}