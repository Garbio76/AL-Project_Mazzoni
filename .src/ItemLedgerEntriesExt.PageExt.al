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
                Caption = 'Qtà per unità di misura secondaria';
                ToolTip = 'Visualizza la quantità per unità di misura secondaria dell''articolo';
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
            ;
            CBaseUoM := RcItem."Base Unit of Measure"
        end;

        if (CBaseUoM = Rec."Unit of Measure Code") then
            DcQtyPerSoM := 0
        else
            DcQtyPerSoM := Rec.Quantity / Rec."Qty. per Unit of Measure"
    end;

}

