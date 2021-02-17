tableextension 50007 ExtendServiceLine extends "Service Line"
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

    trigger OnInsert()
    var
        recServiceItem: Record "Service Item";
        ServiceLineType: Enum "Service Line Type";
    begin
        if recServiceItem.GET("Service Item No.") then begin
            "QRS Mnfg ItemNo" := recServiceItem."QRS Mnfg ItemNo";
            "QRS Mnfg Name" := recServiceItem."QRS Mnfg Name";
            "Customer Ref No" := recServiceItem."Customer Ref No";
        end;
    end;

    trigger OnModify()
    var
        recServiceItem: Record "Service Item";
        ServiceLineType: Enum "Service Line Type";
    begin
        if recServiceItem.GET("Service Item No.") then begin
            "QRS Mnfg ItemNo" := recServiceItem."QRS Mnfg ItemNo";
            "QRS Mnfg Name" := recServiceItem."QRS Mnfg Name";
            "Customer Ref No" := recServiceItem."Customer Ref No";
        end;
    end;
}