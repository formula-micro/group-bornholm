table 50103 "Greeting"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Greeting name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Greeting text"; Text[250])
        {
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
