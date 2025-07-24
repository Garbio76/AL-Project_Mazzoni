tableextension 50001 SalesAndReceivablesSetupTable extends "Sales & Receivables Setup"
{

    fields
    {
        field(50000; "Same Doc./Occurr./Post. Date"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Stessa data doc./esec. op./reg.';
        }
    }

}