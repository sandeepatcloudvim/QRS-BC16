tableextension 50002 QRSServiceHeader extends "Service Header"
{
    fields
    {
        field(50000; "PO Number"; text[40])
        {
            Caption = 'PO Number';
            DataClassification = CustomerContent;
        }

        field(50001; "PO Amount"; Decimal)
        {
            Caption = 'PO Amount';
            DataClassification = CustomerContent;
        }
        field(50002; "PO Line No"; text[10])
        {
            Caption = 'PO Line No';
            DataClassification = CustomerContent;
        }
        field(50003; "Cost Center Code"; text[30])
        {
            Caption = 'Cost Center Code';
            DataClassification = CustomerContent;
        }

        field(50004; "Parking Instructions"; text[200])
        {
            Caption = 'Parking Instructions';
            DataClassification = CustomerContent;
        }

        field(50005; "Shop Hours"; text[50])
        {
            Caption = 'Shop Hours';
            DataClassification = CustomerContent;
        }
        field(50006; "Vendor Credentials"; text[50])
        {
            Caption = 'Vendor Credentials';
            DataClassification = CustomerContent;
        }
        field(50007; Department; text[50])
        {
            Caption = 'Department';
            DataClassification = CustomerContent;
        }
        field(50008; "Location Desc"; text[50])
        {
            Caption = 'Location Desc';
            DataClassification = CustomerContent;
        }
        field(50009; "Service Days"; Integer)
        {
            Caption = 'Service Days';
            DataClassification = CustomerContent;
        }
        field(50010; "External Vendor"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'External Vendor';
            TableRelation = Vendor;
        }
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
        recServiceItem: Record "Service Item";

        recServiceItem2: Record "Service Item";

        LineNo: Integer;

        ServiceItemLine: Record "Service Item Line";

        enumServiceDocument: Enum "Service Document Type";

    procedure CreateServiceItemLine()

    begin
        recServiceItem.Reset();
        recServiceItem.SetRange("Customer No.", "Customer No.");
        recServiceItem.SetFilter(Status, '<>%1', recServiceItem.Status::InActive);
        recServiceItem.SetFilter("Next Service Date", '<=%1', "Posting Date" + "Service Days");

        if NOT recServiceItem.FindFirst() then
            ERROR('There is no record found to process')
        else
            LineNo := 10000;

        if "Document Type" = "Document Type"::Quote then begin
            if recServiceItem.FindFirst() then
                repeat
                    InsertServiceLine(enumServiceDocument::Quote);
                until recServiceItem.Next() = 0
        end
        else
            if "Document Type" = "Document Type"::Order then begin
                if recServiceItem.FindFirst() then
                    repeat
                        InsertServiceLine(enumServiceDocument::Order);
                    until recServiceItem.Next() = 0;
            end;
        MESSAGE('Record has been created');

    end;

    procedure InsertServiceLine(DocumentTypeVar: Enum "Service Document Type")

    begin
        ServiceItemLine.INIT;
        ServiceItemLine."Document Type" := DocumentTypeVar;
        ServiceItemLine."Document No." := "No.";
        ServiceItemLine."Line No." := LineNo;
        ServiceItemLine."Customer No." := "Customer No.";
        ServiceItemLine.Validate("Service Item No.", recServiceItem."No.");
        ServiceItemLine.Validate("Service Item Group Code", recServiceItem."Service Item Group Code");
        ServiceItemLine."Item No." := recServiceItem."Item No.";
        ServiceItemLine."Serial No." := recServiceItem."Serial No.";
        ServiceItemLine.Description := recServiceItem.Description;
        ServiceItemLine."Description 2" := recServiceItem."Description 2";
        ServiceItemLine.Priority := recServiceItem.Priority;
        ServiceItemLine."Service Interval" := recServiceItem."Service Interval";
        ServiceItemLine."Next Service Date" := recServiceItem."Next Service Date";
        IF ServiceItemLine.INSERT THEN;
        LineNo := LineNo + 10000;
    end;

    procedure CreateSalesOrderFromService(ServiceOrderRec: Record "Service Header")
    var
        SalesHeaderrec: Record "Sales Header";
        SalesLinerec: Record "Sales Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ServiceLinerec: Record "Service Line";
    begin
        SalesHeaderrec.Init();
        SalesHeaderrec."Document Type" := SalesHeaderrec."Document Type"::Order;
        NoSeriesMgt.InitSeries('S-ORD-SHP', SalesHeaderrec."No. Series", SalesHeaderrec."Posting Date", SalesHeaderrec."No.", SalesHeaderrec."No. Series");
        SalesHeaderrec.Validate("Sell-to Customer No.", ServiceOrderRec."Customer No.");
        SalesHeaderrec.Validate("Ship-to Address", ServiceOrderRec."Ship-to Address");
        SalesHeaderrec.Insert(true);

        SalesLinerec.Init();
        SalesLinerec."Document Type" := SalesLinerec."Document Type"::Order;
        SalesLinerec."Document No." := SalesHeaderrec."No.";
        SalesLinerec."Line No." := GetLastLineNo(SalesHeaderrec."No.");
        SalesLinerec.Type := SalesLinerec.Type::Resource;
        SalesLinerec."No." := ':Shipping';
        SalesLinerec.Insert(true);

        ServiceLinerec.reset;
        ServiceLinerec.SetRange(ServiceLinerec."Document Type", ServiceLinerec."Document Type"::Order);
        ServiceLinerec.SetRange("Document No.", "No.");
        if ServiceLinerec.FindSet() then
            repeat
                SalesLinerec.Init();
                SalesLinerec."Document Type" := SalesLinerec."Document Type"::Order;
                SalesLinerec."Document No." := SalesHeaderrec."No.";
                SalesLinerec."Line No." := GetLastLineNo(SalesHeaderrec."No.");
                SalesLinerec.Type := SalesLinerec.Type::" ";
                SalesLinerec.Description := ServiceLinerec."No." + ServiceLinerec.Description;
                SalesLinerec.Insert(true);
            until ServiceLinerec.Next() = 0;
    end;

    procedure GetLastLineNo(DocNo: Code[20]) LineNo: Integer
    var
        recSalesLine: Record "Sales Line";
    begin
        recSalesLine.Reset;
        recSalesLine.SetRange(recSalesLine."Document Type", recSalesLine."Document Type"::Order);
        recSalesLine.SetRange("Document No.", DocNo);
        if recSalesLine.FindLast then
            exit(recSalesLine."Line No." + 10000)
    end;


}