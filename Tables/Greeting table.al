table 50103 "Greeting"
{
    Caption = 'Hilsen';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Greeting name"; Text[50])
        {
            Caption = 'Hilsen navn';
            DataClassification = ToBeClassified;
        }

        field(2; "Greeting text"; Text[250])
        {
            Caption = 'Hilsen tekst';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Greeting name")
        {
            Clustered = true;
        }
    }
}
