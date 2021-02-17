tableextension 50006 ExtendServiceInvoiceHeader extends "Service Invoice Header"
{
    fields
    {
        field(50011; "Package ID No."; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Package ID No.';
        }
        field(50012; "Customer PO No."; Code[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer PO No.';
        }
    }

    var
        myInt: Integer;
}