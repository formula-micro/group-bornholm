page 50111 "Greeting Card"
{
    Caption = 'Hilsen Kort';
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
                    Caption = 'Navn';
                }

                field("Greeting text"; Rec."Greeting text")
                {
                    ApplicationArea = All;
                    Caption = 'Hilsen tekst';
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
                Caption = 'Gem';
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
