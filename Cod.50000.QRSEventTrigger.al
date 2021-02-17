codeunit 50000 "Event Trigger"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Service Header", 'OnAfterCopyCustomerFields', '', true, true)]
    local procedure CopyFromCustomerToService(VAR ServiceHeader: Record "Service Header"; Customer: Record Customer)
    begin
        ServiceHeader."Parking Instructions" := Customer."Parking Instructions";
        ServiceHeader."Shop Hours" := Customer."Shop Hours";
        ServiceHeader."Vendor Credentials" := Customer."Vendor Credentials";
        ServiceHeader."Location Desc" := Customer."Location Desc";
        ServiceHeader.Department := Customer.Department;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Service-Post", 'OnAfterPostWithLines', '', true, true)]
    local procedure UpdateNextServiceDate(VAR PassedServiceHeader: Record "Service Header")
    var
        recServiceItemLine: Record "Service Item Line";
        recServiceItem: Record "Service Item";
    begin
        recServiceItemLine.reset;
        recServiceItemLine.SetRange("Document Type", recServiceItemLine."Document Type"::Order);
        recServiceItemLine.SetRange("Document No.", PassedServiceHeader."No.");
        if recServiceItemLine.FindFirst() then
            repeat
                if recServiceItem.Get(recServiceItemLine."Service Item No.") then begin
                    recServiceItem."Next Service Date" := CALCDATE(recServiceItemLine."Service Interval", PassedServiceHeader."Posting Date");
                    recServiceItem.Modify(false);
                end;
            until recServiceItemLine.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Service Item Line", 'OnAfterSetServItemInfo', '', true, true)]
    local procedure UpdateCustomiseFields(VAR ServiceItemLine: Record "Service Item Line"; xServiceItemLine: Record "Service Item Line"; ServiceItem: Record "Service Item")
    begin
        ServiceItemLine."QRS Mnfg ItemNo" := ServiceItem."QRS Mnfg ItemNo";
        ServiceItemLine."QRS Mnfg Name" := ServiceItem."QRS Mnfg Name";
        ServiceItemLine."Customer Ref No" := ServiceItem."Customer Ref No";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Quote to Order", 'OnBeforeInsertSalesOrderHeader', '', true, true)]
    local procedure UpdateUserDefinedSerialNo(VAR SalesOrderHeader: Record "Sales Header"; SalesQuoteHeader: Record "Sales Header")
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Record "No. Series";
    begin
        NoSeries.Reset();
        NoSeries.SetRange(Code, SalesOrderHeader."No. Series");
        if NoSeries.FindFirst() then
            NoSeriesMgt.InitSeries(NoSeries."Related Series", SalesOrderHeader."No. Series", SalesOrderHeader."Posting Date", SalesOrderHeader."No.", SalesOrderHeader."No. Series")
    end;
}