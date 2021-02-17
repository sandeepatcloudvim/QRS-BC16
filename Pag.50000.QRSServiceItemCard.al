pageextension 50000 QRSServiceItemCard extends "Service Item Card"
{
    layout
    {
        addafter("Item Description")
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
            }

        }
        addafter("Last Service Date")
        {
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
        }
        addafter(Priority)
        {
            field("Service Interval"; "Service Interval")
            {
                ApplicationArea = All;
                Caption = 'Service Interval';
            }
        }
        addafter("Last Service Date")
        {
            field("Next Service Date"; "Next Service Date")
            {
                ApplicationArea = All;
                Caption = 'Next Service Date';
            }
        }
    }

    actions
    {
    }
}