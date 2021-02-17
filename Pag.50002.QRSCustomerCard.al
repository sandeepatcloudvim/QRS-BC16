pageextension 50002 QRSCustomerCard extends "Customer Card"
{
    layout
    {

        addafter("Document Sending Profile")
        {

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

        }
        addafter("Vendor Credentials")
        {
            field(Department; Department)
            {
                ApplicationArea = All;
            }

            field("Location Desc"; "Location Desc")
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

    }

    actions
    {
    }
}