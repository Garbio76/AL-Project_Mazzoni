namespace AL_Project_Mazzoni.Default_Publisher;
using Microsoft.Sales.Receivables;
using Microsoft.Sales.Reminder;
pageextension 50006 CustomerLedgerEntries extends "Customer Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field("Severity Level"; ISeverityLevel)

            {
                ApplicationArea = All;
                Caption = 'Livello severità ultimo sollecito emesso';
                ToolTip = 'Specifica il livello di severità dell''ultimo soll. emesso';
                Editable = false;
            }
            field("Latest Issued Reminder No."; rec."Latest Issued Reminder No.")
            {
                ApplicationArea = All;
                Caption = 'Nr. ultimo sollecito emesso';
                ToolTip = 'Specifica il nr. ultimo sollecito emesso';
                Editable = false;
            }
            field("Latest Issued Reminder Date"; DtLatestIssuedRemDate)
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
        lRcIssuedRemHeader: Record "Issued Reminder Header";
        ISeverityLevel: Integer;
        DtLatestIssuedRemDate: Date;
    trigger OnAfterGetRecord()

    begin
        if lRcIssuedRemHeader.Get(Rec."Latest Issued Reminder No.") then begin
            DtLatestIssuedRemDate := lRcIssuedRemHeader."Document Date";
            ISeverityLevel := lRcIssuedRemHeader."Reminder Level";
        end
        else begin
            DtLatestIssuedRemDate := 0D;
            ISeverityLevel := 0;
        end;
    end;
}
