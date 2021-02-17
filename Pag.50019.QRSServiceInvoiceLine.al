pageextension 50019 ExtendPostedServiceInvSubForm extends "Posted Service Invoice Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field(Mnfg_Name; MnfgItemName)
            {
                ApplicationArea = All;
                Caption = 'Manufacturer';
            }
            field(Mnfg_ItemNo; MnfgItemNo)
            {
                ApplicationArea = All;
                Caption = 'Mnfg Item No.';
            }
            field(CustomerRefNo; CustomerRefNo)
            {
                ApplicationArea = All;
                Caption = 'Customer Ref No';
            }
            field(SerialNo; SerialNo)
            {
                ApplicationArea = All;
                Caption = 'Serial No.';
            }
            field("Service Item Line Description"; "Service Item Line Description")
            {
                ApplicationArea = All;
                Caption = 'Service Item Line Description';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

        recServiceItem: Record "Service Item";
        MnfgItemNo: Text[50];
        MnfgItemName: Text[50];
        CustomerRefNo: Text[30];
        SerialNo: Code[30];

    trigger OnAfterGetRecord()
    begin
        Clear(MnfgItemName);
        Clear(MnfgItemNo);
        Clear(CustomerRefNo);
        Clear(SerialNo);
        //CV_SSV>>
        if recServiceItem.Get("Service Item No.") then;
        if Type = Type::Item then begin
            MnfgItemName := recServiceItem."QRS Mnfg Name";
            MnfgItemNo := recServiceItem."QRS Mnfg ItemNo";
            CustomerRefNo := recServiceItem."Customer Ref No";
            SerialNo := recServiceItem."Serial No.";

        end;
        //CV_SSV<<
    end;
}