page 50111 "Greeting Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Greeting";
    RefreshOnActivate = true;


    layout
    {
        area(content)
        {
            group(Detaljer)
            {
                field("Name"; Rec."Greeting name")
                {
                    ApplicationArea = All;
                }

                field("Greeting text"; Rec."Greeting text")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Save")
            {
                ApplicationArea = All;
                Image = Save;

                trigger OnAction();
                begin
                    Rec.Validate("Greeting text");
                    Rec.Modify(true);
                    CurrPage.Close();
                end;
            }
        }
    }
}
