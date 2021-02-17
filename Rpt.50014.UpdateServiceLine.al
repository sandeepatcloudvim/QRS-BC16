report 50014 "Update Service Line"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;


    dataset
    {
        dataitem("Service Line"; "Service Line")
        {

            trigger OnAfterGetRecord()
            var
                ServiceItemrec: Record "Service Item";
            begin
                if ServiceItemrec.Get("Service Item No.") then begin
                    "Service Line"."QRS Mnfg ItemNo" := ServiceItemrec."QRS Mnfg ItemNo";
                    "Service Line"."QRS Mnfg Name" := ServiceItemrec."QRS Mnfg Name";
                    "Service Line"."Customer Ref No" := ServiceItemrec."Customer Ref No";
                    "Service Line".Modify();
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;


}