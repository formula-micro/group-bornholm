reportextension 50124 "Posted Sales Cr.Memo Ext" extends "Standard Sales - Credit Memo"
{
    WORDLayout = 'StandardSalesCreditMemoExtended.docx';

    dataset
    {
        add("Header")
        {
            column(Arrival_date; "Arrival date")
            {
            }

            column(Departure_date; "Departure date")
            {
            }

            column(Number_of_people; "Number of people")
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
        }
    }

    var
        ArrivalDateCaptionLbl: Label 'Ankomst';
        DepartureDateCaptionLbl: Label 'Afrejse';
        NumberOfPeopleCaptionLbl: Label 'Antal personer';
}
