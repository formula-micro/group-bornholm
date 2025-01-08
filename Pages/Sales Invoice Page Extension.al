namespace DefaultPublisher.ALProject1;
using Microsoft.Sales.Document;

pageextension 50111 "Sales Invoice Ext" extends "Sales Invoice"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Name"; Rec."Name")
            {
                ApplicationArea = All;
            }

            field("Arrival date"; Rec."Arrival Date")
            {
                ApplicationArea = All;
            }

            field("Departure date"; Rec."Departure Date")
            {
                ApplicationArea = All;
            }

            field("Number of people"; Rec."Number of People")
            {
                ApplicationArea = All;
            }

            field("District"; Rec."District")
            {
                ApplicationArea = All;
            }

            // Lookup for Greeting
            field("Greeting name"; Rec."Greeting name")
            {
                ApplicationArea = All;
                Lookup = true;
                // DrillDown = true;
                // DrillDownPageId = "Greeting List";
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        if Rec."District" = '' then begin
            Rec."District" := 'Bornholm'; // Deafault value
        end;
    end;

    var
        GreetingRec: Record "Greeting"; // Reference to Greeting table
}