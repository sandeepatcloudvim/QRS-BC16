pageextension 50016 ExtendServiceItemWorksheetSub extends "Service Item Worksheet Subform"
{
    Caption = 'Service Item Worksheet Lines';
    layout
    {
        addbefore(Type)
        {
            field("Service Item No."; "Service Item No.")
            {
                ApplicationArea = Service;
                Caption = 'Service Item No.';
                ToolTip = 'Specifies the Service Item No.';
            }
        }

        addafter(Description)
        {
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
            field("Customer Ref No"; "Customer Ref No")
            {
                ApplicationArea = All;
                Caption = 'Customer Ref No.';
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

}