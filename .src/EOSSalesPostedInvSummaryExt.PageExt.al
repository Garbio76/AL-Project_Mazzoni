namespace AL_Project_Mazzoni.Default_Publisher;
using Microsoft.Sales.History;
pageextension 50002 EOSSalesPostedInvSummaryExt extends "EOS Sales Posted Inv Summary"
{
    layout
    {
        addafter("Document No.")
        {
            field("EOS Shipment No."; CdEOSShipmentNo)
            {
                ApplicationArea = All;
                Caption = 'Nr. spedizione CWS';
                ToolTip = 'Specifica il nr. di spedizione CWS registrato';
                Editable = false;
                Visible = true;

            }
        }
        // Add changes to page layout here
    }
    trigger OnAfterGetRecord()
    begin
        case Rec.Type of
            Rec.Type::" ",
            Rec.Type::"Allocation Account",
            Rec.Type::"Fixed Asset",
            Rec.Type::Resource:
                CdEOSShipmentNo := '';
        end;
        case Rec.Type of
            Rec.Type::"G/L Account",
            Rec.Type::Item:
                if Rec."Shipment No." <> '' then
                    if lRcSalesShipmentLine.Get(Rec."Shipment No.", Rec."Shipment Line No.") then
                        CdEOSShipmentNo := lRcSalesShipmentLine."EOS Shipment No.";
        end;
    end;
    var
        lRcSalesShipmentLine: Record "Sales Shipment Line";
        CdEOSShipmentNo: Code[20];
}
