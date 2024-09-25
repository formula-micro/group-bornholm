reportextension 50124 "Posted Sales Cr.Memo Ext" extends "Standard Sales - Credit Memo"
{
    WORDLayout = 'StandardSalesCreditMemoExtended.docx';

    dataset
    {
        add("Header")
        {
            column(Name; "Name")
            {
            }
            column(Arrival_date; FormatDate("Arrival date"))
            {
            }

            column(Departure_date; FormatDate("Departure date"))
            {
            }

            column(Number_of_people; "Number of people")
            {
            }

            column(District; "District")
            {
            }

            column(InvoiceMessagePart1; GetInvoiceMessagePart1("Due Date", "Currency Code", "Amount Including VAT", "Company Bank Account Code"))
            {
            }

            column(InvoiceMessagePart2; GetInvoiceMessagePart2("Sell-to Customer No.", "No."))
            {
            }

            column(NameCaption; NameCaptionLbl)
            {
            }

            column(DistrictCaption; DistrictCaptionLbl)
            {
            }
            column(ArrivalDateCaption; ArrivalDateCaptionLbl)
            {
            }

            column(DepartureDateCaption; DepartureDateCaptionLbl)
            {
            }

            column(NumberOfPeopleCaption; NumberOfPeopleCaptionLbl)
            {
            }

            column(InvoiceDateCaption; InvoiceDateCaptionLbl)
            {
            }

            column(InvoiceAmountCaption; InvoiceAmountCaptionLbl)
            {
            }
            column(TravelGuaranteeCaption; TravelGuaranteeCaptionLbl)
            {
            }

            column(UnitPriceCaption; UnitPriceCaptionLbl)
            {
            }

            column(LineAmountCaption; LineAmountCaptionLbl)
            {
            }

            column(IncludingVATCaption; IncludingVATCaptionLbl)
            {
            }
        }
    }

    procedure FormatDate(DateValue: Date): Text[100]
    begin
        exit(FORMAT(DateValue, 0, '<Day,2>-<Month,2>-<Year>'));
    end;

    procedure GetInvoiceMessagePart1(DueDate: Date; CurrencyCode: Code[10]; TotalAmount: Decimal; CompanyBankAccountNo: Code[20]): Text[250]
    var
        FormattedDueDate: Text[10];
    begin
        FormattedDueDate := Format(DueDate, 0, 0);
        exit('Vi beder dig senest den ' + FormattedDueDate + ' indbetale ' + CurrencyCode + ' ' + Format(TotalAmount, 0, 0) + ' til bankkonto ' + CompanyBankAccountNo);
    end;

    procedure GetInvoiceMessagePart2(SellToCustomerNo: Code[20]; No: Code[20]): Text[250]
    begin
        exit('Oplys venligst kundenummer ' + SellToCustomerNo + ' og kreditnotanummer ' + No + ' på din betaling.');
    end;


    var
        NameCaptionLbl: Label 'Navn';
        DistrictCaptionLbl: Label 'District';
        ArrivalDateCaptionLbl: Label 'Ankomst';
        DepartureDateCaptionLbl: Label 'Afrejse';
        NumberOfPeopleCaptionLbl: Label 'Antal personer';
        InvoiceDateCaptionLbl: Label 'Fakturadato';
        InvoiceAmountCaptionLbl: Label 'Fakturabeløb';
        TravelGuaranteeCaptionLbl: Label 'Rejsegarantifonden nr. ';
        UnitPriceCaptionLbl: Label 'Pris';
        LineAmountCaptionLbl: Label 'Beløb';
        IncludingVATCaptionLbl: Label 'Heraf moms';
}
