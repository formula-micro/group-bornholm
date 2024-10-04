tableextension 50103 "Sales Cr.Memo Ext" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50100; "Arrival date"; Date) { }

        field(50101; "Departure date"; Date)
        {
            trigger OnValidate()
            begin
                if ("Departure date" < "Arrival date") then
                    Error(ErrormmessageLbl);
            end;
        }

        field(50102; "Number of people"; Text[250]) { }

        field(50103; "Name"; Text[50]) { }

        field(50104; "District"; Text[50]) { }
    }

    var
        ErrormmessageLbl: Label 'The departure date cannot be earlier than the arrival date.';
}