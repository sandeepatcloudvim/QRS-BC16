pageextension 50013 QRSSalesQuotesList extends "Sales Quotes"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(AttachAsPDF)
        {
            action("Print With Discounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print With Discounts';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    CurrPage.SETSELECTIONFILTER(Rec);
                    REPORT.RUN(50001, TRUE, FALSE, Rec);
                    RESET;
                end;
            }
        }
    }

    var
        myInt: Integer;
}