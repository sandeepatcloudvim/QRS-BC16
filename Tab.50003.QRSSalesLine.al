tableextension 50003 ExtendSalesLine extends "Sales Line"
{
    fields
    {
        field(50000; "Lead Time"; Date)
        {
            Caption = 'Lead Time';
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
        }
        field(50001; "Freight on Board"; Text[30])
        {
            Caption = 'Shipping & Handling';
            DataClassification = CustomerContent;
        }
        field(50002; "Lead Times"; Text[30])
        {
            Caption = 'Lead Time';
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}