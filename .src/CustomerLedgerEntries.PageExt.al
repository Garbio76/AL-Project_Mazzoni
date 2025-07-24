pageextension 50002 CustomerLedgerEntries extends "Customer Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {

            field("Latest Issued Reminder No."; rec."Latest Issued Reminder No.")

            {
                ApplicationArea = All;
                Caption = 'Nr. ultimo sollecito emesso';
                ToolTip = 'Specifica il nr. ultimo sollecito emesso';
                Editable = false;
            }
            field("Latest Issued Reminder Date"; rec."Latest Issued Reminder Date")
            {
                ApplicationArea = All;
                Caption = 'Data ultimo sollecito emesso';
                ToolTip = 'Specifica la data ultimo sollecito emesso';
                Editable = false;

            }
            field("Internal Salesperson Code"; rec."Internal Salesperson Code")

            {
                ApplicationArea = All;
                Caption = 'Canale vendita interno';
                ToolTip = 'Specifica il canale di vendite interno';
                Editable = false;
            }
        }
    }
    var
        lRcRemFinChaEntRec: Record "Reminder/Fin. Charge Entry";

        
        trigger OnAfterGetRecord()

    begin

        lRcRemFinChaEntRec.Reset();
        lRcRemFinChaEntRec.SetRange("No.", rec."Latest Issued Reminder No.");
            If lRcRemFinChaEntRec.FindLast() then
            rec."Latest Issued Reminder Date" := lRcRemFinChaEntRec."Document Date";

    end;

}
