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
            var
            begin
                // Retrieve more information about the current company bank account.
                IF BankAccountRec.Get("Company Bank Account Code") THEN BEGIN END;

                // Retrieve more information about the current greeting.
                IF GreetingRec.Get("Greeting name") THEN BEGIN END;

                // Build reminder message.
                MessageLine1 := 'Vi beder dig senest den ' + Format("Due Date") + ' indbetale ' + "Currency Code" + ' ' + Format("Amount Including VAT", 0, 0) + ' til bankkonto ' + BankAccountRec."Bank Account No.";
                MessageLine2 := 'Oplys venligst kundenummer ' + "Sell-to Customer No." + ' og fakturanummer ' + "No." + ' på din betaling.';
            end;
        }
    }

    labels
    {
        NameLbl = 'Navn';
        DistrictLbl = 'Afdeling';
        ArrivalDateLbl = 'Ankomst';
        DepartureDateLbl = 'Afrejse';
        NumberOfPeopleLbl = 'Antal personer';
        InvoiceDateLbl = 'Fakturadato';
        InvoiceAmountLbl = 'Fakturabeløb';
        TravelGuaranteeLbl = 'Rejsegarantifonden nr.';
        UnitPriceLbl = 'Pris';
        LineAmountLbl = 'Beløb';
        IncludingVATLbl = 'Heraf moms';
    }

    var
        BankAccountRec: Record "Bank Account";
        GreetingRec: Record "Greeting";
        MessageLine1: Text;
        MessageLine2: Text;

    procedure FormatDate(DateValue: Date): Text[100]
    begin
        exit(Format(DateValue, 0, '<Day,2>-<Month,2>-<Year>'));
    end;
}
