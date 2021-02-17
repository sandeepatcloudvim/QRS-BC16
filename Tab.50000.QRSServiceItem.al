tableextension 50000 MyExtension extends "Service Item"
{
    fields
    {
        // Add changes to table fields here
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
        field(50002; "QRS Shelf Loc"; text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Shelf Loc';
        }
        field(50003; "Customer Ref No"; text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Ref No';
        }
        field(50004; "Consumables 1"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Consumables 1';
            TableRelation = Item;
        }
        field(50005; "Consumables 2"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Consumables 2';
            TableRelation = Item;
        }
        field(50006; "Service Interval"; DateFormula)
        {
            DataClassification = CustomerContent;
            Caption = 'Service Interval';
            trigger OnValidate()
            begin
                "Next Service Date" := CALCDATE("Service Interval", WorkDate());
            end;
        }
        field(50007; "Next Service Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Next Service Date';
        }


    }

    var
        myInt: Integer;
}