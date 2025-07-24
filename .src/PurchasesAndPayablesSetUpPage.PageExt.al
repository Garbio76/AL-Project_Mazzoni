pageextension 50000 PurchasesAndPayablesSetUpPage extends "Purchases & Payables Setup"
{
    layout


    {
        addlast(General)
        {
            field("Doc/Post Date After Wrk Date"; Rec."Doc./Post. Date After Wrk Date")
            {
                Caption = 'Impedisci data doc./reg. successiva alla workdate';
                ToolTip = 'Specifica se impedire che la data documento e/o data registrazione sia successiva alla data di lavoro';
                ApplicationArea = All;
            }
            
        }
        
    }

}