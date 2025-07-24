pageextension 50003 O365ActivitiesExt extends "O365 Activities"
{
    layout
    {
        addafter(Payments)
        {
            cuegroup(MyCues)
            {
                field("Current Month Issued Reminders"; Rec."Current Month Issued Reminders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Solleciti mese corrente';
                    ToolTip = 'Specifica il numero di solleciti emessi nel mese corrente';
                    DrillDownPageId = "Issued Reminder List";
                    Image = Cash;
                }

                field("Unposted Electronic Invoices"; Rec."Unposted Electronic Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'FTE ricevute non registrate';
                    ToolTip = 'Specifica le FTE ricevute non registrate';
                    DrillDownPageId = "EOS Inb. Electr. Document List";
                    Image = Document;
                    }
            }
        }
    }
}
