reportextension 50124 "Posted Sales Cr.Memo Ext" extends "Standard Sales - Credit Memo"
{
    WORDLayout = 'Group Bornholm Kreditnota.docx';

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
            begin
                // Retrieve more information about the current company bank account.
                IF BankAccountRec.Get("Company Bank Account Code") THEN BEGIN END;
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
        IncludingVATLine: Text;
        IncludingVATLineLbl: Label '(including VAT %1)';

    procedure FormatDate(DateValue: Date): Text[100]
    begin
        exit(Format(DateValue, 0, '<Day,2>-<Month,2>-<Year>'));
    end;
}
