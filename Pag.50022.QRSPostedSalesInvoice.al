pageextension 50022 ExtendPostedSalesInvoice extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Print)
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
                    REPORT.RUN(50017, TRUE, FALSE, Rec);
                    RESET;
                end;
            }
        }
    }

    var
        myInt: Integer;
}