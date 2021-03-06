report 50006 "Service Order With Discount"
{
    DefaultLayout = Word;
    RDLCLayout = './ServiceOrderQRS.rdlc';
    WordLayout = './QRSServiceOrder.docx';
    PreviewMode = PrintLayout;
    Caption = 'Service Order';


    dataset
    {
        dataitem("Service Header"; "Service Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Customer No.";

            column(Service_Header_Document_Type; "Document Type")
            {
            }
            column(No_ServHeader; "No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(CompanyInfo_Picture; CompanyInfo.Picture)
                    {
                    }
                    column(CompanyInfo1_Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo2_Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(Service_Header___Contract_No__; "Service Header"."Contract No.")
                    {
                    }
                    column(Service_Header___Order_Time_; "Service Header"."Order Time")
                    {
                    }
                    column(PackageIDNo; "Service Header"."Package ID No.")
                    {
                    }
                    column(CustomerPONo; "Service Header"."Customer PO No.")
                    {
                    }
                    column(BillToAddr_1_; BillToAddr[1])
                    {
                    }
                    column(BillToAddr_2_; BillToAddr[2])
                    {
                    }
                    column(BillToAddr_3_; BillToAddr[3])
                    {
                    }
                    column(BillToAddr_4_; BillToAddr[4])
                    {
                    }
                    column(BillToAddr_5_; BillToAddr[5])
                    {
                    }
                    column(BillToAddr_6_; BillToAddr[6])
                    {
                    }
                    column(BillToAddr_7_; BillToAddr[7])
                    {
                    }
                    column(BillToAddr_8_; BillToAddr[8])
                    {
                    }
                    column(CustAddr_6_; CustAddr[6])
                    {
                    }
                    column(CustAddr_5_; CustAddr[5])
                    {
                    }
                    column(CustAddr_4_; CustAddr[4])
                    {
                    }
                    column(Service_Header___Order_Date_; Format("Service Header"."Order Date"))
                    {
                    }
                    column(CustAddr_3_; CustAddr[3])
                    {
                    }
                    column(Service_Header__Status; "Service Header".Status)
                    {
                    }
                    column(CustAddr_2_; CustAddr[2])
                    {
                    }
                    column(Service_Header___No__; "Service Header"."No.")
                    {
                    }
                    column(CustAddr_1_; CustAddr[1])
                    {
                    }
                    column(CompanyAddr_6_; CompanyAddr[6])
                    {
                    }
                    column(CompanyAddr_5_; CompanyAddr[5])
                    {
                    }
                    column(Service_Header___Bill_to_Name_; "Service Header"."Bill-to Name")
                    {
                    }
                    column(Service_Header___Contact; "Service Header"."Bill-to Contact")
                    {

                    }
                    column(Service_Header___Bill_to_Address; "Service Header"."Bill-to Address")
                    {
                    }
                    column(Service_Header___City; "Service Header"."Bill-to City")
                    {

                    }
                    column(Service_Header___CountryRegion; "Service Header"."Bill-to Country/Region Code")
                    {

                    }
                    column(Service_Header___Country; "Service Header"."Bill-to County")
                    {

                    }
                    column(Service_Header__ZipCode; "Service Header"."Bill-to Post Code")
                    {

                    }
                    column(Service_Header_Date; Format("Service Header"."Document Date"))
                    {

                    }
                    column(PaymentTerms; PaymentTerms.Description)
                    {

                    }
                    column(CompanyAddr_4_; CompanyAddr[4])
                    {
                    }
                    column(CompanyAddr_3_; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddr_2_; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr_1_; CompanyAddr[1])
                    {
                    }
                    column(STRSUBSTNO_Text001_CopyText_; StrSubstNo(Text001, CopyText))
                    {
                    }

                    column(CompanyInfo__Phone_No__; CompanyInfo."Phone No.")
                    {
                    }
                    column(CompanyInfo__Fax_No__; CompanyInfo."Fax No.")
                    {
                    }
                    column(Service_Header___Phone_No__; "Service Header"."Phone No.")
                    {
                    }
                    column(Service_Header___E_Mail_; "Service Header"."E-Mail")
                    {
                    }
                    column(Service_Header__Description; "Service Header".Description)
                    {
                    }
                    column(PageCaption; StrSubstNo(Text002, ' '))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PageLoop_Number; Number)
                    {
                    }
                    column(Contract_No_Caption; Contract_No_CaptionLbl)
                    {
                    }
                    column(Service_Header___Order_Time_Caption; "Service Header".FieldCaption("Order Time"))
                    {
                    }
                    column(Service_Header___Order_Date_Caption; Service_Header___Order_Date_CaptionLbl)
                    {
                    }
                    column(Service_Header__StatusCaption; "Service Header".FieldCaption(Status))
                    {
                    }
                    column(Service_Header___No__Caption; "Service Header".FieldCaption("No."))
                    {
                    }
                    column(Invoice_toCaption; Invoice_toCaptionLbl)
                    {
                    }
                    column(CompanyInfo__Phone_No__Caption; CompanyInfo__Phone_No__CaptionLbl)
                    {
                    }
                    column(CompanyInfo__Fax_No__Caption; CompanyInfo__Fax_No__CaptionLbl)
                    {
                    }
                    column(Service_Header___Phone_No__Caption; Service_Header___Phone_No__CaptionLbl)
                    {
                    }
                    column(Service_Header___E_Mail_Caption; Service_Header___E_Mail_CaptionLbl)
                    {
                    }
                    column(Service_Header__DescriptionCaption; "Service Header".FieldCaption(Description))
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimText_Control11; DimText)
                        {
                        }
                        column(DimensionLoop1_Number; Number)
                        {
                        }
                        column(Header_DimensionsCaption; Header_DimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry1.Find('-') then
                                    CurrReport.Break;
                            end else
                                if not Continue then
                                    CurrReport.Break;

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo(
                                        '%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1, %2 %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next = 0;
                        end;
                    }
                    dataitem("Service Order Comment"; "Service Comment Line")
                    {
                        DataItemLink = "Table Subtype" = FIELD("Document Type"), "No." = FIELD("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = SORTING("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") WHERE("Table Name" = CONST("Service Header"), Type = CONST(General));
                        column(Service_Order_Comment_Comment; Comment)
                        {
                        }
                        column(ServiceOrderComment_TabName; "Table Name")
                        {
                        }
                        column(Service_Order_Comment_Table_Subtype; "Table Subtype")
                        {
                        }
                        column(Service_Order_Comment_No_; "No.")
                        {
                        }
                        column(Service_Order_Comment_Type; Type)
                        {
                        }
                        column(Service_Order_Comment_Table_Line_No_; "Table Line No.")
                        {
                        }
                        column(Service_Order_Comment_Line_No_; "Line No.")
                        {
                        }
                    }
                    dataitem("Service Item Line"; "Service Item Line")
                    {
                        DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                        column(Service_Item_Line___Line_No__; "Service Item Line"."Line No.")
                        {
                        }
                        column(SerialNo_ServItemLine; "Serial No.")
                        {
                        }
                        column(Service_Item_Line_Description; Description)
                        {
                        }
                        column(Service_Item_Line__Service_Item_No__; "Service Item No.")
                        {
                        }

                        column(ServiceItem_Manufacurer; "QRS Mnfg Name")
                        {

                        }
                        column(Service_Item_Item_No_; "Item No.")
                        {

                        }
                        column(ServItemGroupCode_ServItemLine; "Service Item Group Code")
                        {
                        }
                        column(Service_Item_Line_Warranty; Format(Warranty))
                        {
                        }
                        column(Service_Item_Line__Loaner_No__; "Loaner No.")
                        {
                        }
                        column(Service_Item_Line__Repair_Status_Code_; "Repair Status Code")
                        {
                        }
                        column(Service_Item_Line__Service_Shelf_No__; "Service Shelf No.")
                        {
                        }
                        column(Service_Item_Line__Response_Time_; Format("Response Time"))
                        {
                        }
                        column(Service_Item_Line__Response_Date_; Format("Response Date"))
                        {
                        }
                        column(Service_Item_Line_Document_Type; "Document Type")
                        {
                        }
                        column(ItemData; ItemData)
                        {

                        }
                        column(Service_Item_Line_Document_No_; "Document No.")
                        {
                        }
                        column(Service_Item_Line__Serial_No__Caption; FieldCaption("Serial No."))
                        {
                        }
                        column(Service_Item_Line_DescriptionCaption; FieldCaption(Description))
                        {
                        }
                        column(Service_Item_Line__Service_Item_No__Caption; FieldCaption("Service Item No."))
                        {
                        }
                        column(Service_Item_Line__Service_Item_Group_Code_Caption; FieldCaption("Service Item Group Code"))
                        {
                        }
                        column(Service_Item_Line_WarrantyCaption; CaptionClassTranslate(FieldCaption(Warranty)))
                        {
                        }
                        column(Service_Item_LinesCaption; Service_Item_LinesCaptionLbl)
                        {
                        }
                        column(Service_Item_Line__Loaner_No__Caption; FieldCaption("Loaner No."))
                        {
                        }
                        column(Service_Item_Line__Repair_Status_Code_Caption; FieldCaption("Repair Status Code"))
                        {
                        }
                        column(Service_Item_Line__Service_Shelf_No__Caption; FieldCaption("Service Shelf No."))
                        {
                        }
                        column(Service_Item_Line__Response_Date_Caption; Service_Item_Line__Response_Date_CaptionLbl)
                        {
                        }
                        column(Service_Item_Line__Response_Time_Caption; Service_Item_Line__Response_Time_CaptionLbl)
                        {
                        }
                        dataitem("Fault Comment"; "Service Comment Line")
                        {
                            DataItemLink = "Table Subtype" = FIELD("Document Type"), "No." = FIELD("Document No."), "Table Line No." = FIELD("Line No.");
                            DataItemTableView = SORTING("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") WHERE("Table Name" = CONST("Service Header"), Type = CONST(Fault));
                            column(Comment_FaultComment; Comment)
                            {
                            }
                            column(Fault_Comment_Table_Name; "Table Name")
                            {
                            }
                            column(Fault_Comment_Table_Subtype; "Table Subtype")
                            {
                            }
                            column(Fault_Comment_No_; "No.")
                            {
                            }
                            column(Fault_Comment_Type; Type)
                            {
                            }
                            column(Fault_Comment_Table_Line_No_; "Table Line No.")
                            {
                            }
                            column(Fault_Comment_Line_No_; "Line No.")
                            {
                            }
                            column(Fault_CommentsCaption; Fault_CommentsCaptionLbl)
                            {
                            }
                        }
                        dataitem("Resolution Comment"; "Service Comment Line")
                        {
                            DataItemLink = "Table Subtype" = FIELD("Document Type"), "No." = FIELD("Document No."), "Table Line No." = FIELD("Line No.");
                            DataItemTableView = SORTING("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") WHERE("Table Name" = CONST("Service Header"), Type = CONST(Resolution));
                            column(Comment_ResolutionComment; Comment)
                            {
                            }
                            column(Resolution_Comment_Table_Name; "Table Name")
                            {
                            }
                            column(Resolution_Comment_Table_Subtype; "Table Subtype")
                            {
                            }
                            column(Resolution_Comment_No_; "No.")
                            {
                            }
                            column(Resolution_Comment_Type; Type)
                            {
                            }
                            column(Resolution_Comment_Table_Line_No_; "Table Line No.")
                            {
                            }
                            column(Resolution_Comment_Line_No_; "Line No.")
                            {
                            }
                            column(Resolution_CommentsCaption; Resolution_CommentsCaptionLbl)
                            {
                            }
                        }
                    }
                    dataitem("Service Line"; "Service Line")
                    {
                        DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = SORTING("QRS Mnfg Name", "QRS Mnfg ItemNo", "Customer Ref No") order(ascending);
                        column(Service_Line___Line_No__; "Service Line"."Line No.")
                        {
                        }
                        column(Service_Line__Service_Item_Serial_No__; "Service Item Serial No.")
                        {
                        }
                        column(Type_ServLine; Type)
                        {
                        }
                        column(Service_Line__No__; "No.")
                        {
                        }
                        column(Manufacturer; MnfgName)
                        {
                        }
                        column(Model; recServiceItem."Item No.")
                        {
                        }
                        column(ModelName; DescriptionText)
                        {

                        }
                        column(SerialNo; SerialNoText)
                        {
                        }
                        column(QRS_Mnfg_ItemNo; MnfgItemNo)
                        {

                        }
                        column(QRS_Mnfg_Name; MnfgName)
                        {

                        }
                        column(Customer_Ref_No; CustomerRefNo)
                        {

                        }
                        column(Service_Line__Variant_Code_; "Variant Code")
                        {
                        }
                        column(Service_Line_Description; Description)
                        {
                        }
                        column(Qty; Qty)
                        {
                        }
                        column(UnitPrice_ServLine; FormatUnitPrice)
                        {
                        }
                        column(Line_Discount_; "Line Discount %")
                        {
                        }
                        column(Line_Discount_Amount; LineDiscountAmtFormat)
                        {

                        }
                        column(Amt; AmountFormat)
                        {
                        }
                        column(FormatTaxAmount; FormatTaxAmount)
                        {

                        }
                        column(Service_Line__Quantity_Consumed_; "Quantity Consumed")
                        {
                        }
                        column(Service_Line__Qty__to_Consume_; "Qty. to Consume")
                        {
                        }
                        column(Amt_Control63; Amt)
                        {
                        }
                        column(GrossAmt_Control65; GrossAmt)
                        {
                        }
                        column(Service_Line_Document_Type; "Document Type")
                        {
                        }
                        column(DocumentNo_ServLine; "Document No.")
                        {
                        }
                        column(Service_Line__Service_Item_Serial_No__Caption; FieldCaption("Service Item Serial No."))
                        {
                        }
                        column(Service_Line__No__Caption; FieldCaption("No."))
                        {
                        }
                        column(Service_Line_TypeCaption; FieldCaption(Type))
                        {
                        }
                        column(Service_Line__Variant_Code_Caption; FieldCaption("Variant Code"))
                        {
                        }
                        column(Service_Line_DescriptionCaption; FieldCaption(Description))
                        {
                        }
                        column(QtyCaption; QtyCaptionLbl)
                        {
                        }
                        column(Service_LinesCaption; Service_LinesCaptionLbl)
                        {
                        }
                        column(Service_Line__Unit_Price_Caption; FieldCaption("Unit Price"))
                        {
                        }
                        column(Service_Line__Line_Discount___Caption; FieldCaption("Line Discount %"))
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(Gross_AmountCaption; Gross_AmountCaptionLbl)
                        {
                        }
                        column(Service_Line__Quantity_Consumed_Caption; FieldCaption("Quantity Consumed"))
                        {
                        }
                        column(Service_Line__Qty__to_Consume_Caption; FieldCaption("Qty. to Consume"))
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText_Control13; DimText)
                            {
                            }
                            column(DimensionLoop2_Number; Number)
                            {
                            }
                            column(Line_DimensionsCaption; Line_DimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not DimSetEntry2.Find('-') then
                                        CurrReport.Break;
                                end else
                                    if not Continue then
                                        CurrReport.Break;

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo(
                                            '%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1, %2 %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.Next = 0;
                            end;

                            trigger OnPreDataItem()
                            begin

                                DimSetEntry2.SetRange("Dimension Set ID", "Service Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        var
                            ExchangeFactor: Decimal;
                            SalesTaxCalculate: Codeunit "Sales Tax Calculate";
                            TempSalesTaxAmountLine: Record "Sales Tax Amount Line" temporary;
                        begin
                            Clear(DescriptionText);
                            Clear(MnfgItemNo);
                            Clear(MnfgName);
                            Clear(CustomerRefNo);

                            if recServiceItem.GET("Service Line"."Service Item No.") then;

                            if Type = Type::Item then begin
                                if ItemRec.Get("No.") then begin
                                    if ItemRec.Type = ItemRec.Type::Inventory then begin
                                        DescriptionText := Description;
                                    end else begin
                                        DescriptionText := recServiceItem.Description;
                                    end;
                                end;
                            end else begin
                                DescriptionText := Description;
                            end;


                            if ShowQty = ShowQty::Quantity then begin
                                Qty := Quantity;
                                Amt := "Line Amount";
                                if "Service Header"."Currency Factor" = 0 then
                                    ExchangeFactor := 1
                                else
                                    ExchangeFactor := "Service Header"."Currency Factor";
                                SalesTaxCalculate.StartSalesTaxCalculation;
                                SalesTaxCalculate.AddServiceLine("Service Line");
                                SalesTaxCalculate.EndSalesTaxCalculation("Posting Date");
                                SalesTaxCalculate.GetSalesTaxAmountLineTable(TempSalesTaxAmountLine);
                                OnAfterCalculateSalesTax("Service Header", "Service Line", TempSalesTaxAmountLine);
                                GrossAmt := Amt + TempSalesTaxAmountLine.GetTotalTaxAmountFCY;
                            end else begin
                                if "Quantity Invoiced" = 0 then
                                    CurrReport.Skip;
                                Qty := "Quantity Invoiced";

                                Amt := Round((Qty * "Unit Price") * (1 - "Line Discount %" / 100));
                                GrossAmt := (1 + "VAT %" / 100) * Amt;
                            end;
                            TotalAmt += Amt;
                            TotalGrossAmt += GrossAmt;
                            VATAmount := TotalGrossAmt - TotalAmt;



                            if Type = Type::" " then begin
                                FormatTaxAmount := '';
                                FormatUnitPrice := '';
                                LineDiscountAmtFormat := '';
                                AmountFormat := ''
                            end else begin
                                FormatTaxAmount := '$ ' + FORMAT((GrossAmt - Amt), 0, '<Precision,2><sign><Integer Thousand><Decimals,3>');
                                FormatUnitPrice := '$ ' + FORMAT(("Unit Price"), 0, AutoFormat.ResolveAutoFormat(AutoFormatType::UnitAmountFormat, "Service Header"."Currency Code"));
                                LineDiscountAmtFormat := '$ ' + FORMAT(("Line Discount Amount"), 0, AutoFormat.ResolveAutoFormat(AutoFormatType::UnitAmountFormat, "Service Header"."Currency Code"));
                                AmountFormat := '$ ' + FORMAT((Amt), 0, AutoFormat.ResolveAutoFormat(AutoFormatType::UnitAmountFormat, "Service Header"."Currency Code"));
                            end;
                            if Type = Type::Item then begin
                                SerialNoText := "Service Item Serial No.";
                                MnfgItemNo := "QRS Mnfg ItemNo";
                                MnfgName := "QRS Mnfg Name";
                                CustomerRefNo := "Customer Ref No";
                            end else begin
                                SerialNoText := '';
                                MnfgItemNo := '';
                                MnfgName := '';
                                CustomerRefNo := '';
                            end;
                        end;

                        trigger OnPreDataItem()
                        begin
                            Clear(Amt);
                            Clear(GrossAmt);

                            TotalAmt := 0;
                            TotalGrossAmt := 0;
                            VATAmount := 0;

                        end;
                    }
                    dataitem(Totals; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(GrossAmt; '$ ' + FORMAT((GrossAmt), 0, '<Precision,2><sign><Integer Thousand><Decimals,3>'))
                        {

                        }
                        column(TotalAmt; '$ ' + FORMAT((TotalGrossAmt - VATAmount), 0, '<Precision,2><sign><Integer Thousand><Decimals,3>'))
                        {

                        }
                        column(TotalGrossAmt; '$ ' + FORMAT((TotalGrossAmt), 0, '<Precision,2><sign><Integer Thousand><Decimals,3>'))
                        {

                        }
                        column(VATAmount; '$ ' + FORMAT((VATAmount), 0, '<Precision,2><sign><Integer Thousand><Decimals,3>'))
                        {

                        }
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    end;

                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    if NoOfLoops <= 0 then
                        NoOfLoops := 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                IF "Language Code" <> '' then
                    CurrReport.Language := Language.GetLanguageID("Language Code");

                FormatAddressFields("Service Header");

                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");

                If PaymentTerms.Get("Service Header"."Payment Terms Code") then;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Service;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Service;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(ShowQty; ShowQty)
                    {
                        ApplicationArea = Service;
                        Caption = 'Amounts Based on';
                        OptionCaption = 'Quantity,Quantity Invoiced';
                        ToolTip = 'Specifies the amounts that the service order is based on.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get;
        ServiceSetup.Get;

        case ServiceSetup."Logo Position on Documents" of
            ServiceSetup."Logo Position on Documents"::"No Logo":
                ;
            ServiceSetup."Logo Position on Documents"::Left:
                CompanyInfo.CalcFields(Picture);
            ServiceSetup."Logo Position on Documents"::Center:
                begin
                    CompanyInfo1.Get;
                    CompanyInfo1.CalcFields(Picture);
                end;
            ServiceSetup."Logo Position on Documents"::Right:
                begin
                    CompanyInfo2.Get;
                    CompanyInfo2.CalcFields(Picture);
                end;
        end;
    end;

    var
        Text001: Label 'Service Order %1';
        Text002: Label 'Page %1';
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        ServiceSetup: Record "Service Mgt. Setup";
        RespCenter: Record "Responsibility Center";
        FormatTaxAmount: Text;
        AmountFormat: text;
        LineDiscountAmtFormat: Text;
        FormatUnitPrice: Text;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        recServiceLine: Record "Service Line";
        recServiceItem: Record "Service Item";
        PaymentTerms: Record "Payment Terms";
        ItemRec: Record Item;
        recItem: Record Item;
        Language: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        AutoFormatType: Enum "Auto Format";
        AutoFormat: Codeunit "Auto Format";
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        OutputNo: Integer;
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ShowShippingAddr: Boolean;
        CustAddr: array[8] of Text[100];
        BillToAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[120];
        DescriptionText: Text[150];
        ItemData: Code[20];
        Qty: Decimal;
        Amt: Decimal;
        ShowQty: Option Quantity,"Quantity Invoiced";
        GrossAmt: Decimal;
        TotalAmt: Decimal;
        TotalAllAmount: Decimal;
        VATAmount: Decimal;

        TotalGrossAmt: Decimal;
        SerialNoText: text;
        MnfgName: Text;
        MnfgItemNo: Text;
        CustomerRefNo: Text;
        Contract_No_CaptionLbl: Label 'Contract No.';
        Service_Header___Order_Date_CaptionLbl: Label 'Order Date';
        Invoice_toCaptionLbl: Label 'Invoice to';
        CompanyInfo__Phone_No__CaptionLbl: Label 'Phone No.';
        CompanyInfo__Fax_No__CaptionLbl: Label 'Fax No.';
        Service_Header___Phone_No__CaptionLbl: Label 'Phone No.';
        Service_Header___E_Mail_CaptionLbl: Label 'Email';
        Header_DimensionsCaptionLbl: Label 'Header Dimensions';
        Service_Item_LinesCaptionLbl: Label 'Service Item Lines';
        Service_Item_Line__Response_Date_CaptionLbl: Label 'Response Date';
        Service_Item_Line__Response_Time_CaptionLbl: Label 'Response Time';
        Fault_CommentsCaptionLbl: Label 'Fault Comments';
        Resolution_CommentsCaptionLbl: Label 'Resolution Comments';
        QtyCaptionLbl: Label 'Quantity';
        Service_LinesCaptionLbl: Label 'Service Lines';
        AmountCaptionLbl: Label 'Amount';
        Gross_AmountCaptionLbl: Label 'Gross Amount';
        TotalCaptionLbl: Label 'Total';
        Line_DimensionsCaptionLbl: Label 'Line Dimensions';
        Ship_to_AddressCaptionLbl: Label 'Ship-to Address';

    local procedure FormatAddressFields(var ServiceHeader: Record "Service Header")
    begin
        FormatAddr.GetCompanyAddr(ServiceHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.ServiceOrderSellto(CustAddr, ServiceHeader);
        FormatAddr.ServiceHeaderBillTo(BillToAddr, "Service Header");
        ShowShippingAddr := ServiceHeader."Ship-to Code" <> '';
        if ShowShippingAddr then
            FormatAddr.ServiceOrderShipto(ShipToAddr, ServiceHeader);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCalculateSalesTax(var ServiceHeader: Record "Service Header"; var ServiceLine: Record "Service Line"; var SalesTaxAmountLine: Record "Sales Tax Amount Line")
    begin
    end;
}

