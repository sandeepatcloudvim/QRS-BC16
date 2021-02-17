pageextension 50004 QRSServiceOrder extends "Service Order"
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
            field("External Vendor"; "External Vendor")
            {
                ApplicationArea = All;
                Caption = 'External Vendor';
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
        }

        addafter("Service Order Type")
        {
            field("PO Number"; "PO Number")
            {
                ApplicationArea = All;
            }
            field("PO Amount"; "PO Amount")
            {
                ApplicationArea = All;
            }
            field("PO Line No"; "PO Line No")
            {
                ApplicationArea = All;
            }
            field("Cost Center Code"; "Cost Center Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Service Order Type")
        {
            field("Service Days"; "Service Days")
            {
                ApplicationArea = All;
                Caption = 'Service Days';
            }
            field("Package ID No."; "Package ID No.")
            {
                ApplicationArea = All;
                Caption = 'Package ID No.';
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
        addafter("Co&mments")
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
                    If Dialog.Confirm('Would you like to copy all Service Items from this customer into this service order which are due to be services in the next %1 days ?', true, "Service Days") then
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
                    REPORT.RUN(50006, TRUE, FALSE, Rec);
                    RESET;
                end;
            }
        }
        addafter("Copy from Service Items")
        {
            action("Create Ship Order")
            {
                ApplicationArea = Service;
                Caption = 'Create Ship Order';
                Image = ServiceItem;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    If Dialog.Confirm('Would you like to create a Sales Order based on a selected Service order ?', true) then
                        CreateSalesOrderFromService(Rec);
                end;
            }
        }
    }


}