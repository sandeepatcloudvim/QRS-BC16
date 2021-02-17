page 50017 "Service Order Item Status"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Item Line";
    SourceTableView = WHERE("Document Type" = CONST(Order));
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(CustomerNo; recServiceOrder."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
                field(CustomerName; recServiceOrder.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                }
                field(ServiceOrderNo; "Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'Service Order No ';
                    trigger OnDrillDown()
                    var
                        serviceorder: Record "Service Header";
                    begin
                        if serviceorder.get("Document Type"::Order, "Document No.") then
                            Page.RunModal(Page::"Service Order", serviceorder);
                    end;

                }
                field("Service Order Type"; recServiceOrder."Service Order Type")
                {
                    ApplicationArea = All;
                    Caption = 'Service Order Type ';
                }
                field("PO Number"; recServiceOrder."PO Number")
                {
                    ApplicationArea = All;
                    Caption = 'PO Number';
                }
                field("Service Item No."; "Service Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'Service Item No.';
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
                }
                field("QRS Mnfg ItemNo"; "QRS Mnfg ItemNo")
                {
                    ApplicationArea = All;
                    Caption = 'Mnfg Item No.';
                }
                field("QRS Mnfg Name"; "QRS Mnfg Name")
                {
                    ApplicationArea = All;
                    Caption = 'Mnfg Name';
                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = All;
                    Caption = 'Serial No.';
                }
                field("Customer Ref No"; "Customer Ref No")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Ref No';
                }
                field("External Vendor"; recServiceOrder."External Vendor")
                {
                    ApplicationArea = All;
                    Caption = 'External Vendor';
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }


    trigger OnAfterGetRecord()
    begin
        if recServiceOrder.Get("Document Type"::Order, "Document No.") then;
    end;

    var
        recServiceOrder: Record "Service Header";
}