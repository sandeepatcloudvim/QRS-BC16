tableextension 50005 QRSServiceItemLine extends "Service Item Line"
{
    fields
    {
        field(50000; "Service Interval"; DateFormula)
        {
            DataClassification = CustomerContent;
            Caption = 'Service Interval';
        }
        field(50001; "Next Service Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Next Service Date';
        }
        field(50002; "QRS Mnfg Name"; text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mnfg Name';
            Editable = false;
        }
        field(50003; "QRS Mnfg ItemNo"; text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mnfg Item No.';
            Editable = false;
        }
        field(50004; "Customer Ref No"; text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Ref No';
            Editable = false;
        }

    }

    var
        myInt: Integer;
        enumServiceDocument: Enum "Service Document Type";

    procedure CreateServiceItemLineConsumbles()
    var
        ServiceItemLine: Record "Service Item Line";
        recServiceItem: Record "Service Item";
        recItem: Record Item;
    begin
        ServiceItemLine.RESET;
        ServiceItemLine.SETRANGE("Document No.", "Document No.");
        ServiceItemLine.SetFilter("Item No.", '<>%1', '');
        IF NOT ServiceItemLine.FINDSET THEN
            exit;
        IF ServiceItemLine.FindFirst() THEN
            REPEAT
                if "Document Type" = "Document Type"::Quote then begin
                    if recServiceItem.Get(ServiceItemLine."Service Item No.") then begin
                        if recServiceItem."Consumables 1" <> '' then begin
                            if NOT recItem.Get(recServiceItem."Consumables 1") then
                                exit;
                            CreateServiceItemWoksheetLines(ServiceItemLine, GetLastItemNo(enumServiceDocument::Quote), recItem, enumServiceDocument::Quote);

                        end;
                        if recServiceItem."Consumables 2" <> '' then begin
                            if NOT recItem.Get(recServiceItem."Consumables 2") then
                                exit;
                            CreateServiceItemWoksheetLines(ServiceItemLine, GetLastItemNo(enumServiceDocument::Quote), recItem, enumServiceDocument::Quote);

                        end;
                    end;
                end
                else
                    if "Document Type" = "Document Type"::Order then begin
                        if recServiceItem.Get(ServiceItemLine."Service Item No.") then begin
                            if recServiceItem."Consumables 1" <> '' then begin
                                if NOT recItem.Get(recServiceItem."Consumables 1") then
                                    exit;

                                CreateServiceItemWoksheetLines(ServiceItemLine, GetLastItemNo(enumServiceDocument::Order), recItem, enumServiceDocument::Order);

                            end;

                            if recServiceItem."Consumables 2" <> '' then begin
                                if NOT recItem.Get(recServiceItem."Consumables 2") then
                                    exit;
                                CreateServiceItemWoksheetLines(ServiceItemLine, GetLastItemNo(enumServiceDocument::Order), recItem, enumServiceDocument::order);

                            end;
                        end;
                    end;
            until ServiceItemLine.Next() = 0;

    end;

    procedure GetLastItemNo(DocumentTypeVar: Enum "Service Document Type") Linenumber: Integer
    var
        ServiceLine: Record "Service Line";
    begin
        ServiceLine.reset;
        ServiceLine.SETRANGE("Document Type", DocumentTypeVar);
        ServiceLine.SETRANGE("Document No.", "Document No.");
        // ServiceLine.SetRange("Service Item No.", "Service Item No.");
        if ServiceLine.FindLast() then
            LineNumber := ServiceLine."Line No." + 10000
        else
            LineNumber := 10000;

    end;

    local procedure CreateServiceItemWoksheetLines(ServiceItemLine: Record "Service item Line"; LineNumber: Integer; recConsumbleItem: Record Item; DocumentTypeVar: Enum "Service Document Type")
    var
        enumServiceDocument: Enum "Service Document Type";
        ServiceLine: Record "Service Line";
        recServiceItem: Record "Service Item";

    begin

        ServiceLine.INIT;
        ServiceLine."Document Type" := DocumentTypeVar;
        ServiceLine."Document No." := ServiceItemLine."Document No.";
        ServiceLine."Customer No." := ServiceItemLine."Customer No.";
        ServiceLine."Line No." := LineNumber;
        ServiceLine.Type := ServiceLine.Type::Item;
        ServiceLine.VALIDATE("No.", recConsumbleItem."No.");
        ServiceLine."Service Item No." := ServiceItemLine."Service Item No.";
        ServiceLine.VALIDATE("Service Item Line No.", ServiceItemLine."Line No.");
        ServiceLine.VALIDATE(Quantity, 1);
        ServiceLine."Unit Price" := recConsumbleItem."Unit Price";
        ServiceLine."Item Category Code" := recConsumbleItem."Item Category Code";
        ServiceLine."QRS Mnfg ItemNo" := ServiceItemLine."QRS Mnfg ItemNo";
        ServiceLine."QRS Mnfg Name" := ServiceItemLine."QRS Mnfg Name";
        ServiceLine."Customer Ref No" := ServiceItemLine."Customer Ref No";

        ServiceLine.INSERT;
    end;

    trigger OnBeforeDelete()
    var
        ServLine: Record "Service Line";
    begin
        //CV_SS_060820>>
        ServLine.RESET;
        ServLine.SETCURRENTKEY("Document Type", "Document No.", "Service Item Line No.");
        ServLine.SETRANGE("Document Type", "Document Type");
        ServLine.SETRANGE("Document No.", "Document No.");
        ServLine.SETRANGE("Service Item Line No.", "Line No.");
        IF ServLine.FIND('-') THEN
            ServLine.DELETEALL;
        //CV_SS_060820<<
    end;
}