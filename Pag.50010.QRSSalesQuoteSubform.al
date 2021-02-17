pageextension 50010 ExtendSalesQuoteSubform extends "Sales Quote Subform"
{
    layout
    {
        addafter("Tax Group Code")
        {
            field("Lead Time"; "Lead Times")
            {
                ApplicationArea = All;
                Caption = 'Lead Time';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}