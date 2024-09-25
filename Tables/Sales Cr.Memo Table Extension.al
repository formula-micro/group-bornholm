tableextension 50103 "Sales Cr.Memo Ext" extends "Sales Cr.Memo Header"
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
    }
}