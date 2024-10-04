reportextension 50123 "Posted Sales Invoice Ext" extends "Standard Sales - Invoice"
{
    WORDLayout = 'StandardSalesInvoiceExtended.docx';

    dataset
    {
        add("Header")
        {
            column(Name; "Name") { }
            column(Arrival_date; FormatDate("Arrival date")) { }
            column(Departure_date; FormatDate("Departure date")) { }
            column(Document_Date; FormatDate("Document Date")) { }
            column(Due_Date; FormatDate("Due Date")) { }
            column(Number_of_people; "Number of people") { }
            column(District; "District") { }
            column(MessageLine1; MessageLine1) { }
            column(MessageLine2; MessageLine2) { }
            column(Greeting; GreetingRec."Greeting text") { }
        }

        modify("Header")
        {
            trigger OnAfterAfterGetRecord()
            begin
                // Retrieve more information about the current company bank account.
                IF BankAccountRec.Get("Company Bank Account Code") THEN BEGIN END;

                // Retrieve more information about the current greeting.
                IF GreetingRec.Get("Greeting name") THEN BEGIN END;

                // Build reminder message.
                MessageLine1 := StrSubstNo(MessageLine1Lbl, FormatDate("Due Date"), "Currency Code", Format("Amount Including VAT", 0, 0), BankAccountRec."Bank Account No.");
                MessageLine2 := StrSubstNo(MessageLine2Lbl, "Sell-to Customer No.", "No.");
            end;
        }

        add(Totals)
        {
            column(IncludingVATLine; IncludingVATLine) { }
        }

        modify(Totals)
        {
            trigger OnAfterAfterGetRecord()
            begin
                if "TotalAmountVAT" <> 0 then
                    IncludingVATLine := StrSubstNo(IncludingVATLineLbl, Format("TotalAmountVAT", 0, 0))
                else
                    IncludingVATLine := ''; // Ensure the line is empty if there's no VAT amount
            end;
        }
    }

    labels
    {
        NameLbl = 'Name';
        DistrictLbl = 'District';
        ArrivalDateLbl = 'Arrival';
        DepartureDateLbl = 'Departure';
        NumberOfPeopleLbl = 'Number of people';
        InvoiceDateLbl = 'Invoice date';
        InvoiceAmountLbl = 'Invoice amount';
        TravelGuaranteeLbl = 'Travel Guarantee Fund No.';
        UnitPriceLbl = 'Price';
        LineAmountLbl = 'Amount';
    }

    var
        BankAccountRec: Record "Bank Account";
        GreetingRec: Record "Greeting";
        MessageLine1: Text;
        MessageLine2: Text;
        MessageLine1Lbl: Label 'Please make a payment of %2 %3 to bank account %4 by %1.'; // %1: Due Date, %2: Currency, %3: Amount, %4: Bank Account
        MessageLine2Lbl: Label 'Please state customer number %1 and invoice number %2 on your payment.'; // %1: Customer No., %2: Invoice No.
        IncludingVATLine: Text;
        IncludingVATLineLbl: Label 'including VAT %1';

    procedure FormatDate(DateValue: Date): Text[100]
    begin
        exit(Format(DateValue, 0, '<Day,2>-<Month,2>-<Year>'));
    end;
}
