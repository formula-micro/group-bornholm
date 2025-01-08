pageextension 50113 "Posted Sales Invoice Ext" extends "Posted Sales Invoice"
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

            field("Greeting name"; Rec."Greeting name")
            {
                ApplicationArea = All;
                Lookup = true;
                TableRelation = "Greeting"."Greeting name";
            }
        }
    }
    var
        GreetingRec: Record "Greeting"; // Reference to the Greeting table
}