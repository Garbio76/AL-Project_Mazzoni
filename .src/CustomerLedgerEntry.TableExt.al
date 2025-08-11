tableextension 50002 CustomerLedgerEntry extends "Cust. Ledger Entry"
{
    fields
    {

        field(50000; "Latest Issued Reminder No."; Code[20])
        {
            Caption = 'Nr. ultimo sollecito emesso';
            FieldClass = FlowField;
            CalcFormula = max("Reminder/Fin. Charge Entry"."No." where("Document No." = field("Document No."),
            "Reminder Level" = field("Last Issued Reminder Level")));
        }

        field(50001; "Internal Salesperson Code"; Code[20])
        {
            Caption = 'Cod. canale di vendita interno';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."Internal Salesperson Code" where("No." = field("Customer No.")));
        }

    }


}