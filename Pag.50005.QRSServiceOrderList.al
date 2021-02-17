pageextension 50005 QRSServiceOrderlist extends "Service Orders"
{
    layout
    {
        addafter("Location Code")
        {
            field("External Vendor"; "External Vendor")
            {
                ApplicationArea = All;
            }
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

    }

    actions
    {
        addafter(Invoices)
        {
            action("Service Order Line Status")
            {
                ApplicationArea = All;
                Image = ServiceLines;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Service Order Item Status";
            }
            action("Update Service Line")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Update Service Line';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';
                RunObject = report "Update Service Line";
            }
            action("Update Service Invoice Line")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Update Service Invoice Line';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';
                RunObject = report "Update Service Invoice Line";
            }
        }
    }
}