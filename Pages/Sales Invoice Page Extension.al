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
                Caption = 'Navn';
            }

            field("Arrival date"; Rec."Arrival Date")
            {
                ApplicationArea = All;
                Caption = 'Ankomst';
            }

            field("Departure date"; Rec."Departure Date")
            {
                ApplicationArea = All;
                Caption = 'Afrejse';
            }

            field("Number of people"; Rec."Number of People")
            {
                ApplicationArea = All;
                Caption = 'Antal Personer';
            }

            field("District"; Rec."District")
            {
                ApplicationArea = All;
                Caption = 'Afdeling';
            }

            // Lookup for Greeting
            field("Greeting name"; Rec."Greeting name")
            {
                ApplicationArea = All;
                Lookup = true;
                Caption = 'Hilsen';
                TableRelation = "Greeting"."Greeting name";

                trigger OnValidate();
                begin
                    if Rec."Greeting name" <> '' then begin
                        if GreetingRec.Get(Rec."Greeting name") then begin
                            Rec.Validate("Greeting name", GreetingRec."Greeting name");
                        end;
                    end;
                end;
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