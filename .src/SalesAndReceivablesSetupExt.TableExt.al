namespace AL_Project_Mazzoni.Default_Publisher;
using Microsoft.Sales.Setup;
tableextension 50001 SalesAndReceivablesSetupExt extends "Sales & Receivables Setup"
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