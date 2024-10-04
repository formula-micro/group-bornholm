page 50110 "Greeting List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Greeting";
    CardPageID = "Greeting Card";
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
                }

                field("greeting text"; Rec."Greeting text")
                {
                    ApplicationArea = All;
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
                Image = New;
                RunObject = Page "Greeting Card";
                RunPageLink = "Greeting name" = field("Greeting name");
            }
        }
    }
}
