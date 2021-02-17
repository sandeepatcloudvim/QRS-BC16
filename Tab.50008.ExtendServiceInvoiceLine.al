tableextension 50008 ExtendServiceInvoiceLine extends "Service Invoice Line"
{
    fields
    {
        field(50000; "QRS Mnfg Name"; text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mnfg Name';
        }
        field(50001; "QRS Mnfg ItemNo"; text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mnfg Item No.';
        }
        field(50002; "Customer Ref No"; text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Ref No';
        }
        field(50003; "Sort Order"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Sort Order';

        }
    }
    keys
    {
        key(Key1; "QRS Mnfg Name", "QRS Mnfg ItemNo", "Customer Ref No")
        {

        }
    }

    var
        myInt: Integer;
}