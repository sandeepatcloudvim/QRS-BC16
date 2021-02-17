pageextension 50008 QRSServiceItemList extends "Service Item List"
{
    layout
    {
        addafter("Description")
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
            field("QRS Shelf Loc"; "QRS Shelf Loc")
            {
                ApplicationArea = All;
                Caption = 'Shelf Loc';
            }
            field("Customer Ref No"; "Customer Ref No")
            {
                ApplicationArea = All;
                Caption = 'Customer Ref No.';
            }
            field("Consumables 1"; "Consumables 1")
            {
                ApplicationArea = All;
                Caption = 'Consumables 1';
            }
            field("Consumables 2"; "Consumables 2")
            {
                ApplicationArea = All;
                Caption = 'Consumables 2';
            }
            field("Service Interval"; "Service Interval")
            {
                ApplicationArea = All;
                Caption = 'Service Interval';
            }
            field("Next Service Date"; "Next Service Date")
            {
                ApplicationArea = All;
                Caption = 'Next Service Date';
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