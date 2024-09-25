tableextension 50102 "Sales Invoice Header Ext" extends "Sales Invoice Header"
{
    fields
    {

        field(50100; "Arrival date"; Date)
        {
            Caption = 'Ankomst';
        }

        field(50101; "Departure date"; Date)
        {
            Caption = 'Afrejse';

            trigger OnValidate()
            begin
                if ("Departure date" < "Arrival date") then
                    Error('Afrejsedato kan ikke være tidligere end ankomstdato.');
            end;
        }

        field(50102; "Number of people"; Text[250])
        {
            Caption = 'Antal personer';
        }

        field(50103; "Name"; Text[50])
        {
            Caption = 'Navn';
        }

        field(50104; "District"; Text[50])
        {
            Caption = 'Afdeling';
        }

        field(50105; "Greeting name"; Text[50])
        {
            Caption = 'Hilsen navn';
        }

        field(50106; "Greeting text"; Text[250])
        {
            Caption = 'Hilsen tekst';
        }
    }
}
