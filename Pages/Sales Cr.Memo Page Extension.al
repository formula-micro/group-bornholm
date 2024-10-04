pageextension 50112 "Sales Cr.Memo Ext" extends "Sales Credit Memo"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Name"; Rec."Name")
            {
                ApplicationArea = Basic, Suite;
            }

            field("Arrival date"; Rec."Arrival date")
            {
                ApplicationArea = Basic, Suite;
            }

            field("Departure date"; Rec."Departure date")
            {
                ApplicationArea = Basic, Suite;
            }

            field("Number of people"; Rec."Number of people")
            {
                ApplicationArea = Basic, Suite;
            }

            field("District"; Rec."District")
            {
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Rec."District" = '' then begin
            Rec."District" := 'Bornholm'; // Deafault value
        end;
    end;
}