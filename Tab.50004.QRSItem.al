tableextension 50004 ExtendItem extends Item
{
    fields
    {
        field(50000; Model; Text[50])
        {
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
        }

    }

    var
        myInt: Integer;
}