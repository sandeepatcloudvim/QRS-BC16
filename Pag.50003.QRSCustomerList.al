pageextension 50003 QRSCustomerList extends "Customer List"
{
    layout
    {

        addafter("Location Code")
        {
            field(County; County)
            {
                ApplicationArea = All;
                Caption = 'State';
            }
            field("Shop Hours"; "Shop Hours")
            {
                ApplicationArea = All;
            }
            field("Parking Instructions"; "Parking Instructions")
            {
                ApplicationArea = All;
            }
            field("Vendor Credentials"; "Vendor Credentials")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 1 Code"; "Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; "Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }

        }
        addafter(Contact)
        {
            field(Department; Department)
            {
                ApplicationArea = All;
            }

            field("Location Desc"; "Location Desc")
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
    }
}