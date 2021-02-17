pageextension 50007 QRSServiceQuote extends "Service Quote"
{
    layout
    {
        addafter("Assigned User ID")
        {
            field(ParkingInstructions; "Parking Instructions")
            {
                Caption = 'Parking Instructions';
                ApplicationArea = All;
                Editable = false;
            }
            field(ShopHours; "Shop Hours")
            {
                Caption = 'Shop Hours';
                ApplicationArea = All;
                Editable = false;
            }
            field(VendorCredentials; "Vendor Credentials")
            {
                Caption = 'Vendor Credentials';
                ApplicationArea = All;
                Editable = false;
            }
            field(Department; Department)
            {
                Caption = 'Department';
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
            field("Location Desc"; "Location Desc")
            {
                Caption = 'Location Desc';
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
            field("Customer PO No."; "Customer PO No.")
            {
                Caption = 'Customer PO No.';
                ApplicationArea = All;
            }

        }

    }

    actions
    {
        addafter("Make &Order")
        {
            action("Copy from Service Items")
            {
                ApplicationArea = Service;
                Caption = 'Copy from Service Items';
                Image = ServiceItem;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    If Dialog.Confirm('Would you like to copy all Service Items from this customer into this service quote ?', true) then
                        CreateServiceItemLine();
                end;
            }
        }
        addafter("&Print")
        {
            action("Print With Discounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print With Discounts';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    CurrPage.SETSELECTIONFILTER(Rec);
                    REPORT.RUN(50007, TRUE, FALSE, Rec);
                    RESET;
                end;
            }
        }
    }

    var
        myInt: Integer;

}