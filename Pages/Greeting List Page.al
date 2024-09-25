page 50110 "Greeting List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Greeting";
    CardPageID = "Greeting Card";
    Caption = 'Kunde hilsener';
    Editable = false;
    Permissions = TableData 112 = rimd;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Name"; Rec."Greeting name")
                {
                    ApplicationArea = All;
                    Caption = 'Navn';
                }

                field("greeting text"; Rec."Greeting text")
                {
                    ApplicationArea = All;
                    Caption = 'Hilsen tekst';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action("New greeting")
            {
                ApplicationArea = All;
                Caption = 'Nyt Hilsen';
                Image = New;
                RunObject = Page "Greeting Card";
                RunPageLink = "Greeting name" = field("Greeting name");
            }
        }
    }
}
