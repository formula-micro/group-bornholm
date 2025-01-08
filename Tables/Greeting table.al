table 50103 "Greeting"
{
    DataClassification = ToBeClassified;
    DrillDownPageID = "Greeting List";
    LookupPageID = "Greeting List";

    fields
    {
        field(1; "Greeting name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Greeting text"; Text[500])
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
