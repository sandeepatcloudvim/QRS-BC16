pageextension 50021 QRSServiceQuotelist extends "Service Quotes"
{
    layout
    {


    }

    actions
    {
        addafter("Make &Order")
        {
            action("Service Quote Line Status")
            {
                ApplicationArea = All;
                Image = ServiceLines;
                Caption = 'Service Quote Line Status';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Service Quote Item Status";
            }
        }
    }
}