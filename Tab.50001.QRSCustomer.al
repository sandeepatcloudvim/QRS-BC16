tableextension 50001 QRSCustomer extends Customer
{
    fields
    {
        field(50000; "Parking Instructions"; text[200])
        {
            Caption = 'Parking Instructions';
            DataClassification = CustomerContent;
        }

        field(50001; "Shop Hours"; text[50])
        {
            Caption = 'Shop Hours';
            DataClassification = CustomerContent;
        }
        field(50002; "Vendor Credentials"; text[50])
        {
            Caption = 'Vendor Credentials';
            DataClassification = CustomerContent;
        }
        field(50003; Department; text[50])
        {
            Caption = 'Department';
            DataClassification = CustomerContent;
        }
        field(50004; "Location Desc"; text[50])
        {
            Caption = 'Location Desc';
            DataClassification = CustomerContent;
        }



    }

}