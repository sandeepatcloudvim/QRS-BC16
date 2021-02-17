pageextension 50001 QRSServiceItems extends "Service Items"
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
        }
        addafter("Customer No.")
        {
            field("Customer Ref No"; "Customer Ref No")
            {
                ApplicationArea = All;
                Caption = 'Customer Ref No.';
            }
        }



    }

    actions
    {
    }
}