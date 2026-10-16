namespace AL_Project_Mazzoni.Default_Publisher;
using Microsoft.Sales.History;
pageextension 50002 EOSSalesPostedInvSummaryExt extends "EOS Sales Posted Inv Summary"
{
    layout
    {
        addlast("Sales Lines")
        {
            field("EOS Shipment No."; CdEOSShipmentNo)
            {
                ApplicationArea = All;
                Caption = 'Nr. spedizione CWS';
                ToolTip = 'Specifica il nr. di spedizione CWS';
                Editable = false;
                Visible = true;

            }
        }
        // Add changes to page layout here
    }
    trigger OnAfterGetRecord()
    begin
        if Rec."Shipment No." <> '' then
            if lRcSalesShipmentLine.Get(Rec."Shipment No.", Rec."Shipment Line No.") then
                CdEOSShipmentNo := lRcSalesShipmentLine."EOS Shipment No.";
    end;

    var
        lRcSalesShipmentLine: Record "Sales Shipment Line";
        CdEOSShipmentNo: Code[20];
}
