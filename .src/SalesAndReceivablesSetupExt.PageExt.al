namespace AL_Project_Mazzoni.Default_Publisher;
using Microsoft.Sales.Setup;
pageextension 50001 SalesAndReceivablesSetupExt extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(General)
        {
            field("Same Doc./Occurr./Post. Date"; rec."Same Doc./Occurr./Post. Date")
            {
                ApplicationArea = All;
                Caption = 'Stessa data documento/esec. operazione/registrazione';
                ToolTip = 'Specifica se si vuole controllare che la data doc., data es. op. e la data reg. siano tutte uguali';
            }
        }
    }
}