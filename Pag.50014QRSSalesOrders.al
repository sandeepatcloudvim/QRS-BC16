pageextension 50014 QRSSalesOrder extends "Sales Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Print Confirmation")
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
                    REPORT.RUN(50002, TRUE, FALSE, Rec);
                    RESET;
                end;
            }
        }
    }

    var
        myInt: Integer;
}