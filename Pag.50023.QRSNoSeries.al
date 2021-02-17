pageextension 50023 ExtendNoSeries extends "No. Series"
{
    layout
    {
        addafter(Description)
        {
            field("Related Series"; "Related Series")
            {
                ApplicationArea = All;
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