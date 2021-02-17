page 50020 "Service Quote Item Status"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Item Line";
    SourceTableView = WHERE("Document Type" = CONST(Quote));
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
                field(ServiceQuoteNo; "Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'Service Quote No ';
                    trigger OnDrillDown()
                    var
                        serviceorder: Record "Service Header";
                    begin
                        if serviceorder.get("Document Type"::Quote, "Document No.") then
                            Page.RunModal(Page::"Service Quote", serviceorder);
                    end;

                }
                field("Service Quote Date"; recServiceOrder."Document Date")
                {
                    ApplicationArea = All;
                    Caption = 'Service Quote Date';
                }
                field("Service Item No."; "Service Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'Service Item No.';

                }

                field("QRS Mnfg Name"; "QRS Mnfg Name")
                {
                    ApplicationArea = All;
                    Caption = 'Mnfg Name';
                }
                field("QRS Mnfg ItemNo"; "QRS Mnfg ItemNo")
                {
                    ApplicationArea = All;
                    Caption = 'Mnfg Item No.';
                }
                field("Customer Ref No"; "Customer Ref No")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Ref No';
                }

                field(ServiceDescription; recServiceItem.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Service Description';
                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = All;
                    Caption = 'Serial No.';
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
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
        if recServiceOrder.Get("Document Type"::Quote, "Document No.") then;
        if recServiceItem.get("Service Item No.") then;
    end;

    var
        recServiceOrder: Record "Service Header";

        recServiceItem: Record "Service Item";

        ServiceDescription: Text[100];
}