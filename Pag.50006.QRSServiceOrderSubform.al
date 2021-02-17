pageextension 50006 QRSServiceOrderExt extends "Service Order Subform"
{
    layout
    {
        addafter(Warranty)
        {
            field("Service Interval"; "Service Interval")
            {
                ApplicationArea = All;
                Caption = 'Service Interval';
                Editable = false;
            }
            field("Next Service Date"; "Next Service Date")
            {
                ApplicationArea = All;
                Caption = 'Next Service Date';
                Editable = false;
            }
        }
        addafter("Serial No.")
        {
            field("QRS Mnfg ItemNo"; "QRS Mnfg ItemNo")
            {
                ApplicationArea = All;
            }
            field("QRS Mnfg Name"; "QRS Mnfg Name")
            {
                ApplicationArea = All;
            }
            field("Customer Ref No"; "Customer Ref No")
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        addbefore("Service Item Worksheet")
        {
            action(CreateServiceItems)
            {
                ApplicationArea = Service;
                Caption = 'Add to &Service Item Worksheet';
                Image = ServiceItemWorksheet;
                //ToolTip = 'View or edit information about service items, such as repair status, fault comments and codes, and cost. In this window, you can update information on the items such as repair status and fault and resolution codes. You can also enter new service lines for resource hours, for the use of spare parts and for specific service costs.';

                trigger OnAction()
                var
                begin
                    CreateServiceItemLine();
                    CreateServiceItemLineConsumbles();
                end;
            }

            action(AllServiceItemWorksheet)
            {
                ApplicationArea = Service;
                Caption = 'All Service Item Worksheet';
                Image = ServiceItemWorksheet;
                trigger OnAction()
                begin
                    ShowAllServOrderWorksheet();
                end;

            }
        }
    }
    procedure ShowAllServOrderWorksheet()
    var
        ServItemLine: Record "Service Line";
    begin
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");

        CLEAR(ServItemLine);
        ServItemLine.SETCURRENTKEY("Service Item No.");
        ServItemLine.SETRANGE("Document Type", "Document Type");
        ServItemLine.SETRANGE("Document No.", "Document No.");
        ServItemLine.FILTERGROUP(2);
        PAGE.RUNMODAL(PAGE::"Service Item Worksheet Subform", ServItemLine);
        ServItemLine.FILTERGROUP(0);
    end;

    local procedure CreateServiceItemLine()
    var
        ServiceLine: Record "Service Line";
        LastLineNoService: Record "Service Line";
        LineNo: Integer;
        ServiceItemLine: Record "Service Item Line";
        enumServiceDocument: Enum "Service Document Type";
    begin
        ServiceItemLine.RESET;
        ServiceItemLine.SETRANGE("Document Type", ServiceItemLine."Document Type"::Order);
        ServiceItemLine.SETRANGE("Document No.", "Document No.");
        ServiceItemLine.SetFilter("Item No.", '<>%1', '');
        IF NOT ServiceItemLine.FINDSET THEN
            ERROR('There is no record found to process');

        IF ServiceItemLine.FINDFIRST THEN
            REPEAT
                ServiceLine.reset;
                ServiceLine.SetRange("Document Type", ServiceLine."Document Type"::Order);
                ServiceLine.SetRange("Document No.", ServiceItemLine."Document No.");
                ServiceLine.SetRange("Customer No.", ServiceItemLine."Customer No.");
                ServiceLine.SetRange("Service Item No.", ServiceItemLine."Service Item No.");
                if not ServiceLine.FindFirst() then begin
                    ServiceLine.INIT;
                    ServiceLine."Document Type" := enumServiceDocument::Order;
                    ServiceLine."Document No." := ServiceItemLine."Document No.";
                    ServiceLine."Customer No." := ServiceItemLine."Customer No.";
                    ServiceLine."Line No." := GetLastItemNo(enumServiceDocument::Order);
                    ServiceLine.Type := ServiceLine.Type::Item;
                    ServiceLine.VALIDATE("No.", ServiceItemLine."Item No.");
                    ServiceLine."Service Item No." := ServiceItemLine."Service Item No.";
                    ServiceLine.VALIDATE("Service Item Line No.", ServiceItemLine."Line No.");
                    ServiceLine.VALIDATE(Quantity, 1);
                    ServiceLine."Location Code" := ServiceItemLine."Location of Service Item";
                    ServiceLine."QRS Mnfg ItemNo" := ServiceItemLine."QRS Mnfg ItemNo";
                    ServiceLine."QRS Mnfg Name" := ServiceItemLine."QRS Mnfg Name";
                    ServiceLine."Customer Ref No" := ServiceItemLine."Customer Ref No";
                    ServiceLine.Insert;
                end
            UNTIL ServiceItemLine.NEXT = 0;
        MESSAGE('Record has been created');
    end;

}