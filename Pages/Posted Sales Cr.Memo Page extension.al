pageextension 50114 "Posted Cr.Memo Ext" extends "Posted Sales Credit Memo"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Name"; Rec."Name")
            {
                ApplicationArea = Basic, Suite;
            }

            field("District"; Rec."District")
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
        }
    }
}