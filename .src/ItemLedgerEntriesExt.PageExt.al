namespace AL_Project_Mazzoni.Default_Publisher;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Ledger;
#pragma warning disable AA0247
pageextension 50004 ItemLedgerEntriesExt extends "Item Ledger Entries"
#pragma warning restore AA0247
{
    layout
    {
        addafter(Quantity) // Add changes to page layout here

        {
            field("Base UoM Code"; CBaseUoM)
            {
                Caption = 'Cod. unità di misura base';
                ToolTip = 'Visualizza l''unità di misura di base dell''articolo';
                ApplicationArea = All;
                Editable = false;
            }
        }
        addafter("Qty. per Unit of Measure")
        {
            field("Qty. per SoM"; DcQtyPerSoM)
            {
                Caption = 'Qtà per unità di misura effetiva del mov.';
                ToolTip = 'Visualizza la quantità per unità di misura effettiva del movimento';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
    var
        RcItem: Record "Item";
        CBaseUoM: Code[10];
        DcQtyPerSoM: Decimal;

    trigger OnAfterGetRecord()
    begin
        if RcItem.Get(Rec."Item No.") then begin
            CBaseUoM := RcItem."Base Unit of Measure";
            DcQtyPerSoM := Rec.Quantity / Rec."Qty. per Unit of Measure"
        end;
    end;
}