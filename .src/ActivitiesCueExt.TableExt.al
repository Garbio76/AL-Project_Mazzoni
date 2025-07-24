tableextension 50003 ActivitiesCueExt extends "Activities Cue"
{
    fields
    {
        field(50000; "Current Month Issued Reminders"; Integer)
        {
            Caption = 'Current Month Issued Reminders';
            FieldClass = FlowField;
            CalcFormula = count("Issued Reminder Header" where("Document Date" = filter('>=-CM')));
        }

        field(50001; "Unposted Electronic Invoices"; Integer)
        {
            Caption = 'Unposted Electronic Invoices';
            FieldClass = FlowField;
            CalcFormula = count("EOS Inb. EDoc. Header" where("EOS Status" = filter(Preview|"Purch. Header"|Warning|OK|"To Process")));
        }
    }
}