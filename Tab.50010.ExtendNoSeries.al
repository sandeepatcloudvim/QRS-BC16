tableextension 50010 ExtendNoSeries extends "No. Series"
{
    fields
    {
        field(50000; "Related Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Related Series';
            TableRelation = "No. Series";
        }
    }

    var
        myInt: Integer;
}