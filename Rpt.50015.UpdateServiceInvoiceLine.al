report 50015 "Update Service Invoice Line"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;


    dataset
    {
        dataitem("Service Invoice Line"; "Service Invoice Line")
        {

            trigger OnAfterGetRecord()
            var
                ServiceItemrec: Record "Service Item";
            begin
                if ServiceItemrec.Get("Service Item No.") then begin
                    "Service Invoice Line"."QRS Mnfg ItemNo" := ServiceItemrec."QRS Mnfg ItemNo";
                    "Service Invoice Line"."QRS Mnfg Name" := ServiceItemrec."QRS Mnfg Name";
                    "Service Invoice Line"."Customer Ref No" := ServiceItemrec."Customer Ref No";
                    "Service Invoice Line".Modify();
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