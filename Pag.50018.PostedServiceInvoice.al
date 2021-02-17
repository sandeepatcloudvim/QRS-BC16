pageextension 50018 ExtendPostedServiceInvoice extends "Posted Service Invoice"
{
    layout
    {
        addafter("Responsibility Center")
        {
            field("Package ID No."; "Package ID No.")
            {
                ApplicationArea = All;
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
        addafter("S&end")
        {
            action("Print Summary")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print Summary Invoice';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                begin
                    CurrPage.SETSELECTIONFILTER(Rec);
                    REPORT.RUN(50013, TRUE, FALSE, Rec);
                    RESET;
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
                trigger OnAction()
                begin
                    CurrPage.SETSELECTIONFILTER(Rec);
                    REPORT.RUN(50016, TRUE, FALSE, Rec);
                    RESET;
                end;
            }
        }
    }

    var
        myInt: Integer;


}