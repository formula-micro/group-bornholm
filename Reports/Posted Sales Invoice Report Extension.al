reportextension 50123 "Posted Sales Invoice Ext" extends "Standard Sales - Invoice"
{
    WORDLayout = 'StandardSalesInvoiceExtended.docx';

    dataset
    {
        add("Header")
        {
            column(Name; "Name") { }
            column(ArrivalDate; FormatDate("Arrival date")) { }
            column(DepartureDate; FormatDate("Departure date")) { }
            column(Document_Date; FormatDate("Document Date")) { }
            column(Due_Date; FormatDate("Due Date")) { }
            column(NumberOfPeople; "Number of people") { }
            column(District; "District") { }
            column(MessageLine1; MessageLine1) { }
            column(MessageLine2; MessageLine2) { }
            column(Greeting_text; GreetingRec."Greeting text") { }
            column(NameLbl; NameLbl) { }
            column(ArrivalDateLbl; ArrivalDateLbl) { }
            column(DepartureDateLbl; DepartureDateLbl) { }
            column(NumberOfPeopleLbl; NumberOfPeopleLbl) { }
            column(InvoiceDateLbl; InvoiceDateLbl) { }
            column(InvoiceAmountLbl; InvoiceAmountLbl) { }
            column(TravelGuaranteeLbl; TravelGuaranteeLbl) { }
            column(UnitPriceLbl; UnitPriceLbl) { }
            column(LineAmountLbl; LineAmountLbl) { }
            column(CustomerNoLbl; CustomerNoLbl) { }
        }

        modify("Header")
        {
            trigger OnAfterAfterGetRecord()
            var
                GeneralLedgerSetupRec: Record "General Ledger Setup";
                CurrencyCode: Code[10];
                BankAccount: Text[50];
                Swift: Text[50];
                Iban: Text[50];
                Builder: TextBuilder;
            begin
                // Retrieve the company bank account information.
                IF BankAccountRec.Get("Company Bank Account Code") THEN BEGIN END;
                BankAccount := BankAccountRec."Bank Account No.";
                Builder.Append(BankAccount);

                IF BankAccountRec."Bank Account No." = '' THEN BEGIN
                    Builder.AppendLine();
                    Swift := '*SWIFT: ' + BankAccountRec."SWIFT Code";
                    Builder.AppendLine(Swift);
                    Iban := '*IBAN:   ' + BankAccountRec.IBAN;
                    Builder.Append(Iban);
                END;

                // Retrieve more information about the current greeting.
                IF GreetingRec.Get("Greeting name") THEN BEGIN END;

                // Check currency code and retrieve LCY Code if necessary
                IF GeneralLedgerSetupRec.Get() THEN BEGIN END;
                CurrencyCode := "Currency Code";
                IF CurrencyCode = '' THEN
                    CurrencyCode := GeneralLedgerSetupRec."LCY Code";

                // Build reminder message.
                MessageLine1 := StrSubstNo(MessageLine1Lbl, FormatDate("Due Date"), CurrencyCode, Format("Amount Including VAT", 0, 0), Builder.ToText());
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

    }

    var
        NameLbl: Label 'Name';
        ArrivalDateLbl: Label 'Arrival';
        DepartureDateLbl: Label 'Departure';
        NumberOfPeopleLbl: Label 'Number of people';
        InvoiceDateLbl: Label 'Invoice date';
        InvoiceAmountLbl: Label 'Invoice amount';
        TravelGuaranteeLbl: Label 'Travel Guarantee Fund No.';
        UnitPriceLbl: Label 'Price';
        LineAmountLbl: Label 'Amount';
        CustomerNoLbl: Label 'Customer No.';
        BankAccountRec: Record "Bank Account";
        GreetingRec: Record "Greeting";
        MessageLine1: Text;
        MessageLine2: Text;
        MessageLine1Lbl: Label 'Please make a payment of %2 %3 by %1 to our bank account: %4'; // %1: Due Date, %2: Currency, %3: Amount, %4: Bank Account or Swift/Iban
        MessageLine2Lbl: Label 'Please state customer number %1 and invoice number %2 on your payment.'; // %1: Customer No., %2: Invoice No.
        IncludingVATLine: Text;
        IncludingVATLineLbl: Label '"including VAT %1"';

    procedure FormatDate(DateValue: Date): Text[100]
    begin
        exit(Format(DateValue, 0, '<Day,2>-<Month,2>-<Year>'));
    end;
}
